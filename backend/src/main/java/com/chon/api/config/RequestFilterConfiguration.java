package com.chon.api.config;

import com.chon.api.utils.JwtUtil;
import com.google.gson.Gson;
import com.chon.api.model.UserInfoModel;
import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.ThreadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
public class RequestFilterConfiguration extends OncePerRequestFilter {

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String token = getTokenFromRequest(request);
        ThreadContext.put("clientMessageId", UUID.randomUUID().toString());
        CustomHttpServletRequestWrapper customHttpServletRequestWrapper = null;
        if (token != null) {
            try {
                // Validate token signature, expiry, and type (reject refresh tokens)
                if (jwtUtil.validateToken(token) && jwtUtil.isAccessToken(token)) {
                    Claims claims = jwtUtil.getClaimsFromToken(token);
                    String userId = claims.getSubject();
                    String username = claims.get("uname", String.class);

                    // Build UserInfoModel JSON as principal — maintains backward compat with UsersContext
                    UserInfoModel userInfo = new UserInfoModel();
                    userInfo.setId(Long.parseLong(userId));
                    userInfo.setUserName(username);
                    String principal = new Gson().toJson(userInfo);

                    List<String> role = new ArrayList<>();
                    var authorizes = role.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toList());
                    UsernamePasswordAuthenticationToken authentication =
                            new UsernamePasswordAuthenticationToken(principal, null, authorizes);
                    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                }
            } catch (Exception e) {
                // Invalid token — leave SecurityContext empty, let Spring Security reject
            }
        }
        customHttpServletRequestWrapper = new CustomHttpServletRequestWrapper(request, "Authorization");
        CustomHttpServletResponseWrapper responseWrapper = new CustomHttpServletResponseWrapper(response);
        filterChain.doFilter(customHttpServletRequestWrapper, responseWrapper);
    }

    private String getTokenFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }
}
