package com.chon.api.model.did.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class SubmitDidRequest {

    @JsonProperty("@context")
    private List<String> context;

    private String id;
    private String controller;
    private List<String> authentication;
    private List<String> assertionMethod;
    private List<String> keyAgreement;
    private List<VerificationMethod> verificationMethod;

    @Data
    public static class VerificationMethod {
        private String id;
        private String type;
        private String controller;
        private String publicKeyBase58;
    }
}

