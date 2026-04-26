package com.chon.api.repository;

import com.chon.api.entity.RelationUsersEntity;

import com.chon.api.model.relation.RelationGetListDTO;
import com.chon.api.model.relation.RelationUsersDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface RelationUsersRepository extends JpaRepository<RelationUsersEntity, Long> {
    @Query("""
            SELECT DISTINCT new com.chon.api.model.relation.RelationUsersDTO(
                        r.id,
                        r.relationId,
                        r.gender,
                        r.parentId,
                        r.spouseId,
                        r.certOwnerId,
                        r.certRelatedId,
                        r.certRelatedName,
                        r.certRelatedPhone,
                        r.isActive,
                        r.status,
                        r.userIdCreated,
                        re.type,
                        r.isCollapsed,
                        c.imgPath,
                        c.name,
                        null,
                        null
            )
            FROM RelationUsersEntity r
            LEFT JOIN RelationEntity re ON r.relationId = re.id
            LEFT JOIN CardInfoEntity c ON r.certRelatedId = c.id and c.isDelete = 0
            WHERE r.certOwnerId = :certOwnerId OR r.certRelatedPhone  = :phoneNumber
            """
    )
    List<RelationUsersDTO> getListRelationUser(
            @Param("certOwnerId") Long certOwnerId,
            @Param("phoneNumber") String phoneNumber
    );

    @Query("""
            SELECT DISTINCT new com.chon.api.model.relation.RelationUsersDTO(
                        r.id,
                        r.relationId,
                        r.gender,
                        r.parentId,
                        r.spouseId,
                        r.certOwnerId,
                        r.certRelatedId,
                        r.certRelatedName,
                        r.certRelatedPhone,
                        r.isActive,
                        r.status,
                        r.userIdCreated,
                        re.type,
                        r.isCollapsed,
                        null,
                        null,
                        c.name,
                        c.phoneNumber
            )
            FROM RelationUsersEntity r
            LEFT JOIN RelationEntity re ON r.relationId = re.id
            INNER JOIN CardInfoEntity c ON r.certOwnerId = c.id and c.isDelete = 0
            WHERE r.certRelatedPhone  = :phoneNumber
            """
    )
    List<RelationUsersDTO> getListRequester(
            @Param("phoneNumber") String phoneNumber
    );

    @Query(
            value =
                    "WITH RECURSIVE tree AS ( " +
                            "   SELECT * FROM relation_users WHERE id = :rootId " +
                            "   UNION ALL " +
                            "   SELECT c.* FROM relation_users c " +
                            "   JOIN tree p ON c.parent_id = p.id " +
                            ") " +
                            "SELECT DISTINCT * FROM tree",
            nativeQuery = true
    )
    List<RelationUsersEntity> findWholeTree(@Param("rootId") Long rootId);

    @Query("SELECT r FROM RelationUsersEntity r WHERE r.spouseId IN :ids")
    List<RelationUsersEntity> findSpousesByOwnerIds(@Param("ids") Set<Long> ids);


    @Modifying
    @Query("DELETE FROM RelationUsersEntity r WHERE r.id IN :ids")
    void hardDeleteByIds(@Param("ids") Set<Long> ids);

    @Modifying
    @Query("DELETE FROM RelationUsersEntity r WHERE r.certOwnerId IN :ids")
    void hardDeleteByCertOwnerId(@Param("ids") List<Long> ids);

    RelationUsersEntity findByCertOwnerIdAndCertRelatedPhone(Long refVerifyId, String phoneNumber);

    List<RelationUsersEntity> findAllByCertOwnerIdAndStatus(Long certOwnerId, Long status);

    @Query("""
            SELECT new com.chon.api.model.relation.RelationGetListDTO(
                    r.id,
                    r.type
            )
            FROM RelationEntity r
            """)
    List<RelationGetListDTO> getListRelationType();

    Boolean existsByCertOwnerIdAndCertRelatedPhone(Long certOwnerId, String phoneNumber);

    @Query(value =
        "SELECT phone_number, name, relation_type FROM (" +
        // 1. People in MY family tree who have CHON cards
        "  SELECT REPLACE(c.phone_number, '-', '') AS phone_number, c.name AS name, re.type AS relation_type " +
        "  FROM relation_users r " +
        "  JOIN relation re ON r.relation_id = re.id " +
        "  JOIN card_info c ON r.cert_related_id = c.id AND c.is_delete = 0 " +
        "  WHERE r.cert_owner_id IN (SELECT ci.id FROM card_info ci WHERE ci.user_id = :userId AND ci.is_delete = 0) " +
        "  AND c.phone_number IS NOT NULL AND c.phone_number != '' " +
        " UNION " +
        // 2. CHON users who have ME in THEIR family tree (match both with and without dashes)
        "  SELECT REPLACE(c2.phone_number, '-', '') AS phone_number, c2.name AS name, re2.type AS relation_type " +
        "  FROM relation_users r2 " +
        "  JOIN relation re2 ON r2.relation_id = re2.id " +
        "  JOIN card_info c2 ON r2.cert_owner_id = c2.id AND c2.is_delete = 0 " +
        "  WHERE (r2.cert_related_phone = :myPhone OR r2.cert_related_phone = :myPhoneNormalized) " +
        "  AND c2.phone_number IS NOT NULL AND c2.phone_number != '' " +
        ") AS combined",
        nativeQuery = true
    )
    List<Object[]> findCallShieldContactsRaw(
        @Param("userId") Long userId,
        @Param("myPhone") String myPhone,
        @Param("myPhoneNormalized") String myPhoneNormalized
    );

}
