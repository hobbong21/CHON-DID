package com.chon.api.model.identifier;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankAccountUpdateReqModel {

    @NotNull(message = "id must not null")
    private Long id;

    @NotBlank(message = "account cannot be empty")
    private String account;

    @NotNull(message = "refBank must not null")
    private Long refBank;

    @NotNull(message = "icon must not null")
    private String icon;
}
