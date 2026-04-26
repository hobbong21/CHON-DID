package com.chon.api.model.email;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailResModel implements Serializable {
    private static final long serialVersionUID = 4335336208281170201L;

    private String id;
}
