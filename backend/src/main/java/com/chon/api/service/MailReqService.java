package com.chon.api.service;


import com.chon.api.model.email.EmailReqModel;
import com.chon.api.model.email.EmailResModel;

public interface MailReqService {
    EmailResModel saveMailReqInfo(EmailReqModel emailReqModel);
}
