package com.chon.api.model.identifier;

import com.chon.api.model.identifier.impl.ValidatableCardRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IdentifierCreateReqModel implements ValidatableCardRequest, Serializable {

    private static final long serialVersionUID = 3350974799603250562L;

    private String idNumber;

    private String name;

    private String address;

    private String issuingAuthority;

    private String gender;

    private String nationality;

    private String refVisaType;

    private String issuedDate;

    private String phoneNumber;

    private String imgBase64;

    private String englishName;

    private String licenseNumber;

    private String licenseValidity;

    private String expirationDatePassport;

    private String dateOfBirth;
}
