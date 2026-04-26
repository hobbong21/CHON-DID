package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.entity.ReportEntity;
import com.chon.api.model.report.ReportCreateReqDTO;
import com.chon.api.service.ReportService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @PostMapping( value = "/create")
    public ResponseData<Object> reportCreate(@RequestBody ReportCreateReqDTO request) throws IOException {
        return new ResponseData<>().success(reportService.reportCreate(request));
    };

    @GetMapping("/list")
    public ResponseData<List<ReportEntity>> getListReport(){
        return new ResponseData<List<ReportEntity>>().success(reportService.getListReport());
    }

}
