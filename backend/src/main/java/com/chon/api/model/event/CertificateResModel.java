package com.chon.api.model.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CertificateResModel {
    String certificateName;
    Long certificateType;
    Date certificateDate;
}
