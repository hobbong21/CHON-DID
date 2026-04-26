package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HomeInfoDTO {
    private Long id;
    private Long pointVerify;
    private String imgPath;
    private Long status;
    private String idNumber;
    private String digitalSignature;
    private Long verifyType;
    private String shareLink;
    private String qrCode;
    private String blockHeight;
    private String txId;

}
