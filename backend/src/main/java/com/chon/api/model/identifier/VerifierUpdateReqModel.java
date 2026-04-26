package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifierUpdateReqModel {

    private Long cardId;

    private List<VerifyContactReqModel> verifyContacts;
}
