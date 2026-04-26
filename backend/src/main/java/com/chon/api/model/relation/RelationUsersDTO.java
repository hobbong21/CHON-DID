package com.chon.api.model.relation;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RelationUsersDTO {
    private Long id;

    private Long relationId;

    private Long gender;

    private Long parentId;

    private Long spouseId;

    private Long certOwnerId;

    private Long certRelatedId;

    private String certRelatedName;

    private String certRelatedPhone;

    private Long isActive;

    private Long status;

    private Long userIdCreated;

    private String relationType;

    private Boolean isCollapsed;

    private String imgPath;

    private String cardName;

    private String certOwnerName;

    private String certOwnerPhone;
}
