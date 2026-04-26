package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.*;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.did.request.ConfirmDidRequest;
import com.chon.api.model.did.request.EnrollDidRequest;
import com.chon.api.model.did.request.SubmitDidRequest;
import com.chon.api.model.did.response.SubmitDidResponse;
import com.chon.api.model.identifier.*;
import com.chon.api.model.link.VerifyLinkModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.verify.VerifyConfirmModel;
import com.chon.api.model.verify.VerifyRejectModel;
import com.chon.api.model.verify.VerifySignatureInfoReqModel;
import com.chon.api.repository.*;
import com.chon.api.service.*;
import com.chon.api.utils.*;
import com.chon.api.utils.mapper.ModelMapperUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.utils.Numeric;

import java.io.UnsupportedEncodingException;
import java.security.PrivateKey;
import java.util.*;


@Service
@Log4j2
public class VerifyServiceImpl implements VerifyService {

    @Autowired
    private VerifyContactRepository verifyContactRepository;

    @Autowired
    private RelationUsersRepository relationUsersRepository;

    @Autowired
    private RedirectService redirectService;

    @Autowired
    private CardInfoService cardInfoService;

    @Autowired
    private PointerVerifyRepository pointerVerifyRepository;

    @Autowired
    private CardInfoRepository cardInfoRepository;

    @Autowired
    private UsersContext usersContext;

    @Autowired
    private ClanRepository clanRepository;

    @Autowired
    private TaekwondoRepository taekwondoRepository;

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private ClanService clanService;
    @Autowired
    private TaeKwondoService taeKwondoService;
    @Autowired
    private UsersRepository usersRepository;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private DIDService didService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public MessModel confirm(VerifyConfirmModel request) throws Exception {
        List<CardInfoEntity> cardInfoList = cardInfoRepository.findAllByUserIdAndIsDelete(usersContext.getCurrentUserId(), ECommon.TYPE_DELETE.UN_DELETE.value);
        if (cardInfoList == null)
            throw new IAException(ErrConstans.CARD_INFO_NOT_EXIST);
        CardInfoEntity cardInfoEntity = cardInfoList.getFirst();
        String phoneNumber = cardInfoEntity.getPhoneNumber();
        RelationUsersEntity relationUsersEntity = relationUsersRepository.findByCertOwnerIdAndCertRelatedPhone(
                request.getRefVerifyId(),
                phoneNumber);
        if (relationUsersEntity == null)
            throw new IAException(ErrConstans.VERIFY_CONTACT_NOT_EXIST);
        if (!Objects.equals(ECommon.VERIFY_CONTRACT_STT.UN_VERIFY.value, relationUsersEntity.getStatus()))
            throw new IAException(ErrConstans.VERIFY_CONTACT_VERIFIED);
        ///  doi trang thai verifier
//            Long refTier = relationUsersEntity.getRefTier();
//          /// lấy điểm theo verify type trong bảng verify point để cộng vào các bảng info
//            PointVerifyEntity pointVerifyEntity = pointerVerifyRepository.findByVerifyTypeAndRefTier(request.getVerifyType(), refTier);
//            Long point = pointVerifyEntity.getPoint();
        Long point = appProperties.verifyPoint;
        ///  cong diem cho ref_verify
        CardInfoEntity cardInfo = cardInfoRepository.findById(request.getRefVerifyId())
                .orElseThrow(() -> new IAException(ErrConstans.CARD_INFO_NOT_EXIST));
        Long pointCard = cardInfo.getPointVerify() + point;
        cardInfo.setPointVerify(pointCard);
        if (pointCard >= appProperties.maxVerifyPoint && StringBaseUtils.isNullOrEmpty(cardInfo.getDigitalSignature())) {
            /// ký số
            String rawData = GenRawDataUtils.genCardRawData(cardInfo);
            // 1. Tạo khóa RSA
//                KeyPair keyPair = CryptoUtil.generateECDSAKeyPair();
//                String publicKeyStr = CryptoUtil.bytesToHex(keyPair.getPublic().getEncoded());
//                String privateKeyStr = CryptoUtil.bytesToHex(keyPair.getPrivate().getEncoded());

            //2. Mã hóa publicKey -> DID
            ECKeyPair keyPairEthr = Keys.createEcKeyPair();

            String didPrivateKey = Numeric.toHexStringNoPrefixZeroPadded(keyPairEthr.getPrivateKey(), 64);
            String didPublicKey = "04" + Numeric.toHexStringNoPrefixZeroPadded(keyPairEthr.getPublicKey(), 128);
            String did = DidBaseUtils.calcDid(Numeric.hexStringToByteArray(didPublicKey));
            cardInfo.setVerifyDid(did);

            // 3. Hash dữ liệu
            String hashedData = CryptoUtil.hashCardInfo(rawData);

            // 4. Ký dữ liệu
//                String signature = CryptoUtil.signData(hashedData, keyPair.getPrivate());
//                cardInfo.setPublicKey(publicKeyStr);
//                cardInfo.setPrivateKey(privateKeyStr);
            // ky bang private key moi
            String signature = CryptoUtil.signDataVer2(hashedData, didPrivateKey);
            String txId = integrationDID(didPublicKey, didPrivateKey, signature, did);
            cardInfo.setPrivateKey(didPrivateKey);
            cardInfo.setPublicKey(didPublicKey);
            cardInfo.setDigitalSignature(signature);
            cardInfo.setStatus(ECommon.DIGITAL_SIGNATURE.YES.value);
            cardInfo.setBlockHeight(categoryService.generateBlockHeight());
            cardInfo.setTxId(txId);
            cardInfo.setVerifyDate(new Date());

        }
        cardInfoRepository.save(cardInfo);

        relationUsersEntity.setStatus(ECommon.VERIFY_CONTRACT_STT.APPROVE.value);
        relationUsersRepository.save(relationUsersEntity);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public MessModel reject(VerifyRejectModel request) {
        List<CardInfoEntity> cardInfoList = cardInfoRepository.findAllByUserIdAndIsDelete(usersContext.getCurrentUserId(), ECommon.TYPE_DELETE.UN_DELETE.value);
        if (cardInfoList == null)
            throw new IAException(ErrConstans.CARD_INFO_NOT_EXIST);
        CardInfoEntity cardInfoEntity = cardInfoList.getFirst();
        String phoneNumber = cardInfoEntity.getPhoneNumber();
        RelationUsersEntity relationUsersEntity = relationUsersRepository.findByCertOwnerIdAndCertRelatedPhone(
                request.getRefVerifyId(),
                phoneNumber);
        if (relationUsersEntity == null)
            throw new IAException(ErrConstans.VERIFY_CONTACT_NOT_EXIST);
        if (!Objects.equals(ECommon.VERIFY_CONTRACT_STT.UN_VERIFY.value, relationUsersEntity.getStatus()))
            throw new IAException(ErrConstans.VERIFY_CONTACT_VERIFIED);
        ///  doi trang thai verifier
        relationUsersEntity.setStatus(ECommon.VERIFY_CONTRACT_STT.REJECT.value);
        relationUsersRepository.save(relationUsersEntity);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }


    @Override
    public CardInfoDTO getCardInfo(String token) {

        String json = EncryptionUtils.decrypt(token, appProperties.encryptKey);
        if (StringBaseUtils.isNullOrEmpty(json)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        VerifyLinkModel verifyLinkModel = JsonUtil.fromJson(json, VerifyLinkModel.class);
        if (verifyLinkModel == null) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        if (!Objects.equals(
                verifyLinkModel.getVerifyType(),
                ECommon.VERIFY_TYPE.CARD.value)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        CardInfoEntity card = cardInfoRepository.findById(verifyLinkModel.getCardId())
                .orElseThrow(() -> new IAException(ErrConstans.CARD_INFO_NOT_EXIST));

        CardInfoDTO res = ModelMapperUtils.toObject(card, CardInfoDTO.class);

        String url = "";
        if (!StringBaseUtils.isNullOrEmpty(card.getImgPath())) {
            Map<String, String> params = new HashMap<>();
            params.put("path", card.getImgPath());
            try {
                url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
            } catch (UnsupportedEncodingException e) {
                log.error("has error when gen link view image", e);
            }
        }
        res.setImgPath(url);

        String shareLink = "";
        String qrCode = "";

        if (Objects.equals(card.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {

            qrCode = ECommon.QR_PREFIX.CARD.value + "\\"
                    + GenRawDataUtils.genCardRawData(card) + "\\"
                    + card.getDigitalSignature() + "\\"
                    + card.getPublicKey() + "\\"
                    + card.getPointVerify() + "\\"
                    + url + "\\"
                    + card.getTxId() + "\\"
                    + card.getBlockHeight();

            shareLink = redirectService.genLink(
                    ECommon.LINK_VERIFY_TYPE.INFO_VERIFICATION.value,
                    ECommon.VERIFY_TYPE.CARD.value,
                    card.getId()
            );
        } else {
            shareLink = redirectService.genLink(
                    ECommon.LINK_VERIFY_TYPE.VERIFY.value,
                    ECommon.VERIFY_TYPE.CARD.value,
                    card.getId()
            );
        }

        res.setShareLink(shareLink);
        res.setQrCode(qrCode);

        return res;
    }


    @Override
    public DetailClanResModel getClanInfo(String token) {
        String json = EncryptionUtils.decrypt(token, appProperties.encryptKey);
        if (StringBaseUtils.isNullOrEmpty(json)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        VerifyLinkModel verifyLinkModel = JsonUtil.fromJson(json, VerifyLinkModel.class);
        if (Objects.isNull(verifyLinkModel)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        if (!Objects.equals(verifyLinkModel.getVerifyType(), ECommon.VERIFY_TYPE.CLAN.value)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        return clanService.detailClanInfo(verifyLinkModel.getCardId());
    }

    @Override
    public TaekwondoDetailResModel getTaekwondoInfo(String token) {
        String json = EncryptionUtils.decrypt(token, appProperties.encryptKey);
        if (StringBaseUtils.isNullOrEmpty(json)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        VerifyLinkModel verifyLinkModel = JsonUtil.fromJson(json, VerifyLinkModel.class);
        if (Objects.isNull(verifyLinkModel)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        if (!Objects.equals(verifyLinkModel.getVerifyType(), ECommon.VERIFY_TYPE.TAIW.value)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }
        return taeKwondoService.taekwondoDetail(verifyLinkModel.getCardId());
    }

    @Override
    public Boolean verifySignatureInfo(VerifySignatureInfoReqModel request) throws Exception {
        this.VerifySignatureInfoReq(request);
        String dataHash = CryptoUtil.hashCardInfo(request.getRawData());
//        return CryptoUtil.verifySignature(dataHash, request.getSignature(), request.getPublicKey());
        // verify ver2
        return CryptoUtil.verifyDataVer2(dataHash, request.getSignature(), request.getPublicKey());
    }

    private void VerifySignatureInfoReq(VerifySignatureInfoReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getRawData())) {
            throw new IAException(ErrConstans.VALIDATE_RAW_DATA_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getSignature())) {
            throw new IAException(ErrConstans.VALIDATE_SIGNATURE_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getPublicKey())) {
            throw new IAException(ErrConstans.VALIDATE_PUBLIC_KEY_NOT_NULL);
        }
    }

    @Override
    public Boolean changePhoneNumber(ChangePhoneReqModel request) {
        Optional<UsersEntity> optionalUsersEntity = usersRepository.findById(usersContext.getCurrentUserId());
        if (optionalUsersEntity.isEmpty())
            throw new IAException(ErrConstans.USER_NOT_EXISTED);
        UsersEntity usersEntity = optionalUsersEntity.get();
        UsersEntity userCheck = usersRepository.findByPhoneNumberAndIdNotIn(request.getPhone(), Collections.singletonList(usersEntity.getId()));

        if (userCheck != null) {
            throw new IAException(ErrConstans.PHONE_NUMBER_EXISTED);
        }

        usersEntity.setPhoneNumber(request.getPhone());
        usersEntity.setUpdateBy(usersContext.getCurrentUserName());
        usersEntity.setUpdateDate(new Date());

        usersRepository.save(usersEntity);
        return true;
    }

    @Override
    public List<RequesterDTO> getListRequesters(Long verifyType) {

        Optional<UsersEntity> optionalUsersEntity = usersRepository.findById(usersContext.getCurrentUserId());
        if (optionalUsersEntity.isEmpty())
            throw new IAException(ErrConstans.USER_NOT_EXISTED);
        String phoneNumber = optionalUsersEntity.get().getPhoneNumber();
        if (StringBaseUtils.isNullOrEmpty(phoneNumber)) {
            throw new IAException(ErrConstans.PHONE_NUMBER_NOT_EXIST);
        }


        if (ECommon.VERIFY_TYPE.CARD.value.equals(verifyType)) {
            return verifyContactRepository.getListRequesterCard(verifyType, phoneNumber);
        } else if (ECommon.VERIFY_TYPE.CLAN.value.equals(verifyType)) {
            return verifyContactRepository.getListRequesterClan(verifyType, phoneNumber);
        } else if (ECommon.VERIFY_TYPE.TAIW.value.equals(verifyType)) {
            return verifyContactRepository.getListRequesterTeakwondo(verifyType, phoneNumber);
        } else if (Objects.equals(null, verifyType)) {
            List<RequesterDTO> card = verifyContactRepository.getListRequesterCard(ECommon.VERIFY_TYPE.CARD.value, phoneNumber);
            List<RequesterDTO> clan = verifyContactRepository.getListRequesterClan(ECommon.VERIFY_TYPE.CLAN.value, phoneNumber);
            List<RequesterDTO> teak = verifyContactRepository.getListRequesterTeakwondo(ECommon.VERIFY_TYPE.TAIW.value, phoneNumber);
            List<RequesterDTO> all = new ArrayList<>();
            all.addAll(card);
            all.addAll(clan);
            all.addAll(teak);
            return all;
        } else {
            return Collections.emptyList();
        }
    }

    @Override
    public PhoneNumberDTO getPhoneNumber() {
        Optional<UsersEntity> optionalUsersEntity = usersRepository.findById(usersContext.getCurrentUserId());
        if (optionalUsersEntity.isEmpty())
            throw new IAException(ErrConstans.USER_NOT_EXISTED);
        String phoneNumber = optionalUsersEntity.get().getPhoneNumber();
        if (StringBaseUtils.isNullOrEmpty(phoneNumber)) {
            throw new IAException(ErrConstans.PHONE_NUMBER_NOT_EXIST);
        }
        return new PhoneNumberDTO(phoneNumber);
    }

    @Override
    public VerifyDIDDTO getDidInfoByToken(String token) {
        String json = EncryptionUtils.decrypt(token, appProperties.encryptKey);
        if (StringBaseUtils.isNullOrEmpty(json)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        VerifyLinkModel verifyLinkModel = JsonUtil.fromJson(json, VerifyLinkModel.class);
        if (verifyLinkModel == null) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        if (!Objects.equals(verifyLinkModel.getVerifyType(), ECommon.VERIFY_TYPE.CARD.value)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        CardInfoEntity card = cardInfoRepository.findById(verifyLinkModel.getCardId())
                .orElseThrow(() -> new IAException(ErrConstans.CARD_INFO_NOT_EXIST));

        VerifyDIDDTO res = ModelMapperUtils.toObject(card, VerifyDIDDTO.class);
        res.setCardInfoId(card.getId());
        return res;
    }

    public String integrationDID(String publicKey, String privateKey, String signature, String did) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            //call submit
            SubmitDidRequest submitDidRequest = buildSubmitDidRequest(did, publicKey);
            String resSubmitDID = didService.submitDid(submitDidRequest);
            SubmitDidResponse<Void> responseSubmit = objectMapper.readValue(resSubmitDID, new TypeReference<SubmitDidResponse<Void>>() {
            });
            if (responseSubmit == null || responseSubmit.getResult() != 200L) {
                throw new IAException(ErrConstans.SUBMIT_DID_FAIL);
            }
            //call confirm
            String txId = responseSubmit.getTxId();
            ConfirmDidRequest confirmDidRequest = buildConfirmDidRequest(txId, privateKey);
            String resConfirmDID = didService.confirmDid(confirmDidRequest);

            SubmitDidResponse<Void> responseConfirm = objectMapper.readValue(resConfirmDID, new TypeReference<SubmitDidResponse<Void>>() {
            });
            if (responseConfirm == null || responseConfirm.getResult() != 200L) {
                throw new IAException(ErrConstans.CONFIRM_DID_FAIL);
            }
            return responseConfirm.getTxId();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IAException(ErrConstans.INTEGRATION_DID_FAIL);
        }
    }

    private SubmitDidRequest buildSubmitDidRequest(String did, String publicKey) {

        String keyId = did + "#keys-1";

        SubmitDidRequest.VerificationMethod vm =
                new SubmitDidRequest.VerificationMethod();
        vm.setId(keyId);
        vm.setType("EcdsaSecp256k1VerificationKey2019");
        vm.setController(did);
        vm.setPublicKeyBase58(CryptoUtil.toPublicKeyBase58(publicKey));

        SubmitDidRequest request = new SubmitDidRequest();
        request.setContext(List.of(
                "https://www.w3.org/ns/did/v1",
                "https://w3id.org/security/suites/secp256k1-2019/v1"
        ));
        request.setId(did);
        request.setController(appProperties.issuerDID);
        request.setVerificationMethod(List.of(vm));
        request.setAuthentication(List.of(keyId));
        request.setAssertionMethod(List.of(keyId));
        request.setKeyAgreement(List.of(keyId));

        return request;
    }


    private EnrollDidRequest buildEnrollDidRequest(String did, String publicKey, String signature) {

        String keyId = did + "#keys-1";

        EnrollDidRequest.VerificationMethod vm =
                new EnrollDidRequest.VerificationMethod();
        vm.setId(keyId);
        vm.setType("EcdsaSecp256k1VerificationKey2019");
        vm.setController(did);
        vm.setPublicKeyBase58(CryptoUtil.toPublicKeyBase58(publicKey));

        EnrollDidRequest.CredentialSubject cs = new EnrollDidRequest.CredentialSubject();

        cs.setId(did);
        cs.setController(appProperties.issuerDID);
        cs.setVerificationMethod(List.of(vm));
        cs.setAuthentication(List.of(keyId));
        cs.setAssertionMethod(List.of(keyId));
        cs.setKeyAgreement(List.of(keyId));

        EnrollDidRequest.Proof proof = new EnrollDidRequest.Proof();
        proof.setType("EcdsaSecp256k1VerificationKey2019");
        proof.setVerificationMethod(appProperties.issuerDID + "#keys-1");
        proof.setProofPurpose("assertionMethod");
        proof.setCreated(new Date());
        proof.setProofValue(signature);

        EnrollDidRequest request = new EnrollDidRequest();
        request.setContext(List.of(
                "https://www.w3.org/ns/did/v1",
                "https://w3id.org/security/suites/secp256k1-2019/v1"
        ));
        request.setCredentialSubject(cs);
        request.setProof(proof);

        return request;
    }

    private ConfirmDidRequest buildConfirmDidRequest(String txId, String privateKey) {
        try {
            if (txId != null) {
                String txHash = txId;
                if (txId.startsWith("0x")) {
                    txHash = txId.substring(2);
                }
                String signature = CryptoUtil.signDataVer2(txHash, privateKey);
                ConfirmDidRequest confirmDidRequest = new ConfirmDidRequest();
                confirmDidRequest.setTxHash(txId);
                confirmDidRequest.setSignature(CryptoUtil.toPublicKeyBase58(signature));
                return confirmDidRequest;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
