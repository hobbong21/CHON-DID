package com.chon.api.model.clan;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClanCreateReqModel {


    @NotBlank(message = "clanName cannot be empty")
    private String idNumber;

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

    @NotBlank(message = "Contact phone number cannot be empty")
    @Pattern(regexp = "^\\+[0-9]{1,3}\\s[0-9]{8,12}$", message = "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789")
    @Size(min = 11, max = 17, message = "Contact phone number must be between 11 and 17 characters, including country code and space")
    private String phoneNumber;

    private String englishName;
}
