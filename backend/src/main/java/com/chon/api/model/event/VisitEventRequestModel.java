package com.chon.api.model.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitEventRequestModel {
    private Long eventId;
    private Long actionType;
    private Long certificateType;
    private Long cardId;

}
