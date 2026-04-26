package com.chon.api.model.clan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClanUpdateReqModel {

    private Long id;

    @NotBlank(message = "clanName cannot be empty")
    private String clanName;

    private String origin;

    private String pa;

    private String se;

    private String birth;

    private Long relationship;

    private String personalName;

    private String personalGivenName;

    private String personalNickname;

    private String address;

    private String gps;

    private String otherInfo;

    private String familyOccupation;

    @Pattern(regexp = "^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$", message = "Image must be in a valid base64 format (data:image/<type>;base64,...) or empty")
    @Size(max = 10485760, message = "Image size must not exceed 10MB") // 10MB in characters
    private String imgBase64;
}
