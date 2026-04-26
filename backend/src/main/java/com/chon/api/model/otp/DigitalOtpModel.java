package com.chon.api.model.otp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DigitalOtpModel implements Serializable {
    private static final long serialVersionUID = 3343555677276293527L;

    private String email;
    private String digitalOtp;
    private Date expiryDate;
}
