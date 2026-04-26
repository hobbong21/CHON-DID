package com.chon.api.service;

import java.io.IOException;

public interface RedirectService {
    String generateRedirectHtml(String token) throws IOException;

    String genLink(String type, Long verifyType, Long cardId);
}
