package com.chon.api.repository.custom.impl;

import com.chon.api.repository.custom.CardInfoRepositoryCustom;
import com.chon.api.repository.custom.query.CardInfoRepositoryQuery;
import com.chon.api.utils.sql.SqlQueryUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.EntityManager;

@Slf4j
@RequiredArgsConstructor
public class CardInfoRepositoryImpl extends CardInfoRepositoryQuery implements CardInfoRepositoryCustom {
    @Autowired
    private SqlQueryUtil sqlUtil;

    @Autowired
    private EntityManager entityManager;


}
