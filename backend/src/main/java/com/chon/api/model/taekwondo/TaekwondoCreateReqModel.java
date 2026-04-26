package com.chon.api.model.taekwondo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaekwondoCreateReqModel {

    @NotBlank(message = "Name cannot be empty")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Name must contain only letters and spaces")
    @Size(min = 2, max = 100, message = "Name must be between 2 and 100 characters")
    private String name;

    @NotBlank(message = "ID number cannot be empty")
    @Pattern(regexp = "^[0-9]+$", message = "ID number must contain only digits")
    @Size(min = 9, max = 12, message = "ID number must be between 9 and 12 characters")
    private String idNumber;

    @NotBlank(message = "Nationality cannot be empty")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Nationality must contain only letters and spaces")
    @Size(min = 2, max = 50, message = "Nationality must be between 2 and 50 characters")
    private String nationality;

    @NotNull(message = "Level cannot be null")
    @Min(value = 1, message = "Level must be at least 1")
    @Max(value = 10, message = "Level cannot exceed 10")
    private Long level;

    @NotBlank(message = "Level number cannot be empty")
    @Pattern(regexp = "^[A-Za-z0-9-]+$", message = "Level number must contain only alphanumeric characters and hyphens")
    @Size(min = 1, max = 20, message = "Level number must be between 1 and 20 characters")
    private String levelNumber;

    @NotBlank(message = "Issued date cannot be empty")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$", message = "Issued date must be in the format yyyy-MM-dd")
    private String issuedDate;

    @Pattern(regexp = "^$|^data:image/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+$", message = "Image must be in a valid base64 format (data:image/<type>;base64,...) or empty")
    @Size(max = 10485760, message = "Image size must not exceed 10MB") // 10MB in characters
    private String imgBase64;
    private String phoneNumber;
    private String englishName;
}
