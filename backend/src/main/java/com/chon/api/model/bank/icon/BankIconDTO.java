package com.chon.api.model.bank.icon;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankIconDTO {
    private Long id;

    private String bankName;

    private String iconPath;

}
