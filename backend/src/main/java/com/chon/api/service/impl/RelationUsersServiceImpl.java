package com.chon.api.service.impl;

import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.RelationUsersEntity;
import com.chon.api.model.relation.*;
import com.chon.api.repository.CardInfoRepository;
import com.chon.api.repository.RelationUsersRepository;
import com.chon.api.service.RelationUsersService;
import com.chon.api.utils.StringBaseUtils;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class RelationUsersServiceImpl implements RelationUsersService {

    @Autowired
    private RelationUsersRepository relationUsersRepository;

    @Autowired
    private CardInfoRepository cardInfoRepository;

    @Autowired
    private UsersContext usersContext;

    @Override
    public RelationUsersEntity create(RelationUsersCreateReq req) {
        Long userIdCreate = null;
        if (usersContext.hasAuthentication()) {
            userIdCreate = usersContext.getCurrentUserId();
        }
        RelationUsersEntity entity = new RelationUsersEntity();

        entity.setRelationId(req.getRelationId());
        entity.setGender(req.getGender());
        entity.setParentId(req.getParentId());
        entity.setSpouseId(req.getSpouseId());
        entity.setCertOwnerId(req.getCertOwnerId());
        entity.setCertRelatedName(req.getCertRelatedName());
        entity.setCertRelatedPhone(req.getCertRelatedPhone());
        entity.setUserIdCreated(userIdCreate);
        entity.setIsActive(ECommon.ACTIVE_STATUS.ACTIVE.value);
        entity.setStatus(0L);
        return relationUsersRepository.save(entity);
    }

    @Override
    public List<RelationUsersDTO> getListRelationUser(RelationUserGetListRequest request) {
        if (request.getPhoneNumber() == null && request.getCertOwnerId() == null) {
            return new ArrayList<>();
        }
        return relationUsersRepository.getListRelationUser(request.getCertOwnerId(), request.getPhoneNumber());
    }

    @Override
    public List<RelationUsersDTO> getListRequester(RelationUserGetListRequest request) {
        if (request.getPhoneNumber() == null) {
            throw new IAException(ErrConstans.INPUT_INVALID);
        }
        return relationUsersRepository.getListRequester(request.getPhoneNumber());
    }

    @Override
    @Transactional
    public void deleteRelation(Long rootId) {
        if (rootId == null) {
            throw new RuntimeException("Invalid root id");
        }

        List<RelationUsersEntity> tree =
                relationUsersRepository.findWholeTree(rootId);

        if (tree == null || tree.isEmpty()) {
            return;
        }

        RelationUsersEntity root = tree.stream()
                .filter(r -> r.getId().equals(rootId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Root not found"));

        Set<Long> idsToDelete = new HashSet<>();

        // CASE 1: người phụ (vợ/chồng)
        if (root.getSpouseId() != null) {
            idsToDelete.add(rootId);
            relationUsersRepository.hardDeleteByIds(idsToDelete);
            return;
        }

        // CASE 2: người chính
        else {

            // 1. Lấy toàn bộ id người chính + con cháu
            Set<Long> ownerIds = tree.stream()
                    .map(RelationUsersEntity::getId)
                    .collect(Collectors.toSet());

            idsToDelete.addAll(ownerIds);

            // 2. Lấy toàn bộ vợ/chồng của tất cả các node trong cây
            List<RelationUsersEntity> spouses =
                    relationUsersRepository.findSpousesByOwnerIds(ownerIds);

            for (RelationUsersEntity spouse : spouses) {
                idsToDelete.add(spouse.getId());
            }

            relationUsersRepository.hardDeleteByIds(idsToDelete);
        }
    }


    @Override
    public RelationUsersEntity update(RelationUsersUpdateReq req) {

        RelationUsersEntity entity = relationUsersRepository.findById(req.getId())
                .orElseThrow(() -> new RuntimeException("Relation user not found"));
        Long certOwnerId = entity.getCertOwnerId();
        if (!StringBaseUtils.isNullOrEmpty(req.getCertRelatedPhone())) {
            if (relationUsersRepository.existsByCertOwnerIdAndCertRelatedPhone(
                    certOwnerId,
                    req.getCertRelatedPhone())) {
                throw new IAException(ErrConstans.PHONE_NUMBER_EXISTED);
            }
        }
        Optional.ofNullable(req.getGender()).ifPresent(entity::setGender);
        Optional.ofNullable(req.getCertRelatedName()).ifPresent(entity::setCertRelatedName);
        Optional.ofNullable(req.getCertRelatedPhone()).ifPresent(entity::setCertRelatedPhone);
        Optional.ofNullable(req.getCertRelatedId()).ifPresent(entity::setCertRelatedId);
        Optional.ofNullable(req.getIsCollapsed()).ifPresent(entity::setIsCollapsed);
        Optional.ofNullable(req.getParentId()).ifPresent(entity::setParentId);

        entity.setIsActive(ECommon.ACTIVE_STATUS.ACTIVE.value);

        return relationUsersRepository.save(entity);
    }

    @Override
    public List<RelationGetListDTO> getListRelationType() {
        return relationUsersRepository.getListRelationType();
    }

}