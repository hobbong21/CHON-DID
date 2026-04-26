package com.chon.api.utils;

import cn.hutool.core.codec.Base58;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Sign;
import org.web3j.utils.Numeric;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.ECGenParameterSpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;

public class CryptoUtil {
    // Tạo cặp khóa ECDSA với curve "secp256r1"
    public static KeyPair generateECDSAKeyPair() throws Exception {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("EC");
        ECGenParameterSpec ecSpec = new ECGenParameterSpec("secp256r1");
        keyGen.initialize(ecSpec, new SecureRandom());
        return keyGen.generateKeyPair();
    }

    public static String hashCardInfo(String raw) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = digest.digest(raw.getBytes(StandardCharsets.UTF_8));
        return bytesToHex(hashBytes);
    }

    // Ký dữ liệu đã hash bằng private key ECDSA
    public static String signData(String data, PrivateKey privateKey) throws Exception {
        Signature ecdsaSign = Signature.getInstance("SHA256withECDSA");
        ecdsaSign.initSign(privateKey);
        ecdsaSign.update(data.getBytes(StandardCharsets.UTF_8));
        byte[] signature = ecdsaSign.sign();
        return bytesToHex(signature);
    }

    // Xác minh chữ ký
    public static boolean verifySignature(String dataHash, String signatureHex, String publicKeyHex) throws Exception {
        PublicKey publicKey = getPublicKeyFromHex(publicKeyHex);
        Signature ecdsaVerify = Signature.getInstance("SHA256withECDSA");
        ecdsaVerify.initVerify(publicKey);
        ecdsaVerify.update(dataHash.getBytes(StandardCharsets.UTF_8));
        byte[] signatureBytes = hexToBytes(signatureHex);
        return ecdsaVerify.verify(signatureBytes);
    }

    // Helper: convert byte array to hex string
    public static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    // Helper: convert hex string to byte array
    public static byte[] hexToBytes(String hex) {
        int len = hex.length();
        byte[] result = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            result[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i+1), 16));
        }
        return result;
    }

    public static PublicKey getPublicKeyFromHex(String hex) throws Exception {
        byte[] bytes = hexToBytes(hex);
        KeyFactory keyFactory = KeyFactory.getInstance("EC");
        return keyFactory.generatePublic(new X509EncodedKeySpec(bytes));
    }

    public static String signDataVer2(
            String sha256Hex,
            String privateKeyHex
    ) {

        byte[] hashBytes = Numeric.hexStringToByteArray(sha256Hex);

        ECKeyPair keyPair = ECKeyPair.create(
                new BigInteger(privateKeyHex, 16)
        );

        Sign.SignatureData sig =
                Sign.signMessage(hashBytes, keyPair, false);

        byte[] sigBytes = new byte[65];
        System.arraycopy(sig.getR(), 0, sigBytes, 0, 32);
        System.arraycopy(sig.getS(), 0, sigBytes, 32, 32);
        sigBytes[64] = sig.getV()[0];

        return Numeric.toHexString(sigBytes);
    }

    public static boolean verifyDataVer2(
            String sha256Hex,
            String signatureHex,
            String publicKeyHex
    ) throws Exception {

        byte[] hashBytes = Numeric.hexStringToByteArray(sha256Hex);
        byte[] sig = Numeric.hexStringToByteArray(signatureHex);

        Sign.SignatureData signature = new Sign.SignatureData(
                sig[64],
                Arrays.copyOfRange(sig, 0, 32),
                Arrays.copyOfRange(sig, 32, 64)
        );

        BigInteger recovered =
                Sign.signedMessageHashToKey(hashBytes, signature);

        return recovered.toString(16)
                .equalsIgnoreCase(publicKeyHex);
    }

    public static String toPublicKeyBase58(String publicKeyHex) {
        byte[] publicKeyBytes = Numeric.hexStringToByteArray(publicKeyHex);
        return Base58.encode(publicKeyBytes);
    }
}
