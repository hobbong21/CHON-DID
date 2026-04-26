package com.chon.api.model.identifier;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RequesterDTO {
    private Long id;
    private Long verifyType;
    private Long refVerifyId;
    private Long refTier;
    private String name;
    private String phoneNumber;
    private Long status;
    public RequesterDTO(Long id, Long verifyType, Long refVerifyId, Long refTier, String name, String phoneNumber, Long status) {
        this.id = id;
        this.verifyType = verifyType;
        this.refVerifyId = refVerifyId;
        this.refTier = refTier;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }

}
