package com.chon.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "point_verify")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointVerifyEntity implements Serializable {

    private static final long serialVersionUID = -1245904693667392277L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "ref_tier")
    private Long refTier;

    @Column(name = "point")
    private Long point;

    @Column(name = "verify_type")
    private Long verifyType;
}