package com.chon.api.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "clan_info")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClanInfoEntity implements Serializable {

    private static final long serialVersionUID = -5284650929575142070L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "user_id")
    private Long userId; // Tham chiếu đến users(id)

    @Column(name = "clan_name")
    private String clanName;

    @Column(name = "id_number")
    private String idNumber;

    @Column(name = "origin")
    private String origin;

    @Column(name = "birth")
    private String birth;

    @Column(name = "relationship")
    private Long relationship; // TINYINT

    @Column(name = "address")
    private String address;

    @Column(name = "other_info")
    private String otherInfo;

    @Column(name = "img_path")
    private String imgPath;

    @Column(name = "point_verify")
    private Long pointVerify;

    @Column(name = "digital_signature")
    private String digitalSignature;

    @Column(name = "private_key")
    private String privateKey;

    @Column(name = "public_key")
    private String publicKey;

    @Column(name = "status")
    private Long status; // TINYINT UNSIGNED

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "create_by")
    private String createBy;

    @Column(name = "update_date")
    private Date updateDate;

    @Column(name = "update_by")
    private String updateBy;

    @Column(name = "pa")
    private String pa;

    @Column(name = "se")
    private String se;

    @Column(name = "personal_name")
    private String personalName;

    @Column(name = "personal_given_name")
    private String personalGivenName;

    @Column(name = "personal_nickname")
    private String personalNickname;

    @Column(name = "family_occupation")
    private String familyOccupation;

    @Column(name = "gps")
    private String gps;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "block_height")
    private String blockHeight;

    @Column(name = "tx_id")
    private String txId;

    @Column(name = "verify_date")
    private Date verifyDate;

    @Column(name = "english_name")
    private String englishName;
}