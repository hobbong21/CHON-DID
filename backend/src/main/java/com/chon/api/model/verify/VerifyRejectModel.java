package com.chon.api.model.verify;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifyRejectModel {
    @NotNull(message = "Verify type cannot be empty")
    @Min(value = 1, message = "Verify type must be 1, 2 or 3")
    @Max(value = 3, message = "Verify type must be 1, 2 or 3")
    @Schema(description = "1 - card, 2 - clan, 3 - taekwondo")
    private Long verifyType;
    @NotNull(message = "Ref verify id cannot be null")
    @Min(value = 1, message = "Ref verify id must be a positive number")
    @Schema(description = "Card ID")
    private Long refVerifyId;
}
