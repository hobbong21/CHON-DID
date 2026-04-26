package com.chon.api.entity;


import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "mail_temp")
@EqualsAndHashCode(callSuper = false)
public class MailTempEntity implements Serializable {
    private static final long serialVersionUID = -2220972806271911334L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "mail_code")
    private String mailCode;

    @Column(name = "subjects")
    private String subjects;

    @Column(name = "content")
    private String content;
}
