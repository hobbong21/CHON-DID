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

@Entity
@Table(name = "relation_users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RelationUsersEntity implements Serializable {

    private static final long serialVersionUID = -1245904693667392277L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name = "relation_id")
    private Long relationId;

    @Column(name = "gender")
    private Long gender;

    @Column(name = "parent_id")
    private Long parentId;

    @Column(name = "spouse_id")
    private Long spouseId;

    @Column(name = "cert_owner_id")
    private Long certOwnerId;

    @Column(name = "cert_related_id")
    private Long certRelatedId;

    @Column(name = "cert_related_name")
    private String certRelatedName;

    @Column(name = "cert_related_phone")
    private String certRelatedPhone;

    @Column(name = "is_active")
    private Long isActive;

    @Column(name = "status")
    private Long status;

    @Column(name = "user_id_created")
    private Long userIdCreated;

    @Column(name = "is_collapsed")
    private Boolean isCollapsed;
}
