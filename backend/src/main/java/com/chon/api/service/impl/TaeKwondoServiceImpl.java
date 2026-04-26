package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.ClanInfoEntity;
import com.chon.api.entity.TaekwondoInfoEntity;
import com.chon.api.entity.UsersEntity;
import com.chon.api.model.UserInfoModel;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoCreateReqModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.taekwondo.TaekwondoUpdateReqModel;
import com.chon.api.repository.ClanRepository;
import com.chon.api.repository.TaekwondoRepository;
import com.chon.api.repository.UsersRepository;
import com.chon.api.service.ImageService;
import com.chon.api.service.TaeKwondoService;
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
public class TaeKwondoServiceImpl implements TaeKwondoService {

    @Autowired
    private UsersContext usersContext;

    @Autowired
    private TaekwondoRepository taekwondoRepository;

    @Autowired
    private ImageService imageService;

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private ClanRepository clanRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    @Transactional
    public CertificateCreateResModel taekwondoCreate(TaekwondoCreateReqModel request) throws IOException {
        this.validateTeakCreate(request);

        Long userId = null;
        String username = "";
        if (usersContext.hasAuthentication()) {
            userId = usersContext.getCurrentUserId();
            username = usersContext.getCurrentUserName();
            TaekwondoInfoEntity teakInfo = taekwondoRepository.findByUserId(userId);
            if (teakInfo != null)
                throw new IAException(ErrConstans.TAEKWONDO_EXISTED);
        } else {
            if (StringBaseUtils.isNullOrEmpty(request.getPhoneNumber())) {
                throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_PHONE_NUMBER_NOT_NULL);
            }

            if (!request.getPhoneNumber().matches("^\\+[0-9]{1,3}\\s[0-9]{8,12}$") || request.getPhoneNumber().length() < 11 || request.getPhoneNumber().length() > 17) {
                throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_PHONE_NUMBER_INVALID_FORMAT);
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

        TaekwondoInfoEntity Entity = taekwondoRepository.findByIdNumber(request.getIdNumber());
        if (Entity != null)
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ID_NUMBER_EXISTED);
        TaekwondoInfoEntity taekwondoInfoEntity = new TaekwondoInfoEntity();
        taekwondoInfoEntity.setName(request.getName());
        taekwondoInfoEntity.setIdNumber(request.getIdNumber());
        taekwondoInfoEntity.setLevel(request.getLevel());
        taekwondoInfoEntity.setLevelNumber(request.getLevelNumber());
        taekwondoInfoEntity.setIssuedDate(request.getIssuedDate());
        taekwondoInfoEntity.setImgPath(request.getImgBase64());
        taekwondoInfoEntity.setNationality(request.getNationality());
        String imagePath = imageService.saveImage(request.getImgBase64());
        taekwondoInfoEntity.setImgPath(imagePath);

        taekwondoInfoEntity.setUserId(userId);
        taekwondoInfoEntity.setPointVerify(0L);

        taekwondoInfoEntity.setStatus(ECommon.DIGITAL_SIGNATURE.NO.value);
        taekwondoInfoEntity.setCreateBy(username);
        taekwondoInfoEntity.setUpdateBy(username);
        taekwondoInfoEntity.setCreateDate(new Date());
        taekwondoInfoEntity.setUpdateDate(new Date());
        taekwondoInfoEntity.setEnglishName(request.getEnglishName());
        taekwondoRepository.save(taekwondoInfoEntity);

        if (!usersContext.hasAuthentication()) {
            /// token
            String accessToken = jwtUtil.generateAccessToken(userId, username);
            return new CertificateCreateResModel(taekwondoInfoEntity.getId(), accessToken);
        }

        return new CertificateCreateResModel(taekwondoInfoEntity.getId(), null);
    }

    private void validateTeakCreate(TaekwondoCreateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getName())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_NAME_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getImgBase64())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL);
        }

        if (!request.getImgBase64().matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$")) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIdNumber())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getNationality())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL);
        }

        if (request.getLevel() == null) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_LEVEL_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getLevelNumber())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL);
        }

        if (!request.getIssuedDate().matches("^\\d{4}-\\d{2}-\\d{2}$")) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT);
        }

    }

    @Override
    public MessModel taekwondoUpdate(TaekwondoUpdateReqModel request) throws IOException {
        this.validateTeakUpdate(request);
        TaekwondoInfoEntity taekwondoInfoEntity = taekwondoRepository.findByUserId(usersContext.getCurrentUserId());
        if (taekwondoInfoEntity == null)
            throw new IAException(ErrConstans.TAEKWONDO_NOT_EXISTED);
        Boolean existsByIdNumberAndUserIdNot = taekwondoRepository.existsByIdNumberAndUserIdNot(request.getIdNumber(), usersContext.getCurrentUserId());
        if (existsByIdNumberAndUserIdNot)
            throw new IAException(ErrConstans.ID_NUMBER_EXISTED);
        taekwondoInfoEntity.setName(request.getName());
        taekwondoInfoEntity.setIdNumber(request.getIdNumber());
        taekwondoInfoEntity.setLevel(request.getLevel());
        taekwondoInfoEntity.setLevelNumber(request.getLevelNumber());
        taekwondoInfoEntity.setIssuedDate(request.getIssuedDate());
        taekwondoInfoEntity.setNationality(request.getNationality());
        if (request.getImgBase64() != null && !request.getImgBase64().isEmpty()) {
            String imagePath = imageService.saveImage(request.getImgBase64());
            imageService.deleteImage(taekwondoInfoEntity.getImgPath());
            taekwondoInfoEntity.setImgPath(imagePath);
        }

        taekwondoInfoEntity.setUpdateBy(usersContext.getCurrentUserName());
        taekwondoInfoEntity.setUpdateDate(new Date());
        taekwondoRepository.save(taekwondoInfoEntity);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    private void validateTeakUpdate(TaekwondoUpdateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getName())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_NAME_NOT_NULL);
        }

        if (!StringBaseUtils.isNullOrEmpty(request.getImgBase64()) && (!request.getImgBase64().matches("^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$"))) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIdNumber())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getNationality())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL);
        }

        if (request.getLevel() == null) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_LEVEL_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getLevelNumber())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getIssuedDate())) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL);
        }

        if (!request.getIssuedDate().matches("^\\d{4}-\\d{2}-\\d{2}$")) {
            throw new IAException(ErrConstans.VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT);
        }
    }

    @Override
    public TaekwondoDetailResModel taekwondoDetail(Long id) {
        TaekwondoInfoEntity taekwondo = taekwondoRepository.findById(id)
                .orElseThrow(() -> new IAException(ErrConstans.TAEKWONDO_NOT_EXISTED));

        TaekwondoDetailResModel res = ModelMapperUtils.toObject(taekwondo, TaekwondoDetailResModel.class);
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
        Optional<UsersEntity> optionalUser = usersRepository.findById(taekwondo.getUserId());
        optionalUser.ifPresent(usersEntity -> res.setPhoneNumber(usersEntity.getPhoneNumber()));
        return res;
    }
}