package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.entity.*;
import com.chon.api.model.UserInfoModel;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.identifier.CardInfoDTO;
import com.chon.api.model.identifier.HomeInfoDTO;
import com.chon.api.model.identifier.IdentifierCreateReqModel;
import com.chon.api.model.identifier.IdentifierUpdateReqModel;
import com.chon.api.model.identifier.VerifierCreateReqModel;
import com.chon.api.model.identifier.VerifierUpdateReqModel;
import com.chon.api.model.identifier.VerifyContactDTO;
import com.chon.api.model.identifier.VerifyContactReqModel;
import com.chon.api.model.identifier.impl.ValidatableCardRequest;
import com.chon.api.model.mess.MessModel;
import com.chon.api.repository.*;
import com.chon.api.service.CardInfoService;
import com.chon.api.service.ImageService;
import com.chon.api.service.RedirectService;
import com.chon.api.utils.GenRawDataUtils;
import com.chon.api.utils.JwtUtil;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.UrlGenerator;
import com.chon.api.utils.mapper.ModelMapperUtils;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Log4j2
@Service
public class CardInfoServiceImpl implements CardInfoService {

    @Autowired
    private CardInfoRepository cardInfoRepository;

    @Autowired
    private ClanRepository clanRepository;

    @Autowired
    private TaekwondoRepository teakwondoRepository;

    @Autowired
    private VerifyContactRepository verifyContactRepository;

    @Autowired
    private RelationTemplateRepository relationTemplateRepository;

    @Autowired
    RelationUsersRepository relationUsersRepository;

    @Autowired
    private UsersContext usersContext;

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private RedirectService redirectService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    @Transactional
    public CertificateCreateResModel identifierCreate(IdentifierCreateReqModel request) throws IOException {
        /// validate
        validateReqCard(request);
        ///
        Long userId;
        String username;
        boolean isAnonymous = !usersContext.hasAuthentication();
        String finalPhone;
        if (!isAnonymous) {
            // User đã login
            userId = usersContext.getCurrentUserId();
            username = usersContext.getCurrentUserName();
            UsersEntity currentUser = usersRepository.findById(userId)
                    .orElseThrow(() -> new IAException(ErrConstans.USER_NOT_EXISTED));
            finalPhone = currentUser.getPhoneNumber();
        } else {
            String strPhone = request.getPhoneNumber().replace(" ", "");
            if (StringBaseUtils.isNullOrEmpty(request.getPhoneNumber())) {
                throw new IAException(ErrConstans.VALIDATE_CARD_PHONE_NUMBER_NOT_NULL);
            }

            if (!request.getPhoneNumber().matches("^\\+[0-9]{1,3}\\s[0-9]{8,13}$") || request.getPhoneNumber().length() < 11 || request.getPhoneNumber().length() > 17) {
                throw new IAException(ErrConstans.VALIDATE_CARD_PHONE_NUMBER_INVALID_FORMAT);
            }

//            List<CardInfoEntity> existedCards = cardInfoRepository.findAllByPhoneNumber(strPhone);
//            if (existedCards != null && !existedCards.isEmpty()) {
//                throw new IAException(ErrConstans.PHONE_NUMBER_EXISTED);
//            }

            UsersEntity user = usersRepository.findByUserName(strPhone);
            if (user == null) {
                user = new UsersEntity();
                user.setUserName(strPhone);
                user.setCreateBy(strPhone);
                user.setUpdateBy(strPhone);
                user.setPhoneNumber(strPhone);
                user.setCreateDate(new Date());
                user.setUpdateDate(new Date());
                user.setIsActive(1L);
                user.setStatus(1L);
                usersRepository.save(user);
            }

            userId = user.getId();
            username = user.getUserName();
            finalPhone = strPhone;
        }

        CardInfoEntity cardInfo = new CardInfoEntity();
        cardInfo.setUserId(userId);
        cardInfo.setIdNumber(request.getIdNumber());
        cardInfo.setName(request.getName());
        cardInfo.setAddress(request.getAddress());
        cardInfo.setIssuingAuthority(request.getIssuingAuthority());
        cardInfo.setGender(request.getGender());
        cardInfo.setNationality(request.getNationality());
        cardInfo.setRefVisaType(request.getRefVisaType());
        cardInfo.setIssuedDate(request.getIssuedDate());
        cardInfo.setPhoneNumber(finalPhone);
        cardInfo.setPointVerify(0L);
        cardInfo.setLicenseNumber(request.getLicenseNumber());
        cardInfo.setLicenseValidity(request.getLicenseValidity());
        cardInfo.setExpirationDatePassport(request.getExpirationDatePassport());
        cardInfo.setDateOfBirth(request.getDateOfBirth());

        String imagePath = imageService.saveImage(request.getImgBase64());
        cardInfo.setImgPath(imagePath);

        cardInfo.setStatus(ECommon.DIGITAL_SIGNATURE.NO.value);
        cardInfo.setCreateDate(new Date());
        cardInfo.setUpdateDate(new Date());
        cardInfo.setCreateBy(request.getPhoneNumber());
        cardInfo.setUpdateBy(request.getPhoneNumber());
        cardInfo.setEnglishName(request.getEnglishName());
        cardInfo.setIsDelete(ECommon.TYPE_DELETE.UN_DELETE.value);
        cardInfoRepository.save(cardInfo);

        if (isAnonymous) {
            /// token
            String accessToken = jwtUtil.generateAccessToken(userId, username);
            return new CertificateCreateResModel(cardInfo.getId(), accessToken);
        }

        return new CertificateCreateResModel(cardInfo.getId(), null);
    }

    /// validate
    private void validateReqCard(ValidatableCardRequest request) {
        if (StringBaseUtils.isNullOrEmpty(request.getIdNumber())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ID_NUMBER_NOT_NULL);
        }
//        if (!Pattern.matches("^[0-9]+$", request.getIdNumber())) {
//            throw new IAException(ErrConstans.VALIDATE_CARD_ID_NUMBER_INVALID_FORMAT);
//        }

        if (StringBaseUtils.isNullOrEmpty(request.getAddress())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ADDRESS_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuingAuthority())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUINGAUTHORITY_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUED_DATE_NOT_NULL);
        }
        if (!Pattern.matches("^\\d{4}-\\d{2}-\\d{2}$", request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUED_DATE_INVALID_FORMAT);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getImgBase64())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_IMG_BASE64_NOT_NULL);
        } else if (!Pattern.matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$", request.getImgBase64())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_IMG_BASE64_INVALID_FORMAT);
        }
    }

    /// validate update
    private void validateReqUpdateCard(ValidatableCardRequest request) {
        if (StringBaseUtils.isNullOrEmpty(request.getIdNumber())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ID_NUMBER_NOT_NULL);
        }
//        if (!Pattern.matches("^[0-9]+$", request.getIdNumber())) {
//            throw new IAException(ErrConstans.VALIDATE_CARD_ID_NUMBER_INVALID_FORMAT);
//        }

        if (StringBaseUtils.isNullOrEmpty(request.getAddress())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ADDRESS_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuingAuthority())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUINGAUTHORITY_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUED_DATE_NOT_NULL);
        }
        if (!Pattern.matches("^\\d{4}-\\d{2}-\\d{2}$", request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_ISSUED_DATE_INVALID_FORMAT);
        }

        if (!StringBaseUtils.isNullOrEmpty(request.getImgBase64()) && !Pattern.matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$", request.getImgBase64())) {
            throw new IAException(ErrConstans.VALIDATE_CARD_IMG_BASE64_INVALID_FORMAT);
        }
    }

    @Override
    public MessModel verifierCreate(VerifierCreateReqModel request) {
        VerifyContactEntity verifyContact = new VerifyContactEntity();
        verifyContact.setVerifyType(request.getVerifyType());
        verifyContact.setRefVerifyId(request.getCardId());
        verifyContact.setRefTier(request.getRefTier());
        verifyContact.setName(request.getName());
        verifyContact.setPhoneNumber(request.getPhoneNumber());
        verifyContact.setStatus(ECommon.VERIFY_CONTRACT_STT.UN_VERIFY.value);
        verifyContact.setSubLevel(request.getSubLevel());
        verifyContact.setLevelCode(request.getLevelCode());
        verifyContactRepository.save(verifyContact);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public List<HomeInfoDTO> getListHomeInfo() {
        List<HomeInfoDTO> homeInfoDTOS = new ArrayList<>();
        // card info
        List<CardInfoEntity> cardList = cardInfoRepository.findAllByUserIdAndIsDelete(usersContext.getCurrentUserId(), ECommon.TYPE_DELETE.UN_DELETE.value);

        for (CardInfoEntity card : cardList) {
            HomeInfoDTO dto = ModelMapperUtils.toObject(card, HomeInfoDTO.class);
            String url = "";
            if (!StringBaseUtils.isNullOrEmpty(card.getImgPath())) {
                Map<String, String> params = new HashMap<>();
                params.put("path", card.getImgPath());
                try {
                    url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
                } catch (UnsupportedEncodingException e) {
                    log.error("Error generating image view link", e);
                }
            }
            dto.setImgPath(url);
            dto.setVerifyType(ECommon.VERIFY_TYPE.CARD.value);
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
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.INFO_VERIFICATION.value, ECommon.VERIFY_TYPE.CARD.value, card.getId());
            } else {
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.VERIFY.value, ECommon.VERIFY_TYPE.CARD.value, card.getId());
            }
            dto.setShareLink(shareLink);
            dto.setQrCode(qrCode);

            homeInfoDTOS.add(dto);
        }
        // clan
        List<ClanInfoEntity> clanLst = clanRepository.findAllByUserId(usersContext.getCurrentUserId());
        for (ClanInfoEntity clan : clanLst) {
            HomeInfoDTO dto = ModelMapperUtils.toObject(clan, HomeInfoDTO.class);
            String url = "";
            if (!StringBaseUtils.isNullOrEmpty(clan.getImgPath())) {
                Map<String, String> params = new HashMap<>();
                params.put("path", clan.getImgPath());
                try {
                    url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
                } catch (UnsupportedEncodingException e) {
                    log.error("Error generating image view link", e);
                }
            }
            dto.setImgPath(url);
            dto.setVerifyType(ECommon.VERIFY_TYPE.CLAN.value);
            String shareLink = "";
            String qrCode = "";
            if (Objects.equals(clan.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {
                qrCode = ECommon.QR_PREFIX.CLAN.value + "\\"
                        + GenRawDataUtils.genClanRawData(clan) + "\\"
                        + clan.getDigitalSignature() + "\\"
                        + clan.getPublicKey() + "\\"
                        + clan.getPointVerify() + "\\"
                        + url + "\\"
                        + clan.getTxId() + "\\"
                        + clan.getBlockHeight();
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.INFO_VERIFICATION.value, ECommon.VERIFY_TYPE.CLAN.value, clan.getId());
            } else {
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.VERIFY.value, ECommon.VERIFY_TYPE.CLAN.value, clan.getId());
            }
            dto.setShareLink(shareLink);
            dto.setQrCode(qrCode);

            homeInfoDTOS.add(dto);
        }
        // teakwondo
        List<TaekwondoInfoEntity> teakLst = teakwondoRepository.findAllByUserId(usersContext.getCurrentUserId());
        for (TaekwondoInfoEntity teak : teakLst) {
            HomeInfoDTO dto = ModelMapperUtils.toObject(teak, HomeInfoDTO.class);
            String url = "";
            if (!StringBaseUtils.isNullOrEmpty(teak.getImgPath())) {
                Map<String, String> params = new HashMap<>();
                params.put("path", teak.getImgPath());
                try {
                    url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
                } catch (UnsupportedEncodingException e) {
                    log.error("Error generating image view link", e);
                }
            }
            dto.setImgPath(url);
            dto.setVerifyType(ECommon.VERIFY_TYPE.TAIW.value);
            String shareLink = "";
            String qrCode = "";
            if (Objects.equals(teak.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {
                qrCode = ECommon.QR_PREFIX.TEAK.value + "\\"
                        + GenRawDataUtils.genTeakwondoRawData(teak) + "\\"
                        + teak.getDigitalSignature() + "\\"
                        + teak.getPublicKey() + "\\"
                        + teak.getPointVerify() + "\\"
                        + url + "\\"
                        + teak.getTxId() + "\\"
                        + teak.getBlockHeight();
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.INFO_VERIFICATION.value, ECommon.VERIFY_TYPE.TAIW.value, teak.getId());
            } else {
                shareLink = redirectService.genLink(ECommon.LINK_VERIFY_TYPE.VERIFY.value, ECommon.VERIFY_TYPE.TAIW.value, teak.getId());
            }
            dto.setShareLink(shareLink);
            dto.setQrCode(qrCode);

            homeInfoDTOS.add(dto);
        }

        return homeInfoDTOS;
    }

    @Override
    public CardInfoDTO getDetailCardInfo(Long id) {

        CardInfoEntity cardInfoEntity = cardInfoRepository.findById(id)
                .orElseThrow(() -> new IAException(ErrConstans.CARD_INFO_NOT_EXIST));

        CardInfoDTO res = ModelMapperUtils.toObject(cardInfoEntity, CardInfoDTO.class);

        String url = "";
        if (!StringBaseUtils.isNullOrEmpty(cardInfoEntity.getImgPath())) {
            Map<String, String> params = new HashMap<>();
            params.put("path", cardInfoEntity.getImgPath());
            try {
                url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
            } catch (UnsupportedEncodingException e) {
                log.error("has error when gen link view image", e);
            }
        }
        res.setImgPath(url);

        usersRepository.findById(cardInfoEntity.getUserId())
                .ifPresent(u -> res.setPhoneNumber(u.getPhoneNumber()));

        String shareLink;
        String qrCode = "";

        if (Objects.equals(cardInfoEntity.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {

            qrCode = ECommon.QR_PREFIX.CARD.value + "\\"
                    + GenRawDataUtils.genCardRawData(cardInfoEntity) + "\\"
                    + cardInfoEntity.getDigitalSignature() + "\\"
                    + cardInfoEntity.getPublicKey() + "\\"
                    + cardInfoEntity.getPointVerify() + "\\"
                    + url + "\\"
                    + cardInfoEntity.getTxId() + "\\"
                    + cardInfoEntity.getBlockHeight();

            shareLink = redirectService.genLink(
                    ECommon.LINK_VERIFY_TYPE.INFO_VERIFICATION.value,
                    ECommon.VERIFY_TYPE.CARD.value,
                    cardInfoEntity.getId()
            );
        } else {
            shareLink = redirectService.genLink(
                    ECommon.LINK_VERIFY_TYPE.VERIFY.value,
                    ECommon.VERIFY_TYPE.CARD.value,
                    cardInfoEntity.getId()
            );
        }

        res.setShareLink(shareLink);
        res.setQrCode(qrCode);

        return res;
    }

    @Override
    public MessModel identifierUpdate(IdentifierUpdateReqModel request) throws IOException {

        /// validate
        if (request.getCardId() == null) {
            throw new IAException(ErrConstans.VALIDATE_CARD_CARD_ID_NOT_NULL);
        }

        validateReqUpdateCard(request);
        ///

        Optional<CardInfoEntity> cardInfoEntity = cardInfoRepository.findById(request.getCardId());
        if (cardInfoEntity.isEmpty())
            throw new IAException(ErrConstans.CARD_INFO_NOT_EXIST);
//        Boolean existsByIdNumberAndUserIdNot = cardInfoRepository.existsByIdNumberAndUserIdNotAndIsDelete(request.getIdNumber(), usersContext.getCurrentUserId(),ECommon.TYPE_DELETE.UN_DELETE.value);
//        if (existsByIdNumberAndUserIdNot)
//            throw new IAException(ErrConstans.ID_NUMBER_EXISTED);
        CardInfoEntity cardInfo = cardInfoEntity.get();
        cardInfo.setIdNumber(request.getIdNumber());
        cardInfo.setName(request.getName());
        cardInfo.setAddress(request.getAddress());
        cardInfo.setIssuingAuthority(request.getIssuingAuthority());
        cardInfo.setGender(request.getGender());
        cardInfo.setNationality(request.getNationality());
        cardInfo.setRefVisaType(request.getRefVisaType());
        cardInfo.setPhoneNumber(request.getPhoneNumber());
        cardInfo.setIssuedDate(request.getIssuedDate());
        cardInfo.setUpdateDate(new Date());
        cardInfo.setUpdateBy(usersContext.getCurrentUserName());

        if (request.getImgBase64() != null && !request.getImgBase64().isEmpty()) {
            String imagePath = imageService.saveImage(request.getImgBase64());
            imageService.deleteImage(cardInfo.getImgPath());
            cardInfo.setImgPath(imagePath);
        }

        cardInfoRepository.save(cardInfo);

        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public List<VerifyContactDTO> getListVerification(Long cardId, Long verifyType) {
        return cardInfoRepository.getListVerification(cardId, verifyType);
    }

    @Override
    @Transactional
    public MessModel verifierUpdate(VerifierUpdateReqModel request) {
        List<VerifyContactEntity> existingVerifyContacts = verifyContactRepository.findByRefVerifyId(request.getCardId());
        if (existingVerifyContacts.isEmpty())
            throw new IAException(ErrConstans.VERIFY_CONTACT_NOT_EXIST);
        for (VerifyContactReqModel vcRequest : request.getVerifyContacts()) {
            Optional<VerifyContactEntity> existingContactOpt = existingVerifyContacts.stream()
                    .filter(vc -> vc.getRefTier().equals(vcRequest.getRefTier()))
                    .findFirst();
            VerifyContactEntity newContact = existingContactOpt.orElseGet(VerifyContactEntity::new);
            newContact.setRefVerifyId(request.getCardId());
            newContact.setVerifyType(ECommon.VERIFY_TYPE.CARD.value);
            newContact.setStatus(ECommon.ACTIVE_STATUS.ACTIVE.value);
            newContact.setRefTier(vcRequest.getRefTier());
            newContact.setName(vcRequest.getName());
            newContact.setPhoneNumber(vcRequest.getPhoneNumber());
            existingVerifyContacts.add(newContact);
        }
        verifyContactRepository.saveAll(existingVerifyContacts);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    @Transactional
    public MessModel verifierDelete(Long id) {
        Optional<VerifyContactEntity> verifyContact = verifyContactRepository.findById(id);
        if (verifyContact.isEmpty())
            throw new IAException(ErrConstans.VERIFY_CONTACT_NOT_EXIST.getErrorCode(), "No verify contact found for this ID and this tier");
        verifyContactRepository.delete(verifyContact.get());
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public ListJson<CardInfoDTO> getListCardInfoByUserIdAndStatus(Integer pageIndex, Integer pageSize, Boolean isVerified) {
        Long currentUserId = usersContext.getCurrentUserId();
        Long status = null;
        if (Boolean.TRUE.equals(isVerified)) {
            status = ECommon.ACTIVE_STATUS.ACTIVE.value;
        }
        Pageable pageable = PageRequest.of(pageIndex - 1, pageSize);
        Page<CardInfoDTO> pageData = cardInfoRepository.getListCardInfoByUserIdAndStatus(currentUserId, status, ECommon.TYPE_DELETE.UN_DELETE.value, pageable);
        List<CardInfoDTO> data = pageData.getContent().stream().peek(res -> {
            String url = null;
            if (!StringBaseUtils.isNullOrEmpty(res.getImgPath())) {
                Map<String, String> params = new HashMap<>();
                params.put("path", res.getImgPath());
                try {
                    url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
                } catch (UnsupportedEncodingException e) {
                    log.error("has error when gen link view image", e);
                    url = "";
                }
            }
            res.setImgPath(url);
        }).toList();
        return new ListJson<>(data, pageData.getTotalElements());
    }

    @Override
    public List<RelationUsersEntity> initFamilyTree(Long certOwnerId) {
        CardInfoEntity cardInfoEntity = cardInfoRepository.findById(certOwnerId)
                .orElseThrow(() -> new IAException(ErrConstans.CARD_INFO_NOT_EXIST));
        List<RelationUsersEntity> relationUsersEntities = relationUsersRepository.findAllByCertOwnerIdAndStatus(certOwnerId, ECommon.ACTIVE_STATUS.ACTIVE.value);
        if (!relationUsersEntities.isEmpty()) {
            throw new IAException(ErrConstans.FAMILY_TREE_HAS_BEEN_INITIATED);
        }

        Long userCreatedId = usersContext.getCurrentUserId();

        List<RelationTemplateEntity> templates =
                relationTemplateRepository.findByIsActiveTrueOrderByLevelAsc();

        // Map templateId -> RelationUser
        Map<Long, RelationUsersEntity> map = new HashMap<>();

        Long ownerId = null;

        /* STEP 1: insert tất cả node */
        for (RelationTemplateEntity t : templates) {
            String code = t.getCode();

            RelationUsersEntity u = new RelationUsersEntity();

            u.setRelationId(t.getRelationId());
            // gán lại gender cho owner
            if (code.equals("OWNER")) {
                ownerId = t.getId();
                String gender = cardInfoEntity.getGender();
                u.setGender(gender.equals("female") ? 2L : 1);
                u.setCertRelatedId(certOwnerId);
            } else {
                u.setGender(t.getGender());
            }
            u.setCertOwnerId(certOwnerId);
            u.setIsActive(1L);
            u.setStatus(0L);
            u.setUserIdCreated(userCreatedId);

            relationUsersRepository.save(u);
            map.put(t.getId(), u);
        }

        /* gán lại relation và gender cho sponse */
        if (null != ownerId) {
            RelationUsersEntity owner = map.get(ownerId);
            for (RelationTemplateEntity t : templates) {
                Long sponseId = t.getSpouseId();
                if (sponseId != null && sponseId.equals(ownerId)) {
                    RelationUsersEntity u = map.get(t.getId());
                    u.setGender(owner.getGender().equals(2L) ? 1L : 2L); // 1 - male, 2 - female
                    u.setRelationId(owner.getGender().equals(2L) ? 10L : 11L); // 10 - husband, 11 - wife
                    break;
                }
            }
        }

        /* STEP 2: gán parent_id & spouse_id */
        for (RelationTemplateEntity t : templates) {

            RelationUsersEntity u = map.get(t.getId());

            if (t.getParentId() != null) {
                u.setParentId(map.get(t.getParentId()).getId());
            }

            if (t.getSpouseId() != null) {
                u.setSpouseId(map.get(t.getSpouseId()).getId());
            }
        }

        /* STEP 3: save lại toàn bộ (JPA tự update) */
        return relationUsersRepository.saveAll(map.values());
    }

    @Transactional
    @Override
    public MessModel deleteCardInfos(List<Long> ids) {
        if (null == ids || ids.isEmpty()) {
            throw new IAException(ErrConstans.INPUT_INVALID);
        }
        try {
            relationUsersRepository.hardDeleteByCertOwnerId(ids);
            cardInfoRepository.deleteCarInfo(ECommon.TYPE_DELETE.DELETE.value, ids);
            return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
        } catch (Exception e) {
            return new MessModel(ECommon.RESPONSE_STATUS.FAILED);
        }
    }
}