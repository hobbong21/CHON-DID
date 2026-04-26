package com.chon.api.schedule;


import com.chon.api.common.AppProperties;
import com.chon.api.common.enums.EMailStatus;
import com.chon.api.entity.MailLogsEntity;
import com.chon.api.entity.MailReqEntity;
import com.chon.api.model.email.SendResModel;
import com.chon.api.repository.MailLogsRepository;
import com.chon.api.repository.MailReqRepository;
import com.chon.api.utils.MailUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SendMailSchedule {
    private static final Logger LOGGER = LogManager.getLogger(SendMailSchedule.class);

    @Autowired
    private AppProperties appProperties;

    @Autowired
    private MailReqRepository mailReqRepo;

    @Autowired
    private MailLogsRepository mailLogsRepo;

    @Scheduled(initialDelay = 2 * 1000, fixedDelay = 3 * 1000)
    public void processSendMail() {
        if (appProperties.scheduleSendMail) {
            LOGGER.info("=========================START PROCESS SEND MAIL=========================");
            List<MailReqEntity> lstReq = mailReqRepo.findByStatus(EMailStatus.NEW.value);

            if (!lstReq.isEmpty()) {
                for (MailReqEntity req : lstReq) {
                    MailLogsEntity logs = new MailLogsEntity();
                    logs.setMailReqId(req.getId());
                    try {
                        SendResModel rs = MailUtils.sendEmail(
                                appProperties.mailHost,
                                appProperties.mailPort,
                                req.getMailFrom(),
                                req.getMailFromPassword(),
                                req.getMailContent(),
                                req.getMailTo(),
                                req.getSubject(),
                                null);

                        if (rs.isFlag()) {
                            logs.setStatus(EMailStatus.SUCCESS.value);
                            req.setStatus(EMailStatus.SUCCESS.value);
                        } else {
                            logs.setMsgDetail(rs.getMsgContent());
                            logs.setStatus(EMailStatus.FAILED.value);
                            req.setStatus(EMailStatus.FAILED.value);
                        }
                    } catch (Exception e) {
                        LOGGER.error(e);
                        logs.setMsgDetail(e.getMessage());
                        logs.setStatus(EMailStatus.FAILED.value);
                        req.setStatus(EMailStatus.FAILED.value);
                    }

                    mailLogsRepo.save(logs);
                    mailReqRepo.save(req);
                }
            }

            LOGGER.info("=========================END PROCESS SEND MAIL=========================");
        }
    }
}
