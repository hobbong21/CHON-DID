package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CardInfoDTO {
    private Long id;
    private Long pointVerify;
    private String imgPath;
    private Long status;
    private String idNumber;
    private String name;
    private String address;
    private String issuingAuthority;
    private String gender;
    private String nationality;
    private String refVisaType;
    private String issuedDate;
    private String digitalSignature;
    private String txId;
    private String blockHeight;
    private String phoneNumber;
    private String englishName;
    private String shareLink;
    private String qrCode;

    public CardInfoDTO(Long id, Long pointVerify, String imgPath, Long status, String digitalSignature) {
        this.id = id;
        this.pointVerify = pointVerify;
        this.imgPath = imgPath;
        this.status = status;
        this.digitalSignature = digitalSignature;
    }

    public CardInfoDTO(Long id, Long pointVerify, String imgPath, Long status, String idNumber, String name,String address,String issuingAuthority, String gender, String nationality, String refVisaType, String issuedDate, String txId, String blockHeight, String englishName, String phoneNumber) {
        this.id = id;
        this.pointVerify = pointVerify;
        this.imgPath = imgPath;
        this.status = status;
        this.idNumber = idNumber;
        this.name = name;
        this.address = address;
        this.issuingAuthority = issuingAuthority;
        this.gender = gender;
        this.nationality = nationality;
        this.refVisaType = refVisaType;
        this.issuedDate = issuedDate;
        this.txId = txId;
        this.blockHeight = blockHeight;
        this.englishName = englishName;
        this.phoneNumber = phoneNumber;
    }

    public CardInfoDTO(Long id, Long userId, String idNumber, String name, String address, String issuingAuthority, String gender, String nationality, String refVisaType, String issuedDate, String phoneNumber, Long pointVerify, String imgPath) {
        this.id = id;
        this.idNumber = idNumber;
        this.name = name;
        this.address = address;
        this.issuingAuthority = issuingAuthority;
        this.gender = gender;
        this.nationality = nationality;
        this.refVisaType = refVisaType;
        this.issuedDate = issuedDate;
        this.phoneNumber = phoneNumber;
        this.pointVerify = pointVerify;
        this.imgPath = imgPath;
    }

}
