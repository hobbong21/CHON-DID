package com.chon.api.entity;


import lombok.Data;

import jakarta.persistence.*;
import java.io.Serializable;


@Data
@Entity
@Table(name = "mail_req")
public class MailReqEntity implements Serializable {
    private static final long serialVersionUID = 318179952843005722L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "client_message_id")
    private String clientMessageId;

    @Column(name = "mail_from")
    private String mailFrom;

    @Column(name = "mail_from_password")
    private String mailFromPassword;

    @Column(name = "mail_to")
    private String mailTo;

    @Column(name = "mail_cc")
    private String mailCC;

    @Column(name = "subject")
    private String subject;

    @Column(name = "mail_content")
    private String mailContent;

    @Column(name = "status")
    private Long status;

}
