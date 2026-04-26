package com.chon.api.model.link;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifyLinkModel {
    String type;
    Long verifyType;
    Long cardId;
}
