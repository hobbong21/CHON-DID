package com.chon.api.utils;

import okhttp3.*;

import java.util.concurrent.TimeUnit;

public final class HttpCommonUtil {
    private static final OkHttpClient CLIENT = buildClient();

    private HttpCommonUtil() {
        // util class
    }

    private static OkHttpClient buildClient() {
        return new OkHttpClient.Builder()
                .connectTimeout(30, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .writeTimeout(30, TimeUnit.SECONDS)
                .build();
    }

    /**
     * POST JSON (Bearer token optional)
     */
    public static String post(
            String url,
            String token,
            Object body
    ) {

        try {
            RequestBody requestBody = RequestBody.create(
                    MediaType.parse("application/json"),
                    JsonUtil.toJson(body)
            );

            Request.Builder requestBuilder = new Request.Builder()
                    .url(url)
                    .post(requestBody)
                    .addHeader("Accept", "application/json")
                    .addHeader("Content-Type", "application/json");

            if (token != null && !token.isBlank()) {
                requestBuilder.addHeader("Authorization", "Bearer " + token);
            }

            Request request = requestBuilder.build();

            try (Response response = CLIENT.newCall(request).execute()) {

                if (!response.isSuccessful()) {
                    throw new RuntimeException(
                            "HTTP " + response.code() + " - " +
                                    (response.body() != null ? response.body().string() : "")
                    );
                }

                return response.body() != null
                        ? response.body().string()
                        : null;
            }

        } catch (Exception e) {
            throw new RuntimeException("Call API failed: " + url, e);
        }
    }
}
