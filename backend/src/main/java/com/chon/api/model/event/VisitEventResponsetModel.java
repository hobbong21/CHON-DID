package com.chon.api.model.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitEventResponsetModel {
    private Date checkInTime;
    private Date checkOutTime;
    private String txID;
    private String blockHeight;
}
