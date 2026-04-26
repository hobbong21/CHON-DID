package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.bank.BankAccountDTO;
import com.chon.api.model.identifier.BankAccountCreateReqModel;
import com.chon.api.model.identifier.BankAccountUpdateReqModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.service.BankAccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/bank-account")
@RequiredArgsConstructor
public class BankController {

    private final BankAccountService bankAccountService;

    /**
     *
     * API create bank account
     * @param request
     * @return
     */
    @PostMapping("/create")
    public ResponseData<MessModel> createBankAccount(@RequestBody BankAccountCreateReqModel request) {
        return new ResponseData<MessModel>().success(bankAccountService.createBankAccount(request));
    }

    /**
     *
     * API update bank account
     * @param request
     * @return
     */
    @PostMapping("/update")
    public ResponseData<MessModel> updateBankAccount(@RequestBody BankAccountUpdateReqModel request) {
        return new ResponseData<MessModel>().success(bankAccountService.updateBankAccount(request));
    }

    /**
     *
     * API detail by id bank account
     * @param id
     * @return
     */
    @GetMapping("/detail/{id}")
    public ResponseData<BankAccountDTO> detailBankAccount(@PathVariable Long id) {
        return new ResponseData<BankAccountDTO>().success(bankAccountService.detailBankAccount(id));
    }

    /**
     *
     * API delete bank account by id
     * @param id
     * @return
     */
    @PostMapping("/delete/{id}")
    public ResponseData<MessModel> deleteBankAccount(@PathVariable Long id) {
        return new ResponseData<MessModel>().success(bankAccountService.deleteBankAccount(id));
    }

    /**
     * Api get list bank account
     * @return
     */
    @GetMapping("/get-list")
    public ResponseData<List<BankAccountDTO>> getBankAccountList() {
        return new ResponseData<List<BankAccountDTO>>().success(bankAccountService.getBankAccountList());
    }

}
