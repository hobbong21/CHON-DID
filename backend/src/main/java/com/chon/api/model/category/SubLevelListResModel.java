package com.chon.api.model.category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubLevelListResModel implements Serializable {
    private static final long serialVersionUID = -5516520417939772069L;

    private String levelCode;

    private String displayName;

    private String displayValue;

    private Long displayOrder;

}
