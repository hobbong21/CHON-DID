package com.chon.api.repository;


import com.chon.api.entity.CardInfoEntity;
import com.chon.api.model.identifier.CardInfoDTO;
import com.chon.api.model.identifier.VerifyContactDTO;
import com.chon.api.repository.custom.CardInfoRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

@Repository
public interface CardInfoRepository extends JpaRepository<CardInfoEntity, Long>, CardInfoRepositoryCustom {
    CardInfoEntity findByIdNumber(String idNumber);

    @Query("SELECT new com.chon.api.model.identifier.CardInfoDTO(c.id, c.pointVerify, c.imgPath, c.status, c.digitalSignature)  FROM CardInfoEntity c WHERE c.userId =:userId")
    List<CardInfoDTO> getListCardInfo(Long userId);

    @Query("SELECT new com.chon.api.model.identifier.CardInfoDTO(" +
            "c.id," +
            " c.pointVerify," +
            " c.imgPath," +
            " c.status," +
            " c.idNumber," +
            " c.name," +
            " c.address," +
            " c.issuingAuthority," +
            " c.gender," +
            " c.nationality," +
            " c.refVisaType," +
            " c.issuedDate," +
            " c.txId," +
            " c.blockHeight," +
            " c.englishName," +
            " c.phoneNumber" +
            ")  " +
            "FROM CardInfoEntity c " +
            "WHERE c.id =:cardId " +
            "ORDER BY c.createDate DESC")
    CardInfoDTO getDetailCardInfo(Long cardId);

    @Query("SELECT new com.chon.api.model.identifier.VerifyContactDTO(" +
            "vc.id," +
            " vc.verifyType," +
            " vc.refVerifyId," +
            " vc.refTier," +
            " vc.name," +
            " vc.phoneNumber," +
            " vc.subLevel," +
            " vc.status," +
            " sl.displayName" +
            ")  " +
            "FROM VerifyContactEntity vc " +
            "join SubLevelEntity sl on sl.displayValue = vc.subLevel and sl.levelCode = vc.levelCode " +
            "WHERE vc.refVerifyId =:cardId " +
            "AND vc.verifyType =:verifyType " +
            "ORDER BY vc.verifyType DESC")
    List<VerifyContactDTO> getListVerification(Long cardId, Long verifyType);

    @Query("SELECT new com.chon.api.model.identifier.CardInfoDTO(" +
            "c.id," +
            " c.userId," +
            " c.idNumber," +
            " c.name," +
            " c.address," +
            " c.issuingAuthority," +
            " c.gender," +
            " c.nationality," +
            " c.refVisaType," +
            " c.issuedDate," +
            " c.phoneNumber," +
            " c.pointVerify," +
            " c.imgPath" +
            ")  " +
            "FROM CardInfoEntity c " +
            "WHERE c.isDelete = :isDelete and c.userId = :userId " +
            "AND (:status IS NULL OR c.status = :status) " +
            "ORDER BY c.createDate DESC")
    Page<CardInfoDTO> getListCardInfoByUserIdAndStatus(Long userId, Long status, Long isDelete, Pageable pageable);

    CardInfoEntity findByUserIdAndIsDelete(Long currentUserId, Long isDelete);

    CardInfoEntity findByUserIdOrIdNumber(Long currentUserId, String idNumber);

    Boolean existsByIdNumberAndUserIdNotAndIsDelete(String idNumber, Long currentUserId,Long isDelete);

    List<CardInfoEntity> findAllByUserIdAndIsDelete(Long currentUserId, Long isDelete);

    CardInfoEntity findByIdAndIsDelete(Long cardId, Long isDelete);

    CardInfoEntity findByCreateByOrIdNumber(String phoneNumber, String idNumber);

    CardInfoEntity findByPhoneNumberAndIdNotIn(String phoneNumber, Collection<Long> ids);

    CardInfoEntity findByPhoneNumberOrIdNumber(String phoneNumber, String idNumber);

    List<CardInfoEntity> findAllByPhoneNumber(String phoneNumber);

    @Transactional
    @Modifying
    @Query(value = "update CardInfoEntity c set c.isDelete =:isDelete where c.id in(:ids)")
    void deleteCarInfo(@Param("isDelete") Long isDelete, @Param("ids") List<Long> ids);
}
