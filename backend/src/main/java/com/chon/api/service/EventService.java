package com.chon.api.service;

import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.model.event.CertificateResModel;
import com.chon.api.model.event.CreateEventRequestModel;
import com.chon.api.model.event.EventModel;
import com.chon.api.model.event.VisitEventRequestModel;
import com.chon.api.model.event.VisitEventResponsetModel;
import com.google.zxing.WriterException;

import java.io.IOException;
import java.util.List;

public interface EventService {
    Long createNewEvent(CreateEventRequestModel request) throws IOException;

    ListJson<EventModel> getListEvent(Integer pageIndex, Integer pageSize);

    EventModel getDetail(Long id) throws IOException, WriterException;

    String redirectToAppOrStoreEvent(String token) throws IOException;

    VisitEventResponsetModel visitEvent(VisitEventRequestModel request);

    List<CertificateResModel> certificates();
}
