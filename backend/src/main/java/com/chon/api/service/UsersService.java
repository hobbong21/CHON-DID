package com.chon.api.service;


import com.chon.api.entity.UsersEntity;

import java.util.Map;

public interface UsersService {
    UsersEntity getByUserName(String userName);

    Map<String,Object> sendOtp(String email);

    Map<String,Object> vefifyOtp(String tokenVerify, String digitalOtp);

    Map<String,Object> savePasswordFirst(String tokenVerify, String password, String rePassword);
}
