package com.chon.api.repository;


import com.chon.api.entity.MailLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MailLogsRepository extends JpaRepository<MailLogsEntity, Long> {
}
