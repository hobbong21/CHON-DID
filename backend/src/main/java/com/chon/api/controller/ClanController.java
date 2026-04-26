package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.clan.ClanCreateReqModel;
import com.chon.api.model.clan.ClanUpdateReqModel;
import com.chon.api.service.ClanService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import java.io.IOException;

@RestController
@RequestMapping("/clan")
@RequiredArgsConstructor
public class ClanController {

    private final ClanService clanService;

    @PostMapping("/create")
    public ResponseData<CertificateCreateResModel> createClanInfo(@RequestBody ClanCreateReqModel request) throws IOException {
        return new ResponseData<CertificateCreateResModel>().success(clanService.createClanInfo(request));
    }

    @PostMapping("/update")
    public ResponseData<Long> updateClanInfo(@Valid @RequestBody ClanUpdateReqModel request) throws IOException {
        return new ResponseData<Long>().success(clanService.updateClanInfo(request));
    }

    @GetMapping("/detail/{id}")
    public ResponseData<DetailClanResModel> detailClanInfo(@PathVariable long id) {
        return new ResponseData<DetailClanResModel>().success(clanService.detailClanInfo(id));
    }

}
