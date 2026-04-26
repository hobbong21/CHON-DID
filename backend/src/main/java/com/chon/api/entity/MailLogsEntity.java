package com.chon.api.entity;

import lombok.Data;

import jakarta.persistence.*;
import java.io.Serializable;


@Data
@Entity
@Table(name = "mail_logs")
public class MailLogsEntity implements Serializable {
    private static final long serialVersionUID = 4934870349691533500L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "mail_req_id")
    private Long mailReqId;

    @Column(name = "msg_detail")
    private String msgDetail;

    @Column(name = "status")
    private Long status;
}
