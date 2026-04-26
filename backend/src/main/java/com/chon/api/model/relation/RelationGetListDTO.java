package com.chon.api.model.relation;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class RelationGetListDTO {
    private Long id;
    private String type;
}
