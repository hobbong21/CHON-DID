package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.entity.RelationUsersEntity;
import com.chon.api.model.clan.CertificateCreateResModel;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.identifier.*;
import com.chon.api.model.mess.MessModel;
import com.chon.api.service.CardInfoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/identifier")
public class CardInfoController {

    @Autowired
    private CardInfoService cardInfoService;

    /**
     * API create card
     * @param request
     * @return
     * @throws IOException
     */
    @PostMapping("/create/card")
    public ResponseData<CertificateCreateResModel> identifierCreate(@Valid @RequestBody IdentifierCreateReqModel request) throws IOException {
        return new ResponseData<CertificateCreateResModel>().success(cardInfoService.identifierCreate(request));
    }
    /**
     * API create verifier
     * @param request
     * @return
     * @throws IOException
     */
    @PostMapping("/create/verifier")
    public ResponseData<MessModel> verifierCreate(@RequestBody VerifierCreateReqModel request) throws IOException {
        return new ResponseData<MessModel>().success(cardInfoService.verifierCreate(request));
    }

    /**
     * API update card
     *
     * @param request
     * @return
     * @throws IOException
     */
    @PostMapping("/update/card")
    public ResponseData<MessModel> identifierUpdate(@RequestBody IdentifierUpdateReqModel request) throws IOException {
        return new ResponseData<MessModel>().success(cardInfoService.identifierUpdate(request));
    }
    /**
     * API update verifier
     *
     * @param request
     * @return
     * @throws IOException
     */
    @PostMapping("/update/verifier")
    public ResponseData<MessModel> verifierUpdate(@RequestBody VerifierUpdateReqModel request) {
        return new ResponseData<MessModel>().success(cardInfoService.verifierUpdate(request));
    }

    /**
     * API home
     * @return
     */
    @GetMapping("/get-home-info")
    public ResponseData<List<HomeInfoDTO>> getListHomeInfo() {
        return new ResponseData<List<HomeInfoDTO>>().success(cardInfoService.getListHomeInfo());
    }

    /**
     * API card info detail
     * @param id
     * @return
     */
    @GetMapping("/card-info/{id}")
    public ResponseData<CardInfoDTO> getDetailCardInfo(@PathVariable Long id) {
        return new ResponseData<CardInfoDTO>().success(cardInfoService.getDetailCardInfo(id));
    }

    /**
     * API list verification
     * @param cardId
     * @param verifyType
     * @return
     */
    @GetMapping("/list-verification")
    public ResponseData<List<VerifyContactDTO>> getListVerification(@RequestParam Long cardId, @RequestParam Long verifyType) {
        return new ResponseData<List<VerifyContactDTO>>().success(cardInfoService.getListVerification(cardId, verifyType));
    }
    /**
     * API delete verifier
     *
     * @param id
     * @return
     * @throws IOException
     */
    @PostMapping("/delete/{id}/verifier")
    public ResponseData<MessModel> verifierDelete(@PathVariable Long id) {
        return new ResponseData<MessModel>().success(cardInfoService.verifierDelete(id));
    }

    /**
     * API list card-info
     *
     * @param
     * @return
     * @throws
     */
    @GetMapping(value = "/list-card-info")
    public ResponseData<ListJson<CardInfoDTO>> getListCardInfoByUserIdAndStatus(@RequestParam(defaultValue = "1") Integer pageIndex,
                                                               @RequestParam Integer pageSize,
                                                               @RequestParam(required = false) Boolean isVerified){
        return new ResponseData<ListJson<CardInfoDTO>>().success(cardInfoService.getListCardInfoByUserIdAndStatus(pageIndex,pageSize, isVerified));
    }

    /**
     * API init tree family
     *
     */
    @PostMapping(value = "/init-family-tree/{certOwnerId}")
    public ResponseData<List<RelationUsersEntity>> initFamilyTree(@PathVariable Long certOwnerId){
        return new ResponseData<List<RelationUsersEntity>>().success(cardInfoService.initFamilyTree(certOwnerId));
    }

    /**
     * API delete card info
     *
     */
    @PostMapping("/delete")
    public ResponseData<MessModel> deleteCardInfos(@RequestBody List<Long> ids) {
        return new ResponseData<MessModel>().success(cardInfoService.deleteCardInfos(ids));
    }
}
