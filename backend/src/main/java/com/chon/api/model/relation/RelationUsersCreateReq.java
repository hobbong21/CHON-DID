package com.chon.api.model.relation;

import lombok.Data;

@Data
public class RelationUsersCreateReq {
    private Long gender;
    private Long parentId;
    private Long spouseId;
    private Long certOwnerId;
    private Long relationId;
    private String certRelatedName;
    private String certRelatedPhone;
}

