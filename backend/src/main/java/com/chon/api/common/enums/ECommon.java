package com.chon.api.common.enums;

import lombok.Data;

public class ECommon {

    public enum ACTIVE_STATUS {
        ACTIVE(1L),
        IN_ACTIVE(0L);

        public final Long value;

        ACTIVE_STATUS(Long value) {
            this.value = value;
        }
    }

    public enum TYPE_DELETE {
        DELETE(1L),
        UN_DELETE(0L);

        public final Long value;

        TYPE_DELETE(Long value) {
            this.value = value;
        }
    }

    public enum VERIFY_TYPE {
        CARD(1L),
        CLAN(2L),
        TAIW(3L);

        public final Long value;

        VERIFY_TYPE(Long value) {
            this.value = value;
        }
    }

    public enum RESPONSE_STATUS {
        SUCCESS(1L, "Success"),
        FAILED(0L, "Failed");

        public final Long code;
        public final String message;

        RESPONSE_STATUS(Long code, String message) {
            this.code = code;
            this.message = message;
        }
    }

    public enum DIGITAL_SIGNATURE {
        YES(1L),
        NO(0L);

        public final Long value;

        DIGITAL_SIGNATURE(Long value) {
            this.value = value;
        }
    }

    public enum VERIFY_CONTRACT_STT {
        UN_VERIFY(0L),
        APPROVE(1L),
        REJECT(2L);

        public final Long value;

        VERIFY_CONTRACT_STT(Long value) {
            this.value = value;
        }
    }

    public enum LINK_VERIFY_TYPE {
        VERIFY("verify"),
        INFO_VERIFICATION("info-verification"),
        EVENT("event");

        public final String value;

        LINK_VERIFY_TYPE(String value) {
            this.value = value;
        }
    }

    public enum QR_PREFIX {
        CARD("CHONCARD"),
        CLAN("CHONCLAN"),
        TEAK("CHONTEAK"),
        EVENT("CHONEVENT");

        public final String value;

        QR_PREFIX(String value) {
            this.value = value;
        }
    }

    public enum EVENT_ACTION {
        CHECK_IN(1L),
        CHECK_OUT(2L);

        public final Long value;

        EVENT_ACTION(Long value) {
            this.value = value;
        }
    }

}
