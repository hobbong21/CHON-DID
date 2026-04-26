package com.chon.api.service.impl;

import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.entity.BankAccountEntity;
import com.chon.api.model.bank.BankAccountDTO;
import com.chon.api.model.identifier.BankAccountCreateReqModel;
import com.chon.api.model.identifier.BankAccountUpdateReqModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.repository.BankAccountRepository;
import com.chon.api.service.BankAccountService;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.mapper.ModelMapperUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Log4j2
@Service
@RequiredArgsConstructor
public class BankAccountServiceImpl implements BankAccountService {

    private final BankAccountRepository bankAccountRepository;
    private final UsersContext usersContext;

    @Override
    public MessModel createBankAccount(BankAccountCreateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getAccount())) {
            throw new IAException(ErrConstans.VALIDATE_BANK_ACCOUNT_NOT_NULL);
        }

        if (request.getRefBank() == null) {
            throw new IAException(ErrConstans.VALIDATE_BANK_REF_BANK_NOT_NULL);
        }

        BankAccountEntity entity = new BankAccountEntity();
        entity.setUserId(usersContext.getCurrentUserId());
        entity.setAccount(request.getAccount());
        entity.setRefBank(request.getRefBank());
        entity.setIcon(request.getIcon());
        entity.setStatus(ECommon.ACTIVE_STATUS.ACTIVE.value);
        entity.setCreateBy(usersContext.getCurrentUserName());
        entity.setCreateDate(new Date());
        bankAccountRepository.save(entity);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public MessModel updateBankAccount(BankAccountUpdateReqModel request) {
        if (StringBaseUtils.isNullOrEmpty(request.getAccount())) {
            throw new IAException(ErrConstans.VALIDATE_BANK_ID_NOT_NULL);
        }

        if (StringBaseUtils.isNullOrEmpty(request.getAccount())) {
            throw new IAException(ErrConstans.VALIDATE_BANK_ACCOUNT_NOT_NULL);
        }

        if (request.getRefBank() == null) {
            throw new IAException(ErrConstans.VALIDATE_BANK_REF_BANK_NOT_NULL);
        }
        Optional<BankAccountEntity> optional = bankAccountRepository.findById(request.getId());
        if (optional.isEmpty()) {
            throw new IAException(ErrConstans.BANK_ACCOUNT_NOT_EXIST);
        }
        BankAccountEntity entity = optional.get();
        entity.setAccount(request.getAccount());
        entity.setRefBank(request.getRefBank());
        entity.setIcon(request.getIcon());
        entity.setUpdateDate(new Date());
        entity.setUpdateBy(usersContext.getCurrentUserName());
        bankAccountRepository.save(entity);
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public BankAccountDTO detailBankAccount(Long id) {
        Optional<BankAccountEntity> optional = bankAccountRepository.findById(id);
        if (optional.isEmpty()) {
            throw new IAException(ErrConstans.BANK_ACCOUNT_NOT_EXIST);
        }
        return ModelMapperUtils.toObject(optional.get(), BankAccountDTO.class);
    }

    @Override
    public MessModel deleteBankAccount(Long id) {
        Optional<BankAccountEntity> optional = bankAccountRepository.findById(id);
        if (optional.isEmpty()) {
            throw new IAException(ErrConstans.BANK_ACCOUNT_NOT_EXIST);
        }
        bankAccountRepository.delete(optional.get());
        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public List<BankAccountDTO> getBankAccountList() {
        return bankAccountRepository.getBankAccountList(usersContext.getCurrentUserId());
    }
}