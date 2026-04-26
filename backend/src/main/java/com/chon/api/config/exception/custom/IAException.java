package com.chon.api.config.exception.custom;


import com.chon.api.common.constans.ErrConstans;

public class IAException extends RuntimeException {

    protected int status;
    protected String errorCode;
    protected String errorDesc;

    public IAException() {
    }


    public IAException(ErrConstans errConstans) {
        this.errorCode = errConstans.getErrorCode();
        this.errorDesc = errConstans.getErrorDesc();
    }

    public IAException(String errorCode, String errorDesc) {
        this.errorCode = errorCode;
        this.errorDesc = errorDesc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorDesc() {
        return errorDesc;
    }

    public void setErrorDesc(String errorDesc) {
        this.errorDesc = errorDesc;
    }
}
