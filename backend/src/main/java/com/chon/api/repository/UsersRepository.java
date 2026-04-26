package com.chon.api.repository;

import com.chon.api.entity.UsersEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository<UsersEntity, Long> {
    UsersEntity findByUserName(String userName);

    UsersEntity findByEmail(String email);

    UsersEntity findByPhoneNumber(@NotBlank(message = "Contact phone number cannot be empty") @Pattern(regexp = "^\\+[0-9]{1,3}\\s[0-9]{8,12}$", message = "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789") @Size(min = 11, max = 17, message = "Contact phone number must be between 11 and 17 characters, including country code and space") String phoneNumber);

    UsersEntity findByPhoneNumberAndIdNotIn(String phone, List<Long> ids);
}
