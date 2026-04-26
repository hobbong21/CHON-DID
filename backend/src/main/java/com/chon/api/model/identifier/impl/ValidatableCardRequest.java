package com.chon.api.model.identifier.impl;

public interface ValidatableCardRequest {
    String getIdNumber();
    String getGender();
    String getNationality();
    String getRefVisaType();
    String getIssuedDate();
    String getImgBase64();
    String getAddress();
    String getIssuingAuthority();
}