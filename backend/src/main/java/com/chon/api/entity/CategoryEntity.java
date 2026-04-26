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


@Data
@Entity
@Table(name = "category")
@EqualsAndHashCode(callSuper = false)
public class CategoryEntity implements Serializable {

    private static final long serialVersionUID = 6813521637995876537L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "display_name")
    private String displayName;

    @Column(name = "display_value")
    private String displayValue;

    @Column(name = "is_active")
    private Long isActive;

    @Column(name = "display_order")
    private Long displayOrder;

    @Column(name = "level_code")
    private String levelCode;

}

