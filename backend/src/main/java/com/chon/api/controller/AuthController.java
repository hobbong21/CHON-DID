package com.chon.api.controller;

import com.chon.api.common.anotations.UsersContext;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.config.rest.ResponseData;
import com.chon.api.service.AuthService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;
    private final UsersContext usersContext;

    // ==================== LOGIN ====================

    @PostMapping("/login")
    public ResponseEntity<ResponseData<Map<String, Object>>> login(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        String identifier = body.get("identifier");
        String password = body.get("password");
        String deviceId = body.get("deviceId");

        Map<String, Object> result = authService.login(identifier, password, deviceId, request);
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/login/2fa")
    public ResponseEntity<ResponseData<Map<String, Object>>> login2fa(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Map<String, Object> result = authService.login2fa(
                body.get("twoFaToken"), body.get("otp"), body.get("deviceId"), request);
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    // ==================== REFRESH ====================

    @PostMapping("/refresh")
    public ResponseEntity<ResponseData<Map<String, Object>>> refresh(@RequestBody Map<String, String> body) {
        Map<String, Object> result = authService.refresh(body.get("refreshToken"), body.get("deviceId"));
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    // ==================== LOGOUT ====================

    @PostMapping("/logout")
    public ResponseEntity<Void> logout(@RequestBody(required = false) Map<String, String> body,
                                        HttpServletRequest request) {
        String refreshToken = body != null ? body.get("refreshToken") : null;
        authService.logout(refreshToken, request);
        return ResponseEntity.noContent().build();
    }

    // ==================== REGISTRATION ====================

    @PostMapping("/register/send-otp")
    public ResponseEntity<ResponseData<Map<String, Object>>> registerSendOtp(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Map<String, Object> result = authService.registerSendOtp(body.get("phoneNumber"), request);
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/register/verify-otp")
    public ResponseEntity<ResponseData<Map<String, Object>>> registerVerifyOtp(
            @RequestBody Map<String, String> body) {
        Map<String, Object> result = authService.registerVerifyOtp(body.get("otpToken"), body.get("otp"));
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/register/complete")
    public ResponseEntity<ResponseData<Map<String, Object>>> registerComplete(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Map<String, Object> result = authService.registerComplete(
                body.get("verifyToken"), body.get("password"), body.get("userName"),
                body.get("deviceId"), request);
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    // ==================== PASSWORD RESET ====================

    @PostMapping("/password/reset/send-otp")
    public ResponseEntity<ResponseData<Map<String, Object>>> passwordResetSendOtp(
            @RequestBody Map<String, String> body) {
        Map<String, Object> result = authService.passwordResetSendOtp(body.get("phoneNumber"));
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/password/reset/verify-otp")
    public ResponseEntity<ResponseData<Map<String, Object>>> passwordResetVerifyOtp(
            @RequestBody Map<String, String> body) {
        Map<String, Object> result = authService.passwordResetVerifyOtp(body.get("otpToken"), body.get("otp"));
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/password/reset/confirm")
    public ResponseEntity<Void> passwordResetConfirm(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        authService.passwordResetConfirm(body.get("resetToken"), body.get("newPassword"), request);
        return ResponseEntity.noContent().build();
    }

    // ==================== PASSWORD CHANGE (authenticated) ====================

    @PostMapping("/password/change")
    public ResponseEntity<Void> passwordChange(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Long userId = extractUserId();
        authService.passwordChange(userId, body.get("currentPassword"), body.get("newPassword"), request);
        return ResponseEntity.noContent().build();
    }

    // ==================== 2FA ====================

    @PostMapping("/2fa/enable")
    public ResponseEntity<ResponseData<Map<String, Object>>> twoFaEnable(HttpServletRequest request) {
        Long userId = extractUserId();
        Map<String, Object> result = authService.twoFaEnable(userId);
        return ResponseEntity.ok(new ResponseData<Map<String, Object>>().success(result));
    }

    @PostMapping("/2fa/confirm")
    public ResponseEntity<Void> twoFaConfirm(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Long userId = extractUserId();
        authService.twoFaConfirm(userId, body.get("otpToken"), body.get("otp"));
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/2fa/disable")
    public ResponseEntity<Void> twoFaDisable(
            @RequestBody Map<String, String> body,
            HttpServletRequest request) {
        Long userId = extractUserId();
        authService.twoFaDisable(userId, body.get("password"));
        return ResponseEntity.noContent().build();
    }

    // ==================== UTILITY ====================

    private Long extractUserId() {
        if (!usersContext.hasAuthentication()) {
            IAException ex = new IAException("UNAUTHORIZED", "Authentication required");
            ex.setStatus(401);
            throw ex;
        }
        return usersContext.getCurrentUserId();
    }
}
