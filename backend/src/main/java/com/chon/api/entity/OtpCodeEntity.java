package com.chon.api.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Data
@Entity
@Table(name = "otp_codes")
public class OtpCodeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "phone_number", nullable = false, length = 20)
    private String phoneNumber;

    @Column(name = "code_hash", nullable = false, length = 64)
    private String codeHash;

    @Column(name = "purpose", nullable = false)
    @Enumerated(EnumType.STRING)
    private OtpPurpose purpose;

    @Column(name = "expires_at", nullable = false)
    private Date expiresAt;

    @Column(name = "attempts")
    private Integer attempts = 0;

    @Column(name = "used")
    private Boolean used = false;

    @Column(name = "created_at")
    private Date createdAt = new Date();

    public enum OtpPurpose {
        REGISTER, PASSWORD_RESET, TWO_FA, PHONE_VERIFY
    }
}
