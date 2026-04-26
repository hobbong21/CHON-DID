package com.chon.api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginModel implements Serializable {
    private static final long serialVersionUID = -573423535521716727L;

    private String username;
    private String password;
}
