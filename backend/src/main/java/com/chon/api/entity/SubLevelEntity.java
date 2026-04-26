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
@Table(name = "sub_level")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubLevelEntity implements Serializable {
    private static final long serialVersionUID = 2771789480355736735L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "level_code")
    private String levelCode;

    @Column(name = "display_name")
    private String displayName;

    @Column(name = "display_value")
    private String displayValue;

    @Column(name = "is_active")
    private Long isActive;

    @Column(name = "display_order")
    private Long displayOrder;

}
