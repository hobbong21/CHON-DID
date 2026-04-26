package com.chon.api.service;

import com.chon.api.entity.ReportEntity;
import com.chon.api.model.report.ReportCreateReqDTO;

import java.io.IOException;
import java.util.List;

public interface ReportService {

    ReportEntity reportCreate(ReportCreateReqDTO req) throws IOException;

    List<ReportEntity> getListReport();

}
