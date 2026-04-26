package com.chon.api.model.verify;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VerifySignatureInfoReqModel {
    @NotBlank(message = "signature must not be empty")
    private String signature;
    @NotBlank(message = "rawData must not be empty")
    private String rawData;
    @NotBlank(message = "publicKey must not be empty")
    private String publicKey;
}
