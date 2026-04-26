package com.chon.api.model.relation;

import lombok.Data;

@Data
public class RelationUserGetListRequest {
    private Long certOwnerId;
    private String phoneNumber;

}
