package com.chon.api.common.constans;


public enum ErrConstans {
    LOGIN_ERROR_01("LOGIN_ERROR_01", "Email already exists"),
    INPUT_EMPTY("INPUT_EMPTY", "Input is empty"),
    INPUT_INVALID("INPUT_INVALID", "Input invalid"),
    SYSTEM_ERROR("SYSTEM_ERROR", "System error"),
    VERIFY_ERROR("VERIFY_ERROR", "Verify OTP error"),
    PASSWORD_NOT_MATCH("PASSWORD_NOT_MATCH", "Password not match"),
    OTP_EXPIRED("OTP_EXPIRED", "OTP expired"),
    ID_NUMBER_EXISTED("ID_NUMBER_EXIST", "ID number existed"),
    ID_NUMBER_NOT_EXISTED("ID_NUMBER_NOT_EXISTED", "ID number not exist"),
    VERIFY_CONTACT_NOT_EXIST("VERIFY_CONTACT_NOT_EXIST", "Verify contact not exist"),
    CARD_INFO_NOT_EXIST("CARD_INFO_NOT_EXIST", "No card found for this user"),
    TAEKWONDO_EXISTED("TAEKWONDO_EXISTED", "Taekwondo existed"),
    TAEKWONDO_NOT_EXISTED("TAEKWONDO_NOT_EXISTED", "Taekwondo not existed"),
    CLAN_NOT_EXISTED("CLAN_NOT_EXISTED", "Clan not existed"),
    CLAN_EXISTED("CLAN_EXISTED", "Clan existed"),
    BANK_ACCOUNT_NOT_EXIST("BANK_ACCOUNT_NOT_EXIST", "Bank account found for this id"),
    SHARE_LINK_ERROR("SHARE_LINK_ERROR", "Has error when gen share link"),
    INVALID_TOKEN("INVALID_TOKEN", "Invalid token"),
    VERIFY_CONTACT_VERIFIED("VERIFIED", "Contact verified"),
    CARD_INFO_EXISTED("CARD_INFO_EXISTED", "Card info existed"),
    PHONE_NUMBER_EXISTED("PHONE_NUMBER_EXISTED", "phone number existed"),
    EVENT_NOT_EXISTED("EVENT_NOT_EXISTED", "Event not existed"),
    EVENT_MUST_BE_CHECK_IN_BEFORE("EVENT_MUST_BE_CHECK_IN_BEFORE", "Event must be check in before"),
    PHONE_NUMBER_NOT_EXIST("PHONE_NUMBER_NOT_EXIST", "Phone number not exist"),
    VALIDATE_BANK_ACCOUNT_NOT_NULL("VALIDATE_BANK_ACCOUNT_NOT_NULL", "Bank account must not null"),
    VALIDATE_BANK_REF_BANK_NOT_NULL("VALIDATE_BANK_REF_BANK_NOT_NULL", "Ref bank must not null"),
    VALIDATE_BANK_ID_NOT_NULL("VALIDATE_BANK_ID_NOT_NULL", "Bank id must not null"),
    VALIDATE_CLAN_CLAN_NAME_NOT_NULL("VALIDATE_CLAN_CLAN_NAME_NOT_NULL", "Clan name must not null"),
    VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL("VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL", "Phone number must not null"),
    VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT("VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT", "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789"),
    VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL("VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL", "Image base64 must not null"),
    VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT("VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT", "Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB"),
    VALIDATE_CLAN_ORIGIN_NOT_NULL("VALIDATE_CLAN_ORIGIN_NOT_NULL", "Origin must not null"),
    VALIDATE_CLAN_PA_NOT_NULL("VALIDATE_CLAN_PA_NOT_NULL", "Pa must not null"),
    VALIDATE_CLAN_SE_NOT_NULL("VALIDATE_CLAN_SE_NOT_NULL", "Se must not null"),
    VALIDATE_CLAN_BIRTH_NOT_NULL("VALIDATE_CLAN_BIRTH_NOT_NULL", "Birth must not null"),
    VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL("VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL", "Personal name must not null"),
    VALIDATE_RAW_DATA_NOT_NULL("VALIDATE_RAW_DATA_NOT_NULL", "Raw data must not null"),
    VALIDATE_SIGNATURE_NOT_NULL("VALIDATE_SIGNATURE_NOT_NULL", "Signature must not null"),
    VALIDATE_PUBLIC_KEY_NOT_NULL("VALIDATE_PUBLIC_KEY_NOT_NULL", "Public key must not null"),
    VALIDATE_TEAKWONDO_NAME_NOT_NULL("VALIDATE_TEAKWONDO_NAME_NOT_NULL", "Name must not null" ),
    VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL("VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL", "Image base64 must not null"),
    VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT("VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT", "Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB"),
    VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL("VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL", "Id number must not null"),
    VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL("VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL", "Nationality must not null"),
    VALIDATE_TEAKWONDO_LEVEL_NOT_NULL("VALIDATE_TEAKWONDO_LEVEL_NOT_NULL", "Level must not null"),
    VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL("VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL", "Level number must not null"),
    VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL("VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL", "Issue date must not null"),
    VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT("VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT", "Issued date must be in the format yyyy-MM-dd"),
    VALIDATE_CARD_ID_NUMBER_NOT_NULL("ID_NUMBER_NOT_NULL", "ID number not null"),
    VALIDATE_CARD_ID_NUMBER_INVALID_FORMAT("ID_NUMBER_INVALID_FORMAT", "ID number must contain only digits"),
    VALIDATE_CARD_ADDRESS_NOT_NULL("ADDRESS_NOT_NULL", "Address not null"),
    VALIDATE_CARD_ISSUINGAUTHORITY_NOT_NULL("ISSUINGAUTHORITY_NOT_NULL", "IssuingAuthority not null"),
    VALIDATE_CARD_GENDER_NOT_NULL("GENDER_NOT_NULL", "Gender not null"),
    VALIDATE_CARD_GENDER_INVALID_FORMAT("GENDER_INVALID", "Gender must be either 'male' or 'female'"),
    VALIDATE_CARD_NATIONALITY_NOT_NULL("NATIONALITY_NOT_NULL", "Nationality not null"),
    VALIDATE_CARD_NATIONALITY_INVALID_FORMAT("NATIONALITY_INVALID_FORMAT", "Nationality must contain only letters and spaces"),
    VALIDATE_CARD_REF_VISA_TYPE_NOT_NULL("REF_VISA_TYPE_NOT_NULL", "Visa type not null"),
    VALIDATE_CARD_ISSUED_DATE_NOT_NULL("ISSUED_DATE_NOT_NULL", "Issued date not null"),
    VALIDATE_CARD_ISSUED_DATE_INVALID_FORMAT("ISSUED_DATE_INVALID_FORMAT", "Issued date must be in the format yyyy-MM-dd"),
    VALIDATE_CARD_PHONE_NUMBER_NOT_NULL("PHONE_NUMBER_NOT_NULL", "Contact phone number not null"),
    VALIDATE_CARD_PHONE_NUMBER_INVALID_FORMAT("PHONE_NUMBER_INVALID_FORMAT", "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits"),
    VALIDATE_CARD_IMG_BASE64_NOT_NULL("IMG_BASE64_NOT_NULL", "imgBase64 not null"),
    VALIDATE_CARD_IMG_BASE64_INVALID_FORMAT("IMG_BASE64_INVALID_FORMAT", "Image must be in a valid base64 format"),
    VALIDATE_CARD_CARD_ID_NOT_NULL("VALIDATE_CARD_CARD_ID_NOT_NULL", "Card id must not null"),
    EVENT_CERTIFICATE_INVALID("EVENT_CERTIFICATE_INVALID", "Certificate invalid"),
    EVENT_CERTIFICATE_IS_NOT_CONFIRMED("EVENT_CERTIFICATE_IS_NOT_CONFIRMED", "Certificate is not confirmed"),
    VALIDATE_EVENT_ID_NOT_NULL("VALIDATE_EVENT_ID_NOT_NULL", "Event id must not null"),
    VALIDATE_EVENT_ACTION_TYPE_INVALID("VALIDATE_EVENT_ACTION_TYPE_INVALID", "Event action type must not null and value is 1 (check in) or 2 (check out)"),
    TOKEN_VERIFY_INVALID("TOKEN_VERIFY_INVALID", "Token verify invalid"),
    VALIDATE_CLAN_ID_NUMBER_NOT_NULL("VALIDATE_CLAN_ID_NUMBER_NOT_NULL", "Clan idNumber must not null"),
    VALIDATE_TEAKWONDO_PHONE_NUMBER_NOT_NULL("VALIDATE_TEAKWONDO_PHONE_NUMBER_NOT_NULL", "Phone number must not null"),
    VALIDATE_TEAKWONDO_PHONE_NUMBER_INVALID_FORMAT("VALIDATE_TEAKWONDO_PHONE_NUMBER_INVALID_FORMAT", "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789"),
    USER_NOT_EXISTED("USER_NOT_EXISTED", "User not existed"),
    VALIDATE_CARD_ID_NUMBER_EXISTED("VALIDATE_CARD_ID_NUMBER_EXISTED", "Card idNumber existed"),
    VALIDATE_CLAN_ID_NUMBER_EXISTED("VALIDATE_CLAN_NUMBER_EXISTED", "Clan idNumber existed"),
    VALIDATE_TEAKWONDO_ID_NUMBER_EXISTED("VALIDATE_TEAK_NUMBER_EXISTED", "Teakwondo idNumber existed"),
    FAMILY_TREE_HAS_BEEN_INITIATED("FAMILY_TREE_HAS_BEEN_INITIATED", "The family tree has been initiated."),
    DID_GENERATE_FAIL(" DID_GENERATE_FAIL","Cannot generate DID from public key" ),
    INTEGRATION_DID_FAIL("INTEGRATION_DID_FAIL", "Integration DID fail"),
    ENROLL_DID_FAIL("ENROLL_DID_FAIL", "Enroll DID fail"),
    CONFIRM_DID_FAIL("CONFIRM_DID_FAIL", "Confirm DID fail"),
    SUBMIT_DID_FAIL("SUBMIT_DID_FAIL", "Submit DID fail");

    private String errorCode;
    private String errorDesc;

    ErrConstans(String errorCode, String errorDesc) {
        this.errorCode = errorCode;
        this.errorDesc = errorDesc;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorDesc() {
        return errorDesc;
    }
}
