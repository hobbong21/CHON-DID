package com.chon.api.repository;


import com.chon.api.entity.MailTempEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MailTempRepository extends JpaRepository<MailTempEntity, Long> {
    MailTempEntity findByMailCode(String mailCode);
}
