package com.chon.api.service;

import java.io.IOException;
import java.io.InputStream;

public interface ImageService {

    String saveImage(String base64String) throws IOException;

    void deleteImage(String imagePath);

    InputStream getImage(String imagePath) throws IOException;
}
