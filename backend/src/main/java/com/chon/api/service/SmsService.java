package com.chon.api.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.Base64;
import java.util.List;
import java.util.Map;

/**
 * Naver Cloud SENS (Simple & Easy Notification Service) SMS integration.
 * Docs: https://api.ncloud-docs.com/docs/ai-application-service-sens-smsv2
 */
@Slf4j
@Service
public class SmsService {

    @Value("${sms.naver.service-id:}")
    private String serviceId;

    @Value("${sms.naver.access-key:}")
    private String accessKey;

    @Value("${sms.naver.secret-key:}")
    private String secretKey;

    @Value("${sms.naver.sender-phone:}")
    private String senderPhone;

    @Value("${sms.enabled:false}")
    private boolean smsEnabled;

    private static final String SENS_API_URL = "https://sens.apigw.ntruss.com";
    private static final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10))
            .build();
    private static final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * Send an SMS message via Naver Cloud SENS.
     *
     * @param to      recipient phone number (Korean format: 01012345678)
     * @param content SMS message body
     * @return true if sent successfully
     */
    public boolean sendSms(String to, String content) {
        if (!smsEnabled) {
            log.info("[SMS-DISABLED] Would send to {}: {}", maskPhone(to), content);
            return true; // Return true in dev mode so OTP flow isn't blocked
        }

        if (serviceId.isEmpty() || accessKey.isEmpty() || secretKey.isEmpty()) {
            log.error("[SMS] SENS credentials not configured. Cannot send SMS.");
            return false;
        }

        try {
            String timestamp = String.valueOf(System.currentTimeMillis());
            String uri = "/sms/v2/services/" + serviceId + "/messages";
            String signature = makeSignature("POST", uri, timestamp);

            // Normalize phone number (remove dashes)
            String normalizedTo = to.replaceAll("-", "");
            String normalizedSender = senderPhone.replaceAll("-", "");

            Map<String, Object> body = Map.of(
                    "type", "SMS",
                    "from", normalizedSender,
                    "content", content,
                    "messages", List.of(Map.of("to", normalizedTo))
            );

            String jsonBody = objectMapper.writeValueAsString(body);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(SENS_API_URL + uri))
                    .header("Content-Type", "application/json; charset=utf-8")
                    .header("x-ncp-apigw-timestamp", timestamp)
                    .header("x-ncp-iam-access-key", accessKey)
                    .header("x-ncp-apigw-signature-v2", signature)
                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody, StandardCharsets.UTF_8))
                    .timeout(Duration.ofSeconds(10))
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 202) {
                log.info("[SMS] Sent successfully to {}", maskPhone(normalizedTo));
                return true;
            } else {
                log.error("[SMS] Failed to send to {}. Status: {}, Body: {}",
                        maskPhone(normalizedTo), response.statusCode(), response.body());
                return false;
            }
        } catch (Exception e) {
            log.error("[SMS] Exception sending to {}: {}", maskPhone(to), e.getMessage(), e);
            return false;
        }
    }

    /**
     * Send OTP verification code via SMS.
     */
    public boolean sendOtp(String phoneNumber, String otpCode) {
        String message = "[CHON] 인증번호: " + otpCode + "\n5분 이내에 입력해 주세요.";
        return sendSms(phoneNumber, message);
    }

    /**
     * Generate HMAC-SHA256 signature for Naver Cloud API authentication.
     * Spec: https://api.ncloud-docs.com/docs/common-ncpapi
     */
    private String makeSignature(String method, String uri, String timestamp) throws Exception {
        String message = method + " " + uri + "\n" + timestamp + "\n" + accessKey;

        SecretKeySpec signingKey = new SecretKeySpec(
                secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(message.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(rawHmac);
    }

    private String maskPhone(String phone) {
        if (phone == null || phone.length() < 7) return "***";
        return phone.substring(0, 3) + "****" + phone.substring(phone.length() - 4);
    }
}
