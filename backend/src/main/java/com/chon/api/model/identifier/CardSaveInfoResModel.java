package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CardSaveInfoResModel implements Serializable {
    private static final long serialVersionUID = -2047721350625496088L;

    private Long cardId;
    private String accessToken;
}
