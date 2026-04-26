package com.chon.api.model.relation;

import lombok.Data;

@Data
public class RelationUsersUpdateReq {
    private Long id;
    private Long Gender;
    private Long parentId;
    private String certRelatedName;
    private String certRelatedPhone;
    private Long certRelatedId;
    private Boolean isCollapsed;
}
