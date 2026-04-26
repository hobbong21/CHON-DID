package com.chon.api.repository;

import com.chon.api.entity.RelationTemplateEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RelationTemplateRepository extends JpaRepository<RelationTemplateEntity, Long> {
    List<RelationTemplateEntity> findByIsActiveTrueOrderByLevelAsc();
}
