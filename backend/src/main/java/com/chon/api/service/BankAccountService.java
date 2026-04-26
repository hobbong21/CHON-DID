package com.chon.api.service;

import com.chon.api.model.bank.BankAccountDTO;
import com.chon.api.model.identifier.BankAccountCreateReqModel;
import com.chon.api.model.identifier.BankAccountUpdateReqModel;
import com.chon.api.model.mess.MessModel;

import java.util.List;

public interface BankAccountService {

    MessModel createBankAccount(BankAccountCreateReqModel request);

    MessModel updateBankAccount(BankAccountUpdateReqModel request);

    BankAccountDTO detailBankAccount(Long id);

    MessModel deleteBankAccount(Long id);

    List<BankAccountDTO> getBankAccountList();
}
