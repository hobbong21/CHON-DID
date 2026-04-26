package com.chon.api.service;


import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoCreateReqModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.taekwondo.TaekwondoUpdateReqModel;

import java.io.IOException;

public interface TaeKwondoService {
    CertificateCreateResModel taekwondoCreate(TaekwondoCreateReqModel request) throws IOException;

    MessModel taekwondoUpdate(TaekwondoUpdateReqModel request) throws IOException;

    TaekwondoDetailResModel taekwondoDetail(Long id);
}
