package com.chon.api.common.constans;

public class AuthConstans {
    public static final String[] EXCLUDE_URL_PATTERN = new String[]{"/", "/error", "/csrf", "/resources/**", "/ws/info", "/ws/**", "/soap/**", "/swagger-ui.html", "/swagger-ui.html/**", "/swagger-resources/**", "/swagger-ui.html#!/**", "/webjars/**", "/v2/api-docs", "/js/**", "/css/**", "/favicon.ico", "/actuator/**", "/csrf", "/login/**", "/oauth/**", "/.well-known/**"};
    public static final String CLIEN_ID = "client_id";
    public static final String CLIENT_SECRET = "client_secret";
    public static final String GRANT_TYPE_PASSWORD = "password";
    public static final String AUTHORIZATION_CODE = "authorization_code";
    public static final String REFRESH_TOKEN = "refresh_token";
    public static final String IMPLICIT = "implicit";
    public static final String SCOPE_READ = "read";
    public static final String SCOPE_WRITE = "write";
    public static final String TRUST = "trust";

}
