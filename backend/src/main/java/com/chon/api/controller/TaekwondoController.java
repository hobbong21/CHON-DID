package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoCreateReqModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.taekwondo.TaekwondoUpdateReqModel;
import com.chon.api.service.TaeKwondoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/taekwondo")
public class TaekwondoController {

    @Autowired
    private TaeKwondoService taeKwondoService;

    /**
     * API create taekwondo
     *
     * @param request
     * @return
     * @
     */
    @PostMapping("/create/taekwondo")
    public ResponseData<CertificateCreateResModel> taekwondoCreate(@RequestBody TaekwondoCreateReqModel request) throws IOException {
        return new ResponseData<CertificateCreateResModel>().success(taeKwondoService.taekwondoCreate(request));
    }

    /**
     * API update taekwondo
     *
     * @param request
     * @return
     * @
     */
    @PostMapping("/update/taekwondo")
    public ResponseData<MessModel> taekwondoUpdate(@RequestBody TaekwondoUpdateReqModel request) throws IOException {
        return new ResponseData<MessModel>().success(taeKwondoService.taekwondoUpdate(request));
    }

    /**
     * API detail taekwondo
     *
     * @param id
     * @return
     * @
     */
    @GetMapping("/detail/taekwondo/{id}")
    public ResponseData<TaekwondoDetailResModel> taekwondoDetail(@PathVariable Long id) {
        return new ResponseData<TaekwondoDetailResModel>().success(taeKwondoService.taekwondoDetail(id));
    }
}
