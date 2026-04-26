package com.chon.api.repository;

import com.chon.api.entity.RefreshTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.Optional;

@Repository
public interface RefreshTokenRepository extends JpaRepository<RefreshTokenEntity, Long> {

    Optional<RefreshTokenEntity> findByTokenJtiAndRevokedFalse(String tokenJti);

    Optional<RefreshTokenEntity> findByTokenJti(String tokenJti);

    @Modifying
    @Query("UPDATE RefreshTokenEntity r SET r.revoked = true, r.revokedAt = CURRENT_TIMESTAMP WHERE r.familyId = :familyId AND r.revoked = false")
    void revokeFamily(String familyId);

    @Modifying
    @Query("UPDATE RefreshTokenEntity r SET r.revoked = true, r.revokedAt = CURRENT_TIMESTAMP WHERE r.userId = :userId AND r.revoked = false")
    void revokeAllByUser(Long userId);

    @Modifying
    @Query("DELETE FROM RefreshTokenEntity r WHERE r.expiresAt < :now OR (r.revoked = true AND r.revokedAt < :cutoff)")
    void cleanupExpired(Date now, Date cutoff);
}
