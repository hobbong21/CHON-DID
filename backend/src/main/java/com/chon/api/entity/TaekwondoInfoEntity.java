package com.chon.api.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "taekwondo_info")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaekwondoInfoEntity implements Serializable {

    private static final long serialVersionUID = -6031932650723942083L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "name")
    private String name;

    @Column(name = "id_number")
    private String idNumber;

    @Column(name = "nationality")
    private String nationality;

    @Column(name = "level")
    private Long level;

    @Column(name = "level_number")
    private String levelNumber;

    @Column(name = "issued_date")
    private String issuedDate;

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
}