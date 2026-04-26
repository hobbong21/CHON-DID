package com.chon.api.model.did.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class SubmitDidResponse<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    private int result;
    private String msg;

    @JsonProperty("tx_id")
    private String txId;

    private T data;
}
