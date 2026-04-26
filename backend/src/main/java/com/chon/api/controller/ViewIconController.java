package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.bank.BankAccountDTO;
import com.chon.api.model.bank.icon.BankIconDTO;
import com.chon.api.model.mess.MessModel;
import com.chon.api.service.BankIconService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/bank-type")
@RequiredArgsConstructor
public class ViewIconController {

    private final BankIconService bankIconService;

    @PostMapping("/creates")
    public ResponseData<MessModel> createBankAccount(@RequestBody List<BankIconDTO> requests) {
        return new ResponseData<MessModel>().success(bankIconService.createOrUpdateBankIcon(requests));
    }

    @GetMapping("/get-list")
    public ResponseData<List<BankIconDTO>> getBankAccountList() {
        return new ResponseData<List<BankIconDTO>>().success(bankIconService.getList());
    }

}
