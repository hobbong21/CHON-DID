package com.chon.api.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "relation_template")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RelationTemplateEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "relation_id", nullable = false)
    private Long relationId;

    private Long gender;

    @Column(name = "parent_id")
    private Long parentId;   // trỏ relation_template.id

    @Column(name = "spouse_id")
    private Long spouseId;   // trỏ relation_template.id

    @Column(name = "code")
    private String code;

    @Column(name = "level")
    private Integer level;

    @Column(name = "is_active")
    private Boolean isActive;
}
