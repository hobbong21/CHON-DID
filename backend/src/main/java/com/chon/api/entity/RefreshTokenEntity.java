package com.chon.api.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Data
@Entity
@Table(name = "refresh_tokens")
public class RefreshTokenEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "token_jti", nullable = false, length = 36)
    private String tokenJti;

    @Column(name = "access_jti", nullable = false, length = 36)
    private String accessJti;

    @Column(name = "family_id", nullable = false, length = 36)
    private String familyId;

    @Column(name = "device_id", length = 64)
    private String deviceId;

    @Column(name = "expires_at", nullable = false)
    private Date expiresAt;

    @Column(name = "absolute_expires_at", nullable = false)
    private Date absoluteExpiresAt;

    @Column(name = "revoked")
    private Boolean revoked = false;

    @Column(name = "revoked_at")
    private Date revokedAt;

    @Column(name = "created_at")
    private Date createdAt = new Date();
}
