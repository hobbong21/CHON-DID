package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.model.did.request.ConfirmDidRequest;
import com.chon.api.model.did.request.EnrollDidRequest;
import com.chon.api.model.did.response.DidDocumentResponse;
import com.chon.api.model.did.request.QueryDidRequest;
import com.chon.api.model.did.request.SubmitDidRequest;
import com.chon.api.service.DIDService;
import com.chon.api.utils.HttpCommonUtil;
import com.chon.api.utils.JsonUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
public class DIDServiceImpl implements DIDService {

    @Autowired
    private AppProperties appProperties;

    @Override
    public String submitDid(SubmitDidRequest request) {

        validateSubmitRequest(request);

        String url = appProperties.issuerBaseUrl + "/did-dxd/doc/submit";

        String res = HttpCommonUtil.post(
                url,
                appProperties.issuerToken,
                request
        );
        log.info("Response submit did: {}", res);
        return res;
    }

    @Override
    public DidDocumentResponse queryDid(String did) {

        String url = appProperties.issuerBaseUrl + "/did-dxd/doc/info";

        QueryDidRequest request = new QueryDidRequest(
                List.of("https://www.w3.org/ns/did/v1"),
                did
        );

        String response = HttpCommonUtil.post(
                url,
                null,
                request
        );

        log.info("Response query did: {}", response);

        return JsonUtil.fromJson(response, DidDocumentResponse.class);
    }

    @Override
    public String enroll(EnrollDidRequest request) {
//        validateSubmitRequest(request);

        String url = appProperties.issuerBaseUrl + "/did-dxd/doc/enroll";

        String res = HttpCommonUtil.post(
                url,
                appProperties.issuerToken,
                request
        );
        log.info("Response enroll did: {}", res);
        return res;
    }

    @Override
    public String confirmDid(ConfirmDidRequest request) {
        String url = appProperties.issuerBaseUrl + "/did-dxd/doc/submit/confirm";

        String res = HttpCommonUtil.post(
                url,
                appProperties.issuerToken,
                request
        );
        log.info("Response submit confirm did: {}", res);
        return res;
    }

    private void validateSubmitRequest(SubmitDidRequest request) {

        if (!request.getId().startsWith("did:")) {
            throw new IllegalArgumentException("Invalid DID format");
        }

        String keyId = request.getId() + "#keys-1";

        boolean match = request.getVerificationMethod()
                .stream()
                .anyMatch(vm -> keyId.equals(vm.getId()));

        if (!match) {
            throw new IllegalArgumentException("verificationMethod.id must be #keys-1");
        }
    }
}
