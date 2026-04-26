package com.chon.api.repository;


import com.chon.api.entity.PointVerifyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PointerVerifyRepository extends JpaRepository<PointVerifyEntity, Long> {
    PointVerifyEntity findByVerifyTypeAndRefTier(Long verifyType, Long refTier);
}
