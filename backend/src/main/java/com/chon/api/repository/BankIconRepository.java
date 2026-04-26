package com.chon.api.repository;

import com.chon.api.entity.BankIconEntity;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankIconRepository extends JpaRepository<BankIconEntity, Long> {

    @Modifying
    @Transactional
    @Query("DELETE FROM BankIconEntity b WHERE b.bankName IN :bankNames")
    void deleteByBankNames(@Param("bankNames") List<String> bankNames);

    @Query("SELECT b.iconPath FROM BankIconEntity b WHERE b.bankName IN :bankNames")
    List<String> findIconPathsByBankNames(@Param("bankNames") List<String> bankNames);
}
