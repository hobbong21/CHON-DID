package com.chon.api.service;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;

public interface PublicService {

    ResponseEntity<InputStreamResource> getPublicFile(String path);
}
