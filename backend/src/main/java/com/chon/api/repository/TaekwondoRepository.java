package com.chon.api.repository;


import com.chon.api.entity.TaekwondoInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaekwondoRepository extends JpaRepository<TaekwondoInfoEntity, Long> {
    TaekwondoInfoEntity findByUserId(Long currentUserId);

    Boolean existsByIdNumberAndUserIdNot(String idNumber, Long currentUserId);

    TaekwondoInfoEntity findByUserIdOrIdNumber(Long currentUserId, String idNumber);

    List<TaekwondoInfoEntity> findAllByUserId(Long currentUserId);

    TaekwondoInfoEntity findByIdNumber(String idNumber);
}
