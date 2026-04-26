package com.chon.api.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity
@Table(name = "users")
@EqualsAndHashCode(callSuper = false)
public class UsersEntity implements Serializable {
    private static final long serialVersionUID = 2284590910200525079L;


    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_name")
    private String userName;

    @JsonIgnore
    @Column(name = "password")
    private String password;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "is_active")
    private Long isActive;

    @Column(name = "status")
    private Long status;

    @Column(name = "email")
    private String email;

    @Column(name = "failed_login_attempts")
    private Integer failedLoginAttempts = 0;

    @Column(name = "locked_until")
    private Date lockedUntil;

    @Column(name = "two_fa_secret")
    private String twoFaSecret;

    @Column(name = "two_fa_enabled")
    private Boolean twoFaEnabled = false;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "create_by")
    private String createBy;

    @Column(name = "update_date")
    private Date updateDate;

    @Column(name = "update_by")
    private String updateBy;
}

