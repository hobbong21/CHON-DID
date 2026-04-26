package com.chon.api.repository;

import com.chon.api.entity.SubLevelEntity;
import com.chon.api.model.category.SubLevelListResModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubLevelRepository extends JpaRepository<SubLevelEntity, Long> {
    List<SubLevelEntity> findAllByLevelCode(String code);
}
