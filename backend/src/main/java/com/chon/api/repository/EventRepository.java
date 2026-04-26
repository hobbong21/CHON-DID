package com.chon.api.repository;

import com.chon.api.entity.EventEntity;
import com.chon.api.model.event.EventModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends JpaRepository<EventEntity, Long> {
    @Query("""
            SELECT new com.chon.api.model.event.EventModel(
                event.id,
                event.title,
                event.description,
                event.eventDate,
                event.timeFrom,
                event.timeTo,
                event.location,
                event.imagePath
            )
            FROM EventEntity event
            ORDER BY event.createDate DESC
            """)
    Page<EventModel> getListEvent(Pageable pageable);
}
