package com.chon.api.utils;

import com.chon.api.entity.CardInfoEntity;
import com.chon.api.entity.ClanInfoEntity;
import com.chon.api.entity.TaekwondoInfoEntity;

public class GenRawDataUtils {
    public static String genCardRawData(CardInfoEntity cardInfoEntity) {
        return cardInfoEntity.getIdNumber() + "|"
                + cardInfoEntity.getName() + "|"
                + cardInfoEntity.getAddress() + "|"
                + cardInfoEntity.getIssuingAuthority() + "|"
                + cardInfoEntity.getPhoneNumber() + "|"
                + cardInfoEntity.getIssuedDate() + "|"
                + cardInfoEntity.getImgPath();
    }

    public static String genClanRawData(ClanInfoEntity clanInfoEntity) {
        return clanInfoEntity.getClanName() + "|"
                + clanInfoEntity.getOrigin() + "|"
                + clanInfoEntity.getPa() + "|"
                + clanInfoEntity.getSe() + "|"
                + clanInfoEntity.getPersonalName() + "|"
                + clanInfoEntity.getPersonalGivenName() + "|"
                + clanInfoEntity.getPersonalNickname() + "|"
                + clanInfoEntity.getBirth() + "|"
                + clanInfoEntity.getRelationship() + "|" //xac nhan cho bo
                + clanInfoEntity.getFamilyOccupation() + "|"
                + clanInfoEntity.getAddress() + "|"
                + clanInfoEntity.getGps() + "|"
                + clanInfoEntity.getOtherInfo() + "|"
                + clanInfoEntity.getEnglishName();
    }

    public static String genTeakwondoRawData(TaekwondoInfoEntity taekwondoInfoEntity) {
        return taekwondoInfoEntity.getIdNumber() + "|"
                + taekwondoInfoEntity.getName() + "|"
                + taekwondoInfoEntity.getNationality() + "|"
                + taekwondoInfoEntity.getLevel() + "|"
                + taekwondoInfoEntity.getLevelNumber() + "|"
                + taekwondoInfoEntity.getIssuedDate() + "|"
                + taekwondoInfoEntity.getEnglishName();
    }
}
