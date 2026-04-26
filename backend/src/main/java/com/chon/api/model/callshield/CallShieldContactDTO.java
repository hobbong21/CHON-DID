package com.chon.api.model.callshield;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CallShieldContactDTO {
    private String phoneNumber;
    private String name;
    private String relationType;
}
