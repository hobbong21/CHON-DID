package com.chon.api.model.taekwondo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaekwondoDetailResModel {

    private Long id;

    private String name;

    private String idNumber;

    private String nationality;

    private Long level;

    private String levelNumber;

    private String issuedDate;

    private String imgPath;

    private Long pointVerify;

    private String txID;

    private String blockHeight;

    private Long status;

    private String phoneNumber;

    private String englishName;

}
