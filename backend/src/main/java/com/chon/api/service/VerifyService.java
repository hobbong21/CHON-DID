package com.chon.api.service;

import com.chon.api.model.clan.DetailClanResModel;
import com.chon.api.model.identifier.*;
import com.chon.api.model.mess.MessModel;
import com.chon.api.model.taekwondo.TaekwondoDetailResModel;
import com.chon.api.model.verify.VerifyConfirmModel;
import com.chon.api.model.verify.VerifyRejectModel;
import com.chon.api.model.verify.VerifySignatureInfoReqModel;

import java.util.List;

public interface VerifyService {
    MessModel confirm(VerifyConfirmModel request) throws Exception;

    MessModel reject(VerifyRejectModel request);

    CardInfoDTO getCardInfo(String token);

    DetailClanResModel getClanInfo(String token);

    TaekwondoDetailResModel getTaekwondoInfo(String token);

    Boolean verifySignatureInfo(VerifySignatureInfoReqModel request) throws Exception;

    Boolean changePhoneNumber(ChangePhoneReqModel request);

    List<RequesterDTO> getListRequesters(Long verifyType);

    PhoneNumberDTO getPhoneNumber();

    VerifyDIDDTO getDidInfoByToken(String token);

//    MessModel integration(String privateKey,String publicKey,String signature,String did) ;
}
