package com.chon.api.model.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreateEventRequestModel {
    private String title;
    private String description;
    private String eventDate;
    private String timeFrom;
    private String timeTo;
    private String location;
    private String imageBase64;

}
