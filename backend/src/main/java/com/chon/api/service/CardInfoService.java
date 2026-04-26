package com.chon.api.service;


import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.entity.RelationUsersEntity;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.identifier.*;
import com.chon.api.model.mess.MessModel;

import java.io.IOException;
import java.util.List;

public interface CardInfoService {
    CertificateCreateResModel identifierCreate(IdentifierCreateReqModel request) throws IOException;

    List<HomeInfoDTO> getListHomeInfo();

    CardInfoDTO getDetailCardInfo(Long id);

    MessModel identifierUpdate(IdentifierUpdateReqModel request) throws IOException;

    MessModel verifierCreate(VerifierCreateReqModel request);

    List<VerifyContactDTO> getListVerification(Long cardId, Long verifyType);

    MessModel verifierUpdate(VerifierUpdateReqModel request);

    MessModel verifierDelete(Long id);

    ListJson<CardInfoDTO> getListCardInfoByUserIdAndStatus(Integer pageIndex, Integer pageSize, Boolean isVerified);

    List<RelationUsersEntity> initFamilyTree(Long certOwnerId);

    MessModel deleteCardInfos(List<Long> ids);
}
