package com.chon.api.repository;

import com.chon.api.entity.BankAccountEntity;
import com.chon.api.model.bank.BankAccountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankAccountRepository extends JpaRepository<BankAccountEntity, Long> {

    @Query("SELECT new com.chon.api.model.bank.BankAccountDTO(" +
            " ba.id," +
            " ba.userId," +
            " ba.refBank," +
            " ba.account," +
            " ba.status" +
            ")" +
            "FROM BankAccountEntity ba WHERE ba.userId = :userId")
    List<BankAccountDTO> getBankAccountList(Long userId);
}
