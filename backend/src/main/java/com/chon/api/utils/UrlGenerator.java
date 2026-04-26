package com.chon.api.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

public class UrlGenerator {
    public static String encodeUrlSafe(String baseUrl, Map<String, String> params) throws UnsupportedEncodingException {
        StringBuilder encodedUrl = new StringBuilder(baseUrl);

        // Nếu URL không có dấu '?' thì thêm vào, nếu có rồi thì bỏ qua
        if (!baseUrl.contains("?")) {
            encodedUrl.append("?");
        } else {
            encodedUrl.append("&");
        }

        // Mã hóa từng tham số và nối lại
        for (Map.Entry<String, String> entry : params.entrySet()) {
            String encodedKey = URLEncoder.encode(entry.getKey(), "UTF-8");
            String encodedValue = URLEncoder.encode(entry.getValue(), "UTF-8");
            encodedUrl.append(encodedKey).append("=").append(encodedValue).append("&");
        }

        // Xóa dấu '&' thừa cuối cùng
        if (encodedUrl.charAt(encodedUrl.length() - 1) == '&') {
            encodedUrl.deleteCharAt(encodedUrl.length() - 1);
        }

        return encodedUrl.toString();
    }
}
