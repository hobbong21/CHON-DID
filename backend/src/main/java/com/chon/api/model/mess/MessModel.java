package com.chon.api.model.mess;

import com.chon.api.common.enums.ECommon;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessModel implements Serializable {
    private static final long serialVersionUID = 5396210744021466961L;

    private Long code;
    private String message;

    public MessModel(ECommon.RESPONSE_STATUS responseStatus) {
        this.code = responseStatus.code;
        this.message = responseStatus.message;
    }
}
