package com.chon.api.model;

import com.chon.api.common.enums.ETokenType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class UserInfoModel implements Serializable {

    private static final long serialVersionUID = -9018917748327233539L;
    private Long id;
    private Long type;
    private String userName;
    private Date expireAt;
    private List<String> scopes;
    private List<String> authorities;
    private ETokenType eTokenType;
}
