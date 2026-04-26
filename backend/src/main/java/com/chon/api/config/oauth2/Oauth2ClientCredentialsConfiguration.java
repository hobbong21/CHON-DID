package com.chon.api.config.oauth2;

import cn.hutool.core.collection.CollUtil;
import com.chon.api.common.AppProperties;
import com.chon.api.config.RequestFilterConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.CollectionUtils;
import org.springframework.web.cors.CorsConfiguration;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(jsr250Enabled = true, securedEnabled = true)
public class Oauth2ClientCredentialsConfiguration {

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private RequestFilterConfiguration jwtAuthenticationFilter;

    private String[] defaultIgnoreUrls = {"/swagger-ui/**", "/swagger-ui.html/**", "/swagger-resources/**", "/webjars/**", "/swagger-ui.html#!/**", "/v2/docs", "/v3/docs", "/v2/api-docs", "/v3/api-docs", "/v3/api-docs/**", "/actuator/**", "/favicon.ico", "/css/**", "/js/**", "/error", "/", "/graphql", "/graphiql"};

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, @Value("${oauth2.ignore-urls:}") List<String> ignoreUrls) throws Exception {
        if (!CollectionUtils.isEmpty(ignoreUrls)) {
            List<String> list = CollUtil.addAllIfNotContains(ignoreUrls, Arrays.asList(defaultIgnoreUrls));
            defaultIgnoreUrls = Arrays.copyOf(list.toArray(), list.size(), String[].class);
        }

        http.cors(cors -> cors.configurationSource(request -> {
                    CorsConfiguration config = new CorsConfiguration();
                    config.setAllowedOrigins(appProperties.urlOrigin);
                    config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
                    config.setAllowedHeaders(List.of("*"));
                    config.setAllowCredentials(true);
                    config.setMaxAge(3600L);
                    return config;
                }))
                .csrf(httpConf -> {
                    httpConf.disable();
                })
                .authorizeHttpRequests(httpRequest -> httpRequest
                        .requestMatchers(defaultIgnoreUrls).permitAll()
                        .anyRequest().authenticated()).sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(12);
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}
