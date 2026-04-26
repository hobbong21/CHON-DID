package com.chon.api.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

public interface FileService {

    String saveFile(String base64File) throws IOException;

}
