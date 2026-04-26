package com.chon.api.common;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Configuration
public class AppProperties {

    @Value("${dev.mode:false}")
    public Boolean devMode;

    @Value("${jwt.access.validity}")
    public long jwtAccessValidity;

    @Value("${jwt.refresh.validity}")
    public long jwtRefreshValidity;

    @Value("${jwt.check.validity}")
    public long jwtCheckValidity;

    @Value("${rsa.public.key}")
    public String publicKey;

    @Value("${rsa.private.key}")
    public String privateKey;

    @Value("${mail.host}")
    public String mailHost;

    @Value("${mail.port}")
    public String mailPort;

    @Value("${mail.user}")
    public String mailUser;

    @Value("${mail.password}")
    public String mailPass;

    @Value("${schedule.send.mail}")
    public Boolean scheduleSendMail;

    @Value("${encrypt.key}")
    public String encryptKey;

    @Value("${base-url.view-image}")
    public String baseUrlViewImage;

    @Value("${base-url.share-link}")
    public String baseUrlShareLink;

    @Value("${base-url.share-link-event}")
    public String baseUrlShareLinkEvent;

    @Value("${app-key}")
    public String appKey;

    @Value("${url.store.android}")
    public String urlStoreAndroid;

    @Value("${url.store.ios}")
    public String urlStoreIos;

    @Value("${max-verify-point}")
    public Long maxVerifyPoint;

    @Value("${verify-point}")
    public Long verifyPoint;

    @Value("${root-folder-image}")
    public String rootFolderImg;

    @Value("${max-file-size-mb}")
    public Integer maxFileSizeMb;

    @Value("#{'${url.origin}'.split(',')}")
    public List<String> urlOrigin;

    @Value("${issuer.did.base-url}")
    public String issuerBaseUrl;

    @Value("${issuer.did.token}")
    public String issuerToken;

    @Value("${issuer.did.id}")
    public String issuerDID;
}
