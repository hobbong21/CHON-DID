package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.common.enums.EMailTemp;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.MailTempEntity;
import com.chon.api.entity.UsersEntity;
import com.chon.api.model.email.EmailReqModel;
import com.chon.api.model.otp.DigitalOtpModel;
import com.chon.api.repository.MailTempRepository;
import com.chon.api.repository.UsersRepository;
import com.chon.api.service.MailReqService;
import com.chon.api.service.UsersService;
import com.chon.api.utils.DateTimeUtils;
import com.chon.api.utils.EncryptionUtils;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.mapper.GsonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;


@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private UsersRepository repo;

    @Autowired
    private MailReqService mailReqService;

    @Autowired
    private MailTempRepository mailTempRepo;

//    @Autowired
//    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UsersEntity getByUserName(String userName) {
        return repo.findByUserName(userName);
    }

    @Override
    public Map<String, Object> sendOtp(String email) {
        if (StringBaseUtils.isNullOrEmpty(email)) {
            throw new IAException(ErrConstans.INPUT_EMPTY);
        }
        UsersEntity user = repo.findByUserName(email);
        if (user != null) {
            throw new IAException(ErrConstans.LOGIN_ERROR_01);
        }

        try {
            //save OTP
            int otpDigit = ThreadLocalRandom.current().nextInt(100000, 1000000);

            //send mail
            MailTempEntity mailTemp = mailTempRepo.findByMailCode(EMailTemp.SEND_OTP.value);
            EmailReqModel req = new EmailReqModel();
            List<String> mailParams = new ArrayList<>();
            mailParams.add(String.valueOf(otpDigit));
            String strContent = MessageFormat.format(mailTemp.getContent(), mailParams.toArray());
            req.setContentBody(strContent);
            req.setMailUser(appProperties.mailUser);
            req.setMailPass(appProperties.mailPass);
            req.setSubject(mailTemp.getSubjects());
            req.setToAddress(email);
            mailReqService.saveMailReqInfo(req);

            //gen token set password
            DigitalOtpModel digitalOtp = new DigitalOtpModel();
            digitalOtp.setDigitalOtp(String.valueOf(otpDigit));
            digitalOtp.setEmail(email);
            digitalOtp.setExpiryDate(DateTimeUtils.addTime(3));

            String strToken = EncryptionUtils.encrypt(GsonMapper.toJson(digitalOtp), appProperties.encryptKey);
            Map<String, Object> rs = new HashMap<>();
            rs.put("tokenOTP", strToken);
            return rs;
        } catch (Exception e) {
            throw new IAException(ErrConstans.SYSTEM_ERROR);
        }
    }

    @Override
    public Map<String, Object> vefifyOtp(String tokenVerify, String digitalOtp) {
        if (StringBaseUtils.isNullOrEmpty(tokenVerify)) {
            throw new IAException(ErrConstans.INPUT_EMPTY);
        }

        try {
            String strJson = EncryptionUtils.decrypt(tokenVerify, appProperties.encryptKey);
            DigitalOtpModel digitalOtpModel = GsonMapper.toObject(strJson, DigitalOtpModel.class);

            Date dNow = new Date();

            if (Objects.equals(digitalOtpModel.getDigitalOtp(), digitalOtp)
                    && dNow.before(digitalOtpModel.getExpiryDate())
            ) {
                String strToken = EncryptionUtils.encrypt(digitalOtpModel.getEmail(), appProperties.encryptKey);
                Map<String, Object> rs = new HashMap<>();
                rs.put("tokenVerifyOTP", strToken);
                return rs;
            } else {
                throw new IAException(ErrConstans.OTP_EXPIRED);
            }
        } catch (Exception e) {
            throw new IAException(ErrConstans.SYSTEM_ERROR);
        }
    }

    @Override
    public Map<String, Object> savePasswordFirst(String tokenVerify, String password, String rePassword) {

//        if (StringBaseUtils.isNullOrEmpty(tokenVerify)) {
//            throw new IAException(ErrConstans.INPUT_EMPTY);
//        }
//        if (StringBaseUtils.isNullOrEmpty(password)) {
//            throw new IAException(ErrConstans.INPUT_EMPTY);
//        }
//        if (StringBaseUtils.isNullOrEmpty(rePassword)) {
//            throw new IAException(ErrConstans.INPUT_EMPTY);
//        }
//
//        if (!Objects.equals(password, rePassword)) {
//            throw new IAException(ErrConstans.PASSWORD_NOT_MATCH);
//        }
//
//        try {
//            String email = EncryptionUtils.decrypt(tokenVerify, appProperties.encryptKey);
//            UsersEntity users = new UsersEntity();
//            users.setUserName(email);
//            users.setPassword(bCryptPasswordEncoder.encode(password));
//            users.setIsActive(ECommon.ACTIVE_STATUS.ACTIVE.value);
//            users.setCreateDate(new Date());
//            users.setCreateBy(email);
//            users.setUpdateDate(new Date());
//            users.setUpdateBy(email);
//            repo.save(users);
//
//
//            Map<String, Object> rs = new HashMap<>();
//            rs.put("status", true);
//            return rs;
//        } catch (Exception e) {
//            throw new IAException(ErrConstans.SYSTEM_ERROR);
//        }
        return null;
    }
}