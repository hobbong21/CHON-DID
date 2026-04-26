package com.chon.api.service;

import com.chon.api.model.callshield.CallShieldContactDTO;

import java.util.List;

public interface CallShieldService {
    List<CallShieldContactDTO> getContacts();
}
