package com.chon.api.utils;


import com.chon.api.model.email.SendResModel;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class MailUtils {
    public static SendResModel sendEmail(String mailHost, String mailPort, String userName, String mailPass, String content, String mailTo, String subject,String urlImg) {
        SendResModel res = new SendResModel();

        Properties prop = new Properties();
        prop.put("mail.smtp.host", mailHost);
        prop.put("mail.smtp.port", mailPort);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.ssl.enable", "true");


        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, mailPass);
            }
        });
        session.setDebug(false);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(userName));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
            message.setSubject(subject, "utf-8");

            //image
            if (!StringBaseUtils.isNullOrEmpty(urlImg)) {
                MimeMultipart multipart = new MimeMultipart("related");
                BodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setContent(content, "text/html;charset=UTF-8");
                multipart.addBodyPart(messageBodyPart);
                messageBodyPart = new MimeBodyPart();
                DataSource fds = new FileDataSource(urlImg);
                messageBodyPart.setDataHandler(new DataHandler(fds));
                messageBodyPart.setHeader("Content-ID", "<image>");
                // add image to the multipart
                multipart.addBodyPart(messageBodyPart);
                message.setContent(multipart);
            } else {
                message.setContent(content, "text/html;charset=UTF-8");
            }
            Transport.send(message);
            res.setFlag(true);
        } catch (MessagingException e) {
            res.setFlag(false);
            res.setMsgContent(e.getMessage());
        }
        return res;
    }
}
