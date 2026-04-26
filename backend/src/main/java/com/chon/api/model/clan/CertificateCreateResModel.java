package com.chon.api.model.clan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CertificateCreateResModel implements Serializable {
    private static final long serialVersionUID = -1354276477243196458L;

    private Long id;
    private String accessToken;
}
