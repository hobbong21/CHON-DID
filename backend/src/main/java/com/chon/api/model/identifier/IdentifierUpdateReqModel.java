package com.chon.api.model.identifier;

import com.chon.api.model.identifier.impl.ValidatableCardRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IdentifierUpdateReqModel implements ValidatableCardRequest, Serializable {

    private static final long serialVersionUID = -9033926397272387421L;

    private Long cardId;

    private String idNumber;

    private String name;

    private String address;

    private String issuingAuthority;

    private String gender;

    private String nationality;

    private String refVisaType;

    private String phoneNumber;

    private String issuedDate;

    private String imgBase64;
}
