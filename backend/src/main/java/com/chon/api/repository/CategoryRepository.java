package com.chon.api.repository;

import com.chon.api.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
    List<CategoryEntity> findByCodeOrderByDisplayOrder(String code);

    CategoryEntity findByCode(String blockHeight);
}
