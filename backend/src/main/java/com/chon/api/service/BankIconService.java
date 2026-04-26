package com.chon.api.service;

import com.chon.api.model.bank.icon.BankIconDTO;
import com.chon.api.model.mess.MessModel;

import java.util.List;

public interface BankIconService {
    MessModel createOrUpdateBankIcon(List<BankIconDTO> request);

    List<BankIconDTO> getList();
}
