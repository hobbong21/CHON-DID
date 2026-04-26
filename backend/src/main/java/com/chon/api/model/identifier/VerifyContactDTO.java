package com.chon.api.model.identifier;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class VerifyContactDTO {
    private Long id;
    private Long verifyType;
    private Long refVerifyId;
    private Long refTier;
    private String name;
    private String phoneNumber;
    private String subLevel;
    private Long status;
    private String displayName;

    public VerifyContactDTO(Long id, Long verifyType, Long refVerifyId, Long refTier, String name, String phoneNumber, String subLevel, Long status, String displayName) {
        this.id = id;
        this.verifyType = verifyType;
        this.refVerifyId = refVerifyId;
        this.refTier = refTier;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.subLevel = subLevel;
        this.status = status;
        this.displayName = displayName;
    }

}
