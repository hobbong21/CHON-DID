package com.chon.api.model.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventModel {
    private Long id;

    private String title;

    private String description;

    private String eventDate;

    private String timeFrom;

    private String timeTo;

    private String location;

    private String imagePath;

    private String qrBase64;

    public EventModel(Long id, String title, String description, String eventDate, String timeFrom, String timeTo, String location, String imagePath) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.eventDate = eventDate;
        this.timeFrom = timeFrom;
        this.timeTo = timeTo;
        this.location = location;
        this.imagePath = imagePath;
    }
}
