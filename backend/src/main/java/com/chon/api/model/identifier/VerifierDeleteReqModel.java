package com.chon.api.model.identifier;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifierDeleteReqModel {
    @NotNull(message = "Card ID cannot be null")
    @Min(value = 1, message = "Card ID must be a positive number")
    private Long id;
}
