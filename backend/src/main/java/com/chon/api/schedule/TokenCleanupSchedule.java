package com.chon.api.schedule;

import com.chon.api.repository.OtpCodeRepository;
import com.chon.api.repository.RefreshTokenRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Slf4j
@Component
@RequiredArgsConstructor
public class TokenCleanupSchedule {

    private final RefreshTokenRepository refreshTokenRepository;
    private final OtpCodeRepository otpCodeRepository;

    @Scheduled(fixedRate = 3600000) // Every hour
    @Transactional
    public void cleanup() {
        Date now = new Date();
        Date cutoff = new Date(now.getTime() - 24 * 3600 * 1000L); // Keep revoked for 24h
        refreshTokenRepository.cleanupExpired(now, cutoff);
        otpCodeRepository.cleanupExpired(now);
        log.debug("Token cleanup completed");
    }
}
