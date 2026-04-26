package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.model.link.VerifyLinkModel;
import com.chon.api.service.RedirectService;
import com.chon.api.utils.EncryptionUtils;
import com.chon.api.utils.JsonUtil;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.UrlGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
@Slf4j
@RequiredArgsConstructor
public class RedirectServiceImpl implements RedirectService {
    private final AppProperties appProperties;

    @Override
    public String generateRedirectHtml(String token) throws IOException {
        // decode token
        String tokenDecode = EncryptionUtils.decrypt(token, appProperties.encryptKey);
        if (StringBaseUtils.isNullOrEmpty(tokenDecode)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        VerifyLinkModel verifyLinkModel = JsonUtil.fromJson(tokenDecode, VerifyLinkModel.class);
        if (Objects.isNull(verifyLinkModel)) {
            throw new IAException(ErrConstans.TOKEN_VERIFY_INVALID);
        }

        ClassPathResource htmlFile = new ClassPathResource("templates/redirect.html");

        String htmlContent = StreamUtils.copyToString(htmlFile.getInputStream(), StandardCharsets.UTF_8);

        htmlContent = htmlContent.replace("{{appKey}}", appProperties.appKey)
                .replace("{{type}}", verifyLinkModel.getType())
                .replace("{{verifyType}}", String.valueOf(verifyLinkModel.getVerifyType()))
                .replace("{{androidStoreUrl}}", appProperties.urlStoreAndroid)
                .replace("{{iosStoreUrl}}", appProperties.urlStoreIos);

        return htmlContent;
    }

    @Override
    public String genLink(String type, Long verifyType, Long cardId) {
        VerifyLinkModel verifyLinkModel = new VerifyLinkModel(type, verifyType, cardId);
        String json = JsonUtil.toJson(verifyLinkModel);
        String token = EncryptionUtils.encrypt(json, appProperties.encryptKey);
        Map<String, String> params = new HashMap<>();
        params.put("token", token);
        try {
            return UrlGenerator.encodeUrlSafe(appProperties.baseUrlShareLink, params);
        } catch (UnsupportedEncodingException e) {
            log.error("Error generating share link", e);
            throw new IAException(ErrConstans.SHARE_LINK_ERROR);
        }

    }

}
