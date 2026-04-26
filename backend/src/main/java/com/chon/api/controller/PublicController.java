package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.service.PublicService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/public")
@RequiredArgsConstructor
public class PublicController {

    private final PublicService publicService;

    @GetMapping("/image")
    public ResponseEntity<InputStreamResource> viewImage(@RequestParam("path") String path) {
        return publicService.getPublicFile(path);
    }
}
