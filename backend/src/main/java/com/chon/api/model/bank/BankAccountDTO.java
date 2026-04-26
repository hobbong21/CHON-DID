package com.chon.api.model.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankAccountDTO {
    private Long id;
    private Long userId;
    private Long refBank;
    private String account;
    private Long status;
}
