package com.chon.api.service.impl;

import com.chon.api.common.anotations.UsersContext;
import com.chon.api.entity.UsersEntity;
import com.chon.api.model.callshield.CallShieldContactDTO;
import com.chon.api.repository.RelationUsersRepository;
import com.chon.api.repository.UsersRepository;
import com.chon.api.service.CallShieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class CallShieldServiceImpl implements CallShieldService {

    @Autowired
    private UsersContext usersContext;

    @Autowired
    private RelationUsersRepository relationUsersRepository;

    @Autowired
    private UsersRepository usersRepository;

    private final ConcurrentHashMap<Long, CachedContacts> cache = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Long, Long> rateLimitMap = new ConcurrentHashMap<>();

    private static final long CACHE_TTL_MS = 5 * 60 * 1000L;
    private static final long RATE_LIMIT_MS = 10_000L;
    private static final int MAX_CACHE_SIZE = 500;
    private static final int MAX_CONTACTS = 200;

    @Override
    public List<CallShieldContactDTO> getContacts() {
        Long currentUserId = usersContext.getCurrentUserId();
        long now = System.currentTimeMillis();

        // Check cache first (serves both rate-limited and normal requests)
        CachedContacts cached = cache.get(currentUserId);
        if (cached != null && (now - cached.timestamp) < CACHE_TTL_MS) {
            return cached.contacts;
        }

        // Rate limiting — only applies when cache is stale/missing (i.e., a DB hit is needed)
        Long lastDbHit = rateLimitMap.get(currentUserId);
        if (lastDbHit != null && (now - lastDbHit) < RATE_LIMIT_MS) {
            return cached != null ? cached.contacts : Collections.emptyList();
        }
        rateLimitMap.put(currentUserId, now);

        // Fetch from DB
        UsersEntity currentUser = usersRepository.findById(currentUserId).orElse(null);
        String myPhone = currentUser != null ? currentUser.getPhoneNumber() : "";
        String normalized = myPhone != null ? myPhone.replace("-", "") : "";

        List<Object[]> rows = relationUsersRepository.findCallShieldContactsRaw(
            currentUserId, myPhone != null ? myPhone : "", normalized);

        // Map rows to DTOs
        List<CallShieldContactDTO> contacts = new ArrayList<>(rows.size());
        for (Object[] row : rows) {
            contacts.add(new CallShieldContactDTO(
                (String) row[0],
                (String) row[1],
                (String) row[2]
            ));
        }

        // Deduplicate, preferring family relations over generic chon_user
        Map<String, CallShieldContactDTO> deduplicated = new LinkedHashMap<>();
        for (CallShieldContactDTO contact : contacts) {
            if (contact.getPhoneNumber() == null || contact.getPhoneNumber().isBlank()) continue;
            String normalizedPhone = contact.getPhoneNumber().replaceAll("[^0-9+]", "");
            contact.setPhoneNumber(normalizedPhone);

            CallShieldContactDTO existing = deduplicated.get(normalizedPhone);
            if (existing == null || "chon_user".equals(existing.getRelationType())) {
                deduplicated.put(normalizedPhone, contact);
            }
        }

        // Cap result size
        List<CallShieldContactDTO> result;
        if (deduplicated.size() > MAX_CONTACTS) {
            result = Collections.unmodifiableList(
                new ArrayList<>(deduplicated.values()).subList(0, MAX_CONTACTS)
            );
        } else {
            result = Collections.unmodifiableList(new ArrayList<>(deduplicated.values()));
        }

        // Update cache
        cache.put(currentUserId, new CachedContacts(now, result));

        // Evict stale entries atomically — only remove entries older than 2x TTL
        if (cache.size() > MAX_CACHE_SIZE) {
            long cutoff = now - CACHE_TTL_MS * 2;
            cache.entrySet().removeIf(e -> e.getValue().timestamp < cutoff);
            // If still over limit after eviction, remove oldest entries
            if (cache.size() > MAX_CACHE_SIZE) {
                cache.entrySet().stream()
                    .sorted(Comparator.comparingLong(e -> e.getValue().timestamp))
                    .limit(cache.size() - MAX_CACHE_SIZE)
                    .map(Map.Entry::getKey)
                    .toList()
                    .forEach(cache::remove);
            }
        }

        return result;
    }

    private record CachedContacts(long timestamp, List<CallShieldContactDTO> contacts) {}
}
