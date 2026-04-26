package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.service.ImageService;
import com.chon.api.utils.StringBaseUtils;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class ImageServiceImpl implements ImageService {

    private static final Logger log = LoggerFactory.getLogger(ImageServiceImpl.class);
    private final AppProperties appProperties;

    public ImageServiceImpl(@Qualifier("appProperties") AppProperties appProperties) {
        this.appProperties = appProperties;
    }

    /**
     * Lưu ảnh từ dữ liệu Base64 và trả về đường dẫn ảnh
     *
     * @param base64String Dữ liệu ảnh Base64
     * @return Đường dẫn ảnh đã lưu
     * @throws IllegalArgumentException Nếu dữ liệu không hợp lệ
     * @throws IOException              Nếu lỗi khi lưu file
     */
    public String saveImage(String base64String) {
        try {
            if (base64String == null || base64String.isEmpty()) {
                log.error("Base64 string is empty or null");
                throw new IllegalArgumentException("Base64 string cannot be empty");
            }

            if (base64String.contains(",")) {
                base64String = base64String.split(",")[1];
            }

            byte[] file;
            try {
                file = Base64.decodeBase64(base64String);
            } catch (Exception e) {
                log.error("Failed to decode Base64: {}", e.getMessage());
                throw new IllegalArgumentException("Invalid Base64 data");
            }

            String mimeType = URLConnection.guessContentTypeFromStream(new ByteArrayInputStream(file));
            if (mimeType != null) {
                String[] lst = mimeType.split("/");
                mimeType = lst[lst.length - 1];
            } else {
                mimeType = "png";
            }

            String fileName = UUID.randomUUID() + "." + mimeType;
            String imagePath = appProperties.rootFolderImg + File.separator + fileName;

            if (!StringBaseUtils.checkFileValid(imagePath, file, appProperties.maxFileSizeMb)) {
                log.info("=========imagePath======== invalid: {}", imagePath);
                throw new IllegalArgumentException("Invalid image file or size exceeds " + appProperties.maxFileSizeMb + "MB");
            }

            File directory = new File(appProperties.rootFolderImg);
            if (!directory.exists()) {
                directory.mkdirs();
                log.info("Created directory: {}", appProperties.rootFolderImg);
            }

            Files.write(Paths.get(imagePath), file);
            log.info("Image saved successfully: {}", imagePath);

            return fileName;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Xóa ảnh từ đường dẫn
     *
     * @param imagePath Đường dẫn ảnh cần xóa
     */
    public void deleteImage(String imagePath) {
        if (imagePath == null || imagePath.isEmpty()) {
            log.warn("Image path is empty, nothing to delete");
            return;
        }

        File file = new File(imagePath);
        if (file.exists()) {
            boolean deleted = file.delete();
            log.info("Image deleted: {}, Success: {}", imagePath, deleted);
        } else {
            log.warn("Image file does not exist: {}", imagePath);
        }
    }

    /**
     * Lấy ảnh từ server
     *
     * @param imagePath
     * @return
     * @throws IOException
     */
    public InputStream getImage(String imagePath) throws IOException {
        if (imagePath == null || imagePath.isEmpty()) {
            log.error("Image path is null or empty");
            throw new IllegalArgumentException("Image path cannot be null or empty");
        }

        File file = new File(imagePath);
        if (!file.exists()) {
            log.error("Image file not found: {}", imagePath);
            throw new IOException("File not found");
        }

        return new FileInputStream(file);
    }
}