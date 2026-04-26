package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifyDIDDTO {
    private Long cardInfoId;
    private String txId;
    private String blockHeight;
    private String did;

}
