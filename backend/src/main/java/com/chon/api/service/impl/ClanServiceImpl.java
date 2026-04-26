package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.ClanInfoEntity;
import com.chon.api.entity.UsersEntity;
import com.chon.api.model.UserInfoModel;
import com.chon.api.model.clan.ClanCreateReqModel;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.clan.ClanUpdateReqModel;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.repository.ClanRepository;
import com.chon.api.repository.UsersRepository;
import com.chon.api.service.ClanService;
import com.chon.api.service.ImageService;
import com.chon.api.utils.JwtUtil;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.UrlGenerator;
import com.chon.api.utils.mapper.ModelMapperUtils;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.stream.Collectors;

@Log4j2
@Service
public class ClanServiceImpl implements ClanService {

    @Autowired
    private UsersContext usersContext;

    @Autowired
    private ClanRepository clanRepository;

    @Autowired
    private ImageService imageService;

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    @Transactional
    public CertificateCreateResModel createClanInfo(ClanCreateReqModel request) throws IOException {
        this.validateClanCreateReq(request);

        Long userId = null;
        String username = "";
        if (usersContext.hasAuthentication()) {
            userId = usersContext.getCurrentUserId();
            username = usersContext.getCurrentUserName();
            ClanInfoEntity clanInfo = clanRepository.findByUserId(userId);
            if (clanInfo != null)
                throw new IAException(ErrConstans.CLAN_EXISTED);
        } else {

            if (StringBaseUtils.isNullOrEmpty(request.getPhoneNumber())) {
                throw new IAException(ErrConstans.VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL);
            }

            if (!request.getPhoneNumber().matches("^\\+[0-9]{1,3}\\s[0-9]{8,12}$") || request.getPhoneNumber().length() < 11 || request.getPhoneNumber().length() > 17) {
                throw new IAException(ErrConstans.VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT);
            }

            String strPhone = request.getPhoneNumber().replace(" ", "").replace("\\+", "");
            UsersEntity usersEntity = usersRepository.findByPhoneNumber(request.getPhoneNumber());
            if (usersEntity != null)
                throw new IAException(ErrConstans.PHONE_NUMBER_EXISTED);
            //save user theo sđt
            UsersEntity users = new UsersEntity();
            users.setCreateDate(new Date());
            users.setUserName(strPhone);
            users.setCreateBy(strPhone);
            users.setUpdateBy(strPhone);
            users.setUpdateDate(new Date());
            users.setIsActive(1L);
            users.setStatus(1L);
            users.setPhoneNumber(request.getPhoneNumber());
            usersRepository.save(users);
            userId = users.getId();
            username = users.getUserName();
        }

        ClanInfoEntity clanCheckIdNumber = clanRepository.findByIdNumber(request.getIdNumber());
        if (clanCheckIdNumber != null)
            throw new IAException(ErrConstans.VALIDATE_CLAN_ID_NUMBER_EXISTED);


        ClanInfoEntity clanInfoEntity = new ClanInfoEntity();
        clanInfoEntity.setUserId(userId);
        clanInfoEntity.setClanName(request.getClanName());
        clanInfoEntity.setIdNumber(request.getIdNumber());
        clanInfoEntity.setOrigin(request.getOrigin());
        clanInfoEntity.setBirth(request.getBirth());
        clanInfoEntity.setRelationship(request.getRelationship());
        clanInfoEntity.setAddress(request.getAddress());
        clanInfoEntity.setOtherInfo(request.getOtherInfo());
        clanInfoEntity.setStatus(ECommon.DIGITAL_SIGNATURE.NO.value);
        clanInfoEntity.setPointVerify(0L);

        clanInfoEntity.setPa(request.getPa());
        clanInfoEntity.setSe(request.getSe());
        clanInfoEntity.setPersonalName(request.getPersonalName());
        clanInfoEntity.setPersonalGivenName(request.getPersonalGivenName());
        clanInfoEntity.setPersonalNickname(request.getPersonalNickname());
        clanInfoEntity.setFamilyOccupation(request.getFamilyOccupation());
        clanInfoEntity.setGps(request.getGps());

        clanInfoEntity.setCreateBy(username);
        clanInfoEntity.setCreateDate(new Date());

        String imagePath = imageService.saveImage(request.getImgBase64());
        clanInfoEntity.setImgPath(imagePath);

        clanInfoEntity.setEnglishName(request.getEnglishName());

        clanRepository.save(clanInfoEntity);

        if (!usersContext.hasAuthentication()) {
            /// token
            String accessToken = jwtUtil.generateAccessToken(userId, username);
            return new CertificateCreateResModel(clanInfoEntity.getId(), accessToken);
        }

        return new CertificateCreateResModel(clanInfoEntity.getId(), null);
    }

    private void validateClanCreateReq(ClanCreateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getIdNumber())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_ID_NUMBER_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getClanName())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_CLAN_NAME_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getImgBase64())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL);
        }

        if (!request.getImgBase64().matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$")) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getOrigin())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_ORIGIN_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getPa())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_PA_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getSe())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_SE_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getBirth())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_BIRTH_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getPersonalName())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL);
        }

    }

    @Override
    public DetailClanResModel detailClanInfo(Long id) {
        ClanInfoEntity clanInfo = clanRepository.findById(id)
                .orElseThrow(() -> new IAException(ErrConstans.CLAN_NOT_EXISTED));
        DetailClanResModel res = ModelMapperUtils.toObject(clanInfo, DetailClanResModel.class);
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
        Optional<UsersEntity> optionalUser = usersRepository.findById(clanInfo.getUserId());
        optionalUser.ifPresent(usersEntity -> res.setPhoneNumber(usersEntity.getPhoneNumber()));
        return res;
    }

    @Override
    public Long updateClanInfo(ClanUpdateReqModel request) throws IOException {
        this.validateUpdateReq(request);
        Optional<ClanInfoEntity> optionalClanInfo = clanRepository.findById(request.getId());
        if (optionalClanInfo.isEmpty()) {
            throw new IAException(ErrConstans.CLAN_NOT_EXISTED);
        }
        ClanInfoEntity clanInfoEntity = optionalClanInfo.get();
        clanInfoEntity.setClanName(request.getClanName());
        clanInfoEntity.setOrigin(request.getOrigin());
        clanInfoEntity.setBirth(request.getBirth());
        clanInfoEntity.setRelationship(request.getRelationship());
        clanInfoEntity.setAddress(request.getAddress());
        clanInfoEntity.setOtherInfo(request.getOtherInfo());

        clanInfoEntity.setPa(request.getPa());
        clanInfoEntity.setSe(request.getSe());
        clanInfoEntity.setPersonalName(request.getPersonalName());
        clanInfoEntity.setPersonalGivenName(request.getPersonalGivenName());
        clanInfoEntity.setPersonalNickname(request.getPersonalNickname());
        clanInfoEntity.setFamilyOccupation(request.getFamilyOccupation());
        clanInfoEntity.setGps(request.getGps());

        clanInfoEntity.setUpdateBy(usersContext.getCurrentUserName());
        clanInfoEntity.setUpdateDate(new Date());

        if (!StringBaseUtils.isNullOrEmpty(request.getImgBase64())) {
            String imagePath = imageService.saveImage(request.getImgBase64());
            clanInfoEntity.setImgPath(imagePath);
        }

        clanRepository.save(clanInfoEntity);
        return clanInfoEntity.getId();
    }

    private void validateUpdateReq(ClanUpdateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getClanName())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_CLAN_NAME_NOT_NULL);
        }

        if (!StringBaseUtils.isNullOrEmpty(request.getImgBase64()) && (!request.getImgBase64().matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$"))) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getOrigin())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_ORIGIN_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getPa())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_PA_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getSe())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_SE_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getBirth())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_BIRTH_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getPersonalName())) {
            throw new IAException(ErrConstans.VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL);
        }
    }
}