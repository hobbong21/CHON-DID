package com.chon.api.repository;


import com.chon.api.entity.MailReqEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MailReqRepository extends JpaRepository<MailReqEntity, Long> {
    List<MailReqEntity> findByStatus(Long status);
}
