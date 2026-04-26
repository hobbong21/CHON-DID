package com.chon.api.service.impl;

import com.chon.api.common.anotations.UsersContext;
import com.chon.api.entity.ReportEntity;
import com.chon.api.model.report.ReportCreateReqDTO;
import com.chon.api.repository.ReportRepository;
import com.chon.api.service.ImageService;
import com.chon.api.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    ReportRepository reportRepository;

    @Autowired
    private ImageService imageService;

    @Autowired
    private UsersContext usersContext;

    @Override
    public ReportEntity reportCreate(ReportCreateReqDTO req) throws IOException {

        Long userIdCreate = null;
        if (usersContext.hasAuthentication()){
            userIdCreate =  usersContext.getCurrentUserId();
        }

        ReportEntity reportEntity = new ReportEntity();
        reportEntity.setUserId(userIdCreate);
        reportEntity.setFullName(req.getFullName());
        reportEntity.setEmail(req.getEmail());
        reportEntity.setTitle(req.getTitle());
        reportEntity.setContent(req.getContent());
        reportEntity.setCreateTime(new Date());

        if (req.getFile() != null) {
            String filePath = imageService.saveImage(req.getFile());
            reportEntity.setFilePath(filePath);
        }

        return reportRepository.save(reportEntity);
    }

    @Override
    public List<ReportEntity> getListReport() {
        if (!usersContext.hasAuthentication()) {
            throw new RuntimeException("User not authenticated");
        }

        Long userId = null;
        if (usersContext.hasAuthentication()){
            userId =  usersContext.getCurrentUserId();
        }

        return reportRepository.findByUserId(userId);
    }

}
