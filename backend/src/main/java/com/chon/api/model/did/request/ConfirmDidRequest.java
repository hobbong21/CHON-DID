package com.chon.api.model.did.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmDidRequest {

    private String txHash;
    private String signature;
}
