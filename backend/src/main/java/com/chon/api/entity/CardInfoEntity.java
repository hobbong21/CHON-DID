package com.chon.api.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity
@Table(name = "card_info")
@EqualsAndHashCode(callSuper = false)
public class CardInfoEntity implements Serializable {

    private static final long serialVersionUID = 6761653987723871771L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "id_number")
    private String idNumber;

    @Column(name = "name")
    private String name;

    @Column(name = "address")
    private String address;

    @Column(name = "issuingAuthority")
    private String issuingAuthority;

    @Column(name = "gender")
    private String gender;

    @Column(name = "nationality")
    private String nationality;

    @Column(name = "ref_visa_type")
    private String refVisaType;

    @Column(name = "issued_date")
    private String issuedDate;

    @Column(name = "phone_number")
    private String phoneNumber;

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
    private Long status;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "create_by")
    private String createBy;

    @Column(name = "update_date")
    private Date updateDate;

    @Column(name = "update_by")
    private String updateBy;

    @Column(name = "block_height")
    private String blockHeight;

    @Column(name = "tx_id")
    private String txId;

    @Column(name = "verify_date")
    private Date verifyDate;

    @Column(name = "english_name")
    private String englishName;

    @Column(name = "verify_did")
    private String verifyDid;

    @Column(name = "license_number")
    private String licenseNumber;

    @Column(name = "license_validity")
    private String licenseValidity;

    @Column(name = "expiration_date_passport")
    private String expirationDatePassport;

    @Column(name = "date_of_birth")
    private String dateOfBirth;

    @Column(name = "is_delete")
    private Long isDelete;
}

