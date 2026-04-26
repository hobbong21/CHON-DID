package com.chon.api.model.identifier;

import lombok.Data;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Data
public class VerifyContactReqModel {
    @NotNull(message = "Tier cannot be empty")
    @Min(value = 1, message = "Tier must be 1, 2 or 3")
    @Max(value = 3, message = "Tier must be 1, 2 or 3")
    private Long refTier;

    @NotBlank(message = "Contact name cannot be empty")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Contact name must contain only letters and spaces")
    @Size(min = 2, max = 50, message = "Contact name must be between 2 and 50 characters")
    private String name;

    @NotBlank(message = "Contact phone number cannot be empty")
    @Pattern(regexp = "^\\+[0-9]{1,3}\\s[0-9]{8,12}$", message = "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789")
    @Size(min = 11, max = 17, message = "Contact phone number must be between 11 and 17 characters, including country code and space")
    private String phoneNumber;
}