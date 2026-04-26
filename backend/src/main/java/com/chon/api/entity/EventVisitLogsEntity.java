package com.chon.api.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "event_visit_logs")
@Data
public class EventVisitLogsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "user_id")
    private Long userId;

   @Column(name = "event_id")
   private Long eventId;

    @Column(name = "certificate_type")
    private Long certificateType;

    @Column(name = "action_type")
    private Long actionType;

    @Column(name = "action_time")
    private Date actionTime;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "create_by")
    private String createBy;

    @Column(name = "update_date")
    private Date updateDate;

    @Column(name = "update_by")
    private String updateBy;
}
