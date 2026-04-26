package com.chon.api.service;

import com.chon.api.entity.RelationUsersEntity;
import com.chon.api.model.relation.*;

import java.util.List;

public interface RelationUsersService {

    RelationUsersEntity create(RelationUsersCreateReq req);

    List<RelationUsersDTO> getListRelationUser(RelationUserGetListRequest request);

    List<RelationUsersDTO> getListRequester(RelationUserGetListRequest request);

    void deleteRelation(Long id);

    RelationUsersEntity update(RelationUsersUpdateReq req);

    List<RelationGetListDTO> getListRelationType();
}
