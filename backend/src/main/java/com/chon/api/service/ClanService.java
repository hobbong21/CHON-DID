package com.chon.api.service;


import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.clan.ClanCreateReqModel;
import com.chon.api.model.clan.ClanUpdateReqModel;

import jakarta.validation.Valid;
import java.io.IOException;

public interface ClanService {

    CertificateCreateResModel createClanInfo(ClanCreateReqModel request) throws IOException;

    DetailClanResModel detailClanInfo(Long id);

    Long updateClanInfo(@Valid ClanUpdateReqModel request) throws IOException;
}
