package com.chon.api.repository;


import com.chon.api.entity.VerifyContactEntity;
import com.chon.api.model.identifier.RequesterDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VerifyContactRepository extends JpaRepository<VerifyContactEntity, Long> {

    List<VerifyContactEntity> findByRefVerifyId(Long id);

    VerifyContactEntity findByRefVerifyIdAndVerifyTypeAndPhoneNumber(Long refVerifyId, Long verifyType, String phoneNumber);

    @Query(value = """
            SELECT new com.chon.api.model.identifier.RequesterDTO(
                vc.id,
                vc.verifyType,
                vc.refVerifyId,
                vc.refTier,
                c.name,
                user.phoneNumber,
                vc.status
                )
            FROM VerifyContactEntity vc
            JOIN CardInfoEntity c on vc.refVerifyId = c.id
            LEFT JOIN UsersEntity user on c.userId = user.id
            WHERE vc.verifyType = :verifyType AND vc.phoneNumber = :phoneNumber
            """)
    List<RequesterDTO> getListRequesterCard(Long verifyType, String phoneNumber);

    @Query(value = """
            SELECT new com.chon.api.model.identifier.RequesterDTO(
                vc.id,
                vc.verifyType,
                vc.refVerifyId,
                vc.refTier,
                clan.personalName,
                user.phoneNumber,
                vc.status
                )
            FROM VerifyContactEntity vc
            JOIN ClanInfoEntity clan ON vc.refVerifyId = clan.id
            LEFT JOIN UsersEntity user on clan.userId = user.id
            WHERE vc.verifyType = :verifyType AND vc.phoneNumber = :phoneNumber
            """)
    List<RequesterDTO> getListRequesterClan(Long verifyType, String phoneNumber);

    @Query(value = """
            SELECT new com.chon.api.model.identifier.RequesterDTO(
                vc.id,
                vc.verifyType,
                vc.refVerifyId,
                vc.refTier,
                teak.name,
                user.phoneNumber,
                vc.status
                )
            FROM VerifyContactEntity vc
            JOIN TaekwondoInfoEntity teak ON vc.refVerifyId = teak.id
            LEFT JOIN UsersEntity user on teak.userId = user.id
            WHERE vc.verifyType = :verifyType AND vc.phoneNumber = :phoneNumber
            """)
    List<RequesterDTO> getListRequesterTeakwondo(Long verifyType, String phoneNumber);
}
