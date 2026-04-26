package com.chon.api.model.clan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailClanResModel implements Serializable {

    private static final long serialVersionUID = -2887362726313932232L;

    private Long id;
    private String clanName;
    private String origin;
    private String pa;
    private String se;
    private String birth;
    private Long relationship;
    private String address;
    private String gps;
    private String otherInfo;
    private String imgPath;
    private String personalName;
    private String personalGivenName;
    private String personalNickname;
    private String familyOccupation;
    private Long pointVerify;
    private String txID;
    private String blockHeight;
    private Long status;
    private String phoneNumber;
    private String englishName;
    private String idNumber;

}
