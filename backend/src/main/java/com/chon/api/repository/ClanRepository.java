package com.chon.api.repository;


import com.chon.api.entity.CardInfoEntity;
import com.chon.api.entity.ClanInfoEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface ClanRepository extends JpaRepository<ClanInfoEntity, Long> {
    ClanInfoEntity findByUserId(Long currentUserId);

    List<ClanInfoEntity> findAllByUserId(Long userId);

    ClanInfoEntity findByPhoneNumber(String phoneNumber);

    ClanInfoEntity findByPhoneNumberAndIdNotIn(String phoneNumber, Collection<Long> ids);

    ClanInfoEntity findByIdNumber(String idNumber);
}
