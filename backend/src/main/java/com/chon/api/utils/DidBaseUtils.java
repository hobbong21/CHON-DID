package com.chon.api.utils;

import org.web3j.crypto.Hash;
import org.web3j.utils.Numeric;

import java.nio.charset.StandardCharsets;

public class DidBaseUtils {

    private static final int PUBLIC_KEY_SIZE = 65; // uncompressed (04 + X + Y)
    private static final String NID = "0000";

    public static String calcDid(byte[] publicKey) {

        if (publicKey.length != PUBLIC_KEY_SIZE) {
            throw new IllegalArgumentException("Invalid public key length");
        }

        // 1. Convert public key to hex (no 0x)
        String pubKeyHex = Numeric.toHexStringNoPrefix(publicKey);

        // 2. Ensure format: "04" + last 128 hex chars
        String formattedPubKey = "04" + pubKeyHex.substring(pubKeyHex.length() - 128);

        // 3. First keccak256
        byte[] digest1 = Hash.sha3(
                formattedPubKey.getBytes(StandardCharsets.UTF_8)
        );

        String idString = Numeric.toHexStringNoPrefix(digest1)
                .substring(0, 40);

        // 4. Second keccak256 (checksum)
        byte[] digest2 = Hash.sha3(
                (NID + idString).getBytes(StandardCharsets.UTF_8)
        );

        String checksum = Numeric.toHexStringNoPrefix(digest2)
                .substring(0, 8);

        // 5. method-specific-id
        String specificId = NID + idString + checksum;

        return "did:dxd:" + specificId;
    }


}
