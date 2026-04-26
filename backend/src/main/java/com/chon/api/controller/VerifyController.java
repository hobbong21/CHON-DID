package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.identifier.*;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.verify.VerifyConfirmModel;
import com.chon.api.model.verify.VerifyRejectModel;
import com.chon.api.model.verify.VerifySignatureInfoReqModel;
import com.chon.api.service.VerifyService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/verify")
public class VerifyController {
    @Autowired
    private VerifyService verifyService;

    /**
     * api confirm verify
     *
     * @param request
     * @return
     */
    @PostMapping("/confirm")
    public ResponseData<MessModel> confirm(@RequestBody VerifyConfirmModel request) throws Exception {
        return new ResponseData<MessModel>().success(verifyService.confirm(request));
    }

    /**
     * api reject verify
     *
     * @param request
     * @return
     */
    @PostMapping("/reject")
    public ResponseData<MessModel> reject(@RequestBody VerifyRejectModel request) {
        return new ResponseData<MessModel>().success(verifyService.reject(request));
    }

    /**
     * Api get card info by token
     * @param token
     * @return
     */
    @GetMapping("/get-card-info")
    @Operation(summary = "Api get card info", description = "Api get card info by token")
    public ResponseData<CardInfoDTO> getCardInfo(@RequestParam String token) {
        return new ResponseData<CardInfoDTO>().success(verifyService.getCardInfo(token));
    }

    /**
     * Api get clan info by token
     * @param token
     * @return
     */
    @GetMapping("/get-clan-info")
    @Operation(summary = "Api get clan info", description = "Api get clan info by token")
    public ResponseData<DetailClanResModel> getClanInfo(@RequestParam String token) {
        return new ResponseData<DetailClanResModel>().success(verifyService.getClanInfo(token));
    }

    /**
     * Api get taekwondo info by token
     * @param token
     * @return
     */
    @GetMapping("/get-taekwondo-info")
    @Operation(summary = "Api get taekwondo info", description = "Api get taekwondo info by token")
    public ResponseData<TaekwondoDetailResModel> getTaekwondoInfo(@RequestParam String token) {
        return new ResponseData<TaekwondoDetailResModel>().success(verifyService.getTaekwondoInfo(token));
    }

    /**
     * API Verify Signature info
     * @param request
     * @return
     */
    @PostMapping("/signature-info")
    @Operation(summary = "Api verify signature info info", description = "Api check data and signature")
    public ResponseData<Boolean> verifySignatureInfo(@RequestBody VerifySignatureInfoReqModel request) throws Exception {
        return new ResponseData<Boolean>().success(verifyService.verifySignatureInfo(request));
    }

    @PostMapping("/change-phone")
    @Operation(summary = "Api change phone number", description = "Api change phone number")
    public ResponseData<Boolean> changePhoneNumber(@RequestBody ChangePhoneReqModel request) {
        return new ResponseData<Boolean>().success(verifyService.changePhoneNumber(request));
    }

    @GetMapping("/requesters")
    @Operation(summary = "Api get list requester", description = "Api get list requester")
    public ResponseData<List<RequesterDTO>> getListRequesters(@RequestParam(required = false) Long verifyType) {
        return new ResponseData<List<RequesterDTO>>().success(verifyService.getListRequesters(verifyType));
    }

    @GetMapping("/get-phone")
    @Operation(summary = "Api get phone number", description = "Api get phone number")
    public ResponseData<PhoneNumberDTO> getPhoneNumber() {
        return new ResponseData<PhoneNumberDTO>().success(verifyService.getPhoneNumber());
    }

    @GetMapping("/verify-did")
    @Operation(summary = "Api get did info by token of card", description = "Api get did info by token of card")
    public ResponseData<VerifyDIDDTO> getDidInfoByToken(@RequestParam String token) {
        return new ResponseData<VerifyDIDDTO>().success(verifyService.getDidInfoByToken(token));
    }

//    @GetMapping("/integration-did")
//    public ResponseData<MessModel>integration ()  {
//        return new ResponseData<MessModel>().success(verifyService.integration(null,null,null));
//    }

}
