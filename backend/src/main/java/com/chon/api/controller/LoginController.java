package com.chon.api.controller;

import com.chon.api.common.constans.AuthConstans;
import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.LoginModel;
import com.chon.api.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("")
public class LoginController {

//    @Autowired
//    private TokenEndpoint tokenEndpoint;
//
//    @Autowired
//    private UsersService usersService;
//
//    @PostMapping("/login")
//    public ResponseEntity<OAuth2AccessToken> login(@RequestBody LoginModel dto) throws HttpRequestMethodNotSupportedException {
//
//        Map<String, String> params = new HashMap<>();
//        params.put("client_id", AuthConstans.CLIEN_ID);
//        params.put("client_secret", AuthConstans.CLIENT_SECRET);
//        params.put("grant_type", "password");
//        params.put("username", dto.getUsername());
//        params.put("password", dto.getPassword());
//        var authenticate = new UsernamePasswordAuthenticationToken(AuthConstans.CLIEN_ID, "", new ArrayList<>());
//        return this.tokenEndpoint.postAccessToken(authenticate, params);
//    }

//    @PostMapping("/send-otp")
//    public ResponseData<Object> verify(@RequestParam String email) {
//        return new ResponseData<>().success(usersService.sendOtp(email));
//    }
//
//    @PostMapping("/vefify-otp")
//    public ResponseData<Object> vefifyOtp(@RequestParam String tokenVerify, @RequestParam String digitalOtp) {
//        return new ResponseData<>().success(usersService.vefifyOtp(tokenVerify, digitalOtp));
//    }
//
//    @PostMapping("/first-password")
//    public ResponseData<Object> savePasswordFirst(@RequestParam String tokenVerify, @RequestParam String password, @RequestParam String rePassword) {
//        return new ResponseData<>().success(usersService.savePasswordFirst(tokenVerify, password, rePassword));
//    }
}
