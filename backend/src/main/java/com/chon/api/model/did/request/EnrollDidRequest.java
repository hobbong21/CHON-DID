package com.chon.api.model.did.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class EnrollDidRequest implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @JsonProperty("@context")
    private List<String> context;
    private CredentialSubject credentialSubject;
    private Proof proof;

    @Data
    public static class CredentialSubject {
        private String id;
        private String controller;
        private List<String> authentication;
        private List<String> assertionMethod;
        private List<String> keyAgreement;
        private List<VerificationMethod> verificationMethod;
    }

    @Data
    public static class VerificationMethod {
        private String id;
        private String type;
        private String controller;
        private String publicKeyBase58;
    }

    @Data
    public static class Proof {
        private String type;
        private Date created;
        private String verificationMethod;
        private String proofPurpose;
        private String proofValue;
    }

}
