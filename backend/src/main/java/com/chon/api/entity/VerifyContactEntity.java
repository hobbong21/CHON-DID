package com.chon.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "verify_contact")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifyContactEntity implements Serializable {

    private static final long serialVersionUID = -1245904693667392277L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "verify_type")
    private Long verifyType;

    @Column(name = "ref_verify_id")
    private Long refVerifyId;

    @Column(name = "ref_tier")
    private Long refTier;

    @Column(name = "name")
    private String name;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "status")
    private Long status;

    @Column(name = "sub_level")
    private String subLevel;

    @Column(name = "level_code")
    private String levelCode;
}