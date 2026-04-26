package com.chon.api.service.impl;

import com.chon.api.common.enums.EMailStatus;
import com.chon.api.entity.MailReqEntity;
import com.chon.api.model.email.EmailReqModel;
import com.chon.api.model.email.EmailResModel;
import com.chon.api.repository.MailReqRepository;
import com.chon.api.service.MailReqService;
import org.apache.logging.log4j.ThreadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MailReqServiceImpl implements MailReqService {

    @Autowired
    MailReqRepository mailReqRepository;


    @Override
    public EmailResModel saveMailReqInfo(EmailReqModel emailReqModel) {
        MailReqEntity req = new MailReqEntity();
        req.setClientMessageId(ThreadContext.get("clientMessageId"));
        req.setMailFrom(emailReqModel.getMailUser());
        req.setMailFromPassword(emailReqModel.getMailPass());
        req.setMailTo(emailReqModel.getToAddress());
        req.setMailCC(emailReqModel.getCcAddress());
        req.setSubject(emailReqModel.getSubject());
        req.setMailContent(emailReqModel.getContentBody());
        req.setStatus(EMailStatus.NEW.value);
        mailReqRepository.save(req);
        return new EmailResModel(emailReqModel.getId());
    }
}
