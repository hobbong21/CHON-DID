package com.chon.api.common.anotations;


import com.chon.api.model.UserInfoModel;
import com.google.gson.Gson;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class UsersContext {

    public boolean hasAuthentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null &&
                authentication.isAuthenticated() &&
                !(authentication.getPrincipal() instanceof String &&
                        "anonymousUser".equals(authentication.getPrincipal()));
    }

    public UserInfoModel getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Gson gson = new Gson();
        return gson.fromJson(authentication.getPrincipal().toString(), UserInfoModel.class);
    }

    public Long getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Gson gson = new Gson();
        var currentUser = gson.fromJson(authentication.getPrincipal().toString(), UserInfoModel.class);

        return currentUser.getId();
    }

    public String getCurrentUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Gson gson = new Gson();
        var currentUser = gson.fromJson(authentication.getPrincipal().toString(), UserInfoModel.class);

        return currentUser.getUserName();
    }


}