package com.chon.api.repository;

import com.chon.api.entity.OtpCodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.Optional;

@Repository
public interface OtpCodeRepository extends JpaRepository<OtpCodeEntity, Long> {

    Optional<OtpCodeEntity> findFirstByPhoneNumberAndPurposeAndUsedFalseAndExpiresAtAfterOrderByCreatedAtDesc(
            String phoneNumber, OtpCodeEntity.OtpPurpose purpose, Date now);

    long countByPhoneNumberAndPurposeAndCreatedAtAfter(String phoneNumber, OtpCodeEntity.OtpPurpose purpose, Date since);

    @Modifying
    @Query("DELETE FROM OtpCodeEntity o WHERE o.expiresAt < :now")
    void cleanupExpired(Date now);
}
