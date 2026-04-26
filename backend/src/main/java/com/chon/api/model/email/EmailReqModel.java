package com.chon.api.model.email;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailReqModel implements Serializable {
    private static final long serialVersionUID = -6511370332930112343L;

    private String id;
    private String ccAddress;
    private String contentBody;
    private String mailUser;
    private String mailPass;
    private String subject;
    private String toAddress;
    private boolean isSendSynchronously;
}
