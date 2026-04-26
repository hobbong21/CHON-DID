package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.service.ImageService;
import com.chon.api.service.PublicService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;

@Log4j2
@Service
public class PublicServiceImpl implements PublicService {

    @Autowired
    ImageService imageService;

    @Autowired
    private AppProperties appProperties;

    @Override
    public ResponseEntity<InputStreamResource>  getPublicFile(String imagePath) {
        try {
            if (imagePath.startsWith("/")) {
                imagePath = imagePath.substring(1);
            }
            imagePath = appProperties.rootFolderImg + File.separator + imagePath;
            InputStream inputStream = imageService.getImage(imagePath);
            File file = new File(imagePath);
            String contentType = Files.probeContentType(file.toPath());

            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType != null ? contentType : "application/octet-stream"))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + file.getName() + "\"")
                    .contentLength(file.length())
                    .body(new InputStreamResource(inputStream));

        } catch (Exception e) {
            log.error("Error loading image file: {}", imagePath, e);
            return ResponseEntity.notFound().build();
        }
    }
}