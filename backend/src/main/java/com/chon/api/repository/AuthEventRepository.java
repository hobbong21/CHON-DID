package com.chon.api.repository;

import com.chon.api.entity.AuthEventEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthEventRepository extends JpaRepository<AuthEventEntity, Long> {
}
