package com.chon.api.config.rest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.logging.log4j.ThreadContext;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseData<T> implements Serializable {
    private static final long serialVersionUID = -1953354741201959789L;

    private int status;
    private String errorCode;
    private String errorDesc;
    private String clientMessageId;
    private T data;

    public ResponseData<T> success(T data) {
        this.data = data;
        this.status = 200;
        this.clientMessageId = ThreadContext.get("clientMessageId");
        return this;
    }

    public ResponseData<T> error(int status, String errorCode, String errorDesc) {
        this.status = status;
        this.errorCode = errorCode;
        this.errorDesc = errorDesc;
        this.clientMessageId = ThreadContext.get("clientMessageId");
        return this;
    }

}
