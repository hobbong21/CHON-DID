package com.chon.api.controller;

import com.chon.api.config.rest.ResponseData;
import com.chon.api.model.callshield.CallShieldContactDTO;
import com.chon.api.service.CallShieldService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/call-shield")
@RequiredArgsConstructor
public class CallShieldController {

    private final CallShieldService callShieldService;

    @GetMapping("/contacts")
    public ResponseData<List<CallShieldContactDTO>> getContacts() {
        List<CallShieldContactDTO> contacts = callShieldService.getContacts();
        return new ResponseData<List<CallShieldContactDTO>>().success(contacts);
    }
}
