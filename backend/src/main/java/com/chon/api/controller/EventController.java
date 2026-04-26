package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.model.event.CertificateResModel;
import com.chon.api.model.event.CreateEventRequestModel;
import com.chon.api.model.event.EventModel;
import com.chon.api.model.event.VisitEventRequestModel;
import com.chon.api.model.event.VisitEventResponsetModel;
import com.chon.api.service.EventService;
import com.google.zxing.WriterException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.cert.Certificate;
import java.util.List;

@RestController
@RequestMapping("/event")
@RequiredArgsConstructor
@Tag(name = "Events", description = "Controller about api for event")
public class EventController {

    private final EventService eventService;

    @PostMapping("/web/create")
    @Operation(summary = "Api create event", description = "Api generate new event")
    public ResponseData<Long> createNewEvent(@RequestBody CreateEventRequestModel request) throws IOException {
        return new ResponseData<Long>().success(eventService.createNewEvent(request));
    }

    @GetMapping("/web/list")
    @Operation(summary = "Api get list event", description = "Api get list event")
    public ResponseData<ListJson<EventModel>> getListEvent(@RequestParam(defaultValue = "1") Integer pageIndex,
                                                           @RequestParam Integer pageSize) {
        return new ResponseData<ListJson<EventModel>>().success(eventService.getListEvent(pageIndex, pageSize));
    }

    @GetMapping("/web/detail/{id}")
    public ResponseData<EventModel> getDetailEvent(@PathVariable Long id) throws IOException, WriterException {
        return new ResponseData<EventModel>().success(eventService.getDetail(id));
    }

    @GetMapping("/event-link")
    public void redirectToAppOrStoreEvent(@RequestParam(value = "token") String token, HttpServletResponse response) throws IOException {

        String htmlContent = eventService.redirectToAppOrStoreEvent(token);

        response.setContentType("text/html; charset=UTF-8");
        response.getOutputStream().write(htmlContent.getBytes(StandardCharsets.UTF_8));
    }

    @PostMapping("/app/visit")
    @Operation(summary = "Api check in/check out/pass through event", description = "Api check in/check out/pass through event")
    public ResponseData<VisitEventResponsetModel> visitEvent(@RequestBody VisitEventRequestModel request) {
        return new ResponseData<VisitEventResponsetModel>().success(eventService.visitEvent(request));
    }

    @GetMapping("/list-verified")
    @Operation(summary = "Api get list verified", description = "Api get list certificate after verified")
    public ResponseData<List<CertificateResModel>> certificates() {
        return new ResponseData<List<CertificateResModel>>().success(eventService.certificates());
    }
}
