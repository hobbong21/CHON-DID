package com.chon.api.service;

import com.chon.api.model.did.request.ConfirmDidRequest;
import com.chon.api.model.did.request.EnrollDidRequest;
import com.chon.api.model.did.response.DidDocumentResponse;
import com.chon.api.model.did.request.SubmitDidRequest;

public interface DIDService {

    String submitDid(SubmitDidRequest request);

    DidDocumentResponse queryDid(String did);

    String enroll(EnrollDidRequest request);

    String confirmDid(ConfirmDidRequest request);
}
