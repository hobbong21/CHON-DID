package com.chon.api.repository;

import com.chon.api.entity.EventVisitLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventVisitLogsRepository extends JpaRepository<EventVisitLogsEntity, Long> {

    @Query("SELECT evl FROM EventVisitLogsEntity evl WHERE evl.eventId=:eventId AND evl.userId = :userId AND evl.actionType = :actionType ORDER BY evl.actionTime ASC")
    List<EventVisitLogsEntity> findByEventIdAndUserIdAndActionType(Long eventId, Long userId, Long actionType);
}
