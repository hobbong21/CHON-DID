package com.chon.api.model.did.response;

import lombok.Data;

import java.util.List;

@Data
public class DidDocumentResponse {

    private String id;
    private Boolean deactivated;

    private List<Object> verificationMethod;
}
