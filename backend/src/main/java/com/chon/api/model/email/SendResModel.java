package com.chon.api.model.email;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class SendResModel implements Serializable {
    private static final long serialVersionUID = -6347917478578521482L;

    private boolean flag;
    private String msgContent;
}
