package com.chon.api.common.enums;

public enum EMailStatus {
    NEW(0L),
    SUCCESS(1L),
    FAILED(2L);

    public final Long value;

    EMailStatus(Long value) {
        this.value = value;
    }
}
