package com.chon.api.model.did.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueryDidRequest {

    @JsonProperty("@context")
    private List<String> context;

    private String id;
}

