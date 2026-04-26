package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.service.RedirectService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping("/share")
@RequiredArgsConstructor
@Tag(name = "share link", description = "Controller about share link")
public class VerifyLinkController {

    private final RedirectService redirectService;

    @GetMapping("/get-link")
    @Operation(summary = "Api gen link",description = "Api gen link to share other - type = verify/info-verification")
    public ResponseData<String> redirectToAppOrStore(@RequestParam(value = "type") String type,
                                                    @RequestParam(value = "verifyType") Long verifyType,
                                                    @RequestParam(value = "cardId") Long cardId) {
        return new ResponseData<String>().success(redirectService.genLink(type, verifyType, cardId));

    }

    @GetMapping("/verify-link")
    public void redirectToAppOrStore(@RequestParam(value = "token") String token, HttpServletResponse response) throws IOException {

        String htmlContent = redirectService.generateRedirectHtml(token);

        response.setContentType("text/html; charset=UTF-8");
        response.getOutputStream().write(htmlContent.getBytes(StandardCharsets.UTF_8));
    }
}
