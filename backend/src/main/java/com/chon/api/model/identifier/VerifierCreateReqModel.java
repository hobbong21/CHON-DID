package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifierCreateReqModel {

    private Long cardId;

    private Long verifyType;

    private Long refTier;

    private String name;

    private String phoneNumber;

    private String subLevel;

    private String levelCode;
}
