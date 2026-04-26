// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(relation) => " is ${relation}.\nPlease confirm.";

  static String m1(account, name) => "${account} ${name}";

  static String m2(date) => "Issued on ${date}";

  static String m3(name) => "${name}, ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AN_ERROR_HAS_OCCURRED": MessageLookupByLibrary.simpleMessage(
      "An error has occurred",
    ),
    "BANK_ACCOUNT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Bank account found for this id",
    ),
    "CARD_INFO_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Card info existed",
    ),
    "CARD_INFO_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "No card found for this user",
    ),
    "CLAN_EXISTED": MessageLookupByLibrary.simpleMessage("Clan existed"),
    "CLAN_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Clan not existed",
    ),
    "CONFIRM_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Confirm DID fail",
    ),
    "DATA_NOT_MATCH": MessageLookupByLibrary.simpleMessage(
      "Data does not match",
    ),
    "DID_GENERATE_FAIL": MessageLookupByLibrary.simpleMessage(
      "Cannot generate DID from public key",
    ),
    "ENROLL_DID_FAIL": MessageLookupByLibrary.simpleMessage("Enroll DID fail"),
    "EVENT_CERTIFICATE_INVALID": MessageLookupByLibrary.simpleMessage(
      "Certificate invalid",
    ),
    "EVENT_CERTIFICATE_IS_NOT_CONFIRMED": MessageLookupByLibrary.simpleMessage(
      "Certificate is not confirmed",
    ),
    "EVENT_MUST_BE_CHECK_IN_BEFORE": MessageLookupByLibrary.simpleMessage(
      "Event must be check in before",
    ),
    "EVENT_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Event not existed",
    ),
    "FAMILY_TREE_HAS_BEEN_INITIATED": MessageLookupByLibrary.simpleMessage(
      "The family tree has been initiated.",
    ),
    "GENDER_INVALID": MessageLookupByLibrary.simpleMessage(
      "Gender must be either \'male\' or \'female\'",
    ),
    "GENDER_NOT_NULL": MessageLookupByLibrary.simpleMessage("Gender not null"),
    "ID_NUMBER_EXIST": MessageLookupByLibrary.simpleMessage(
      "ID number existed",
    ),
    "ID_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "ID number must contain only digits",
    ),
    "ID_NUMBER_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "ID number not exist",
    ),
    "ID_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "ID number not null",
    ),
    "IMG_BASE64_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Image must be in a valid base64 format",
    ),
    "IMG_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "imgBase64 not null",
    ),
    "INPUT_EMPTY": MessageLookupByLibrary.simpleMessage("Input is empty"),
    "INPUT_INVALID": MessageLookupByLibrary.simpleMessage("Input invalid"),
    "INTEGRATION_DID_FAIL": MessageLookupByLibrary.simpleMessage(
      "Integration DID fail",
    ),
    "INVALID_TOKEN": MessageLookupByLibrary.simpleMessage("Invalid token"),
    "ISSUED_DATE_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Issued date must be in the format yyyy-MM-dd",
    ),
    "ISSUED_DATE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Issued date not null",
    ),
    "LOGIN_ERROR_01": MessageLookupByLibrary.simpleMessage(
      "Email already exists",
    ),
    "MESSAGE_TOO_LONG": MessageLookupByLibrary.simpleMessage(
      "Messages must not exceed 2000 characters.",
    ),
    "NATIONALITY_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Nationality must contain only letters and spaces",
    ),
    "NATIONALITY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Nationality not null",
    ),
    "NOT_FOUND": MessageLookupByLibrary.simpleMessage("Not found"),
    "OTP_EXPIRED": MessageLookupByLibrary.simpleMessage("OTP expired"),
    "PASSWORD_NOT_MATCH": MessageLookupByLibrary.simpleMessage(
      "Password not match",
    ),
    "PASSWORD_OR_ACCOUNT_IN_ACTIVE": MessageLookupByLibrary.simpleMessage(
      "Incorrect password or account",
    ),
    "PHONE_NUMBER_EXISTED": MessageLookupByLibrary.simpleMessage(
      "phone number existed",
    ),
    "PHONE_NUMBER_INVALID_FORMAT": MessageLookupByLibrary.simpleMessage(
      "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits",
    ),
    "PHONE_NUMBER_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Phone number not exist",
    ),
    "PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Contact phone number not null",
    ),
    "REF_VISA_TYPE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Visa type not null",
    ),
    "REQUEST_TIMEOUT": MessageLookupByLibrary.simpleMessage("Request timeout"),
    "SHARE_LINK_ERROR": MessageLookupByLibrary.simpleMessage(
      "Has error when gen share link",
    ),
    "SUBMIT_DID_FAIL": MessageLookupByLibrary.simpleMessage("Submit DID fail"),
    "SYSTEM_ERROR": MessageLookupByLibrary.simpleMessage("System error"),
    "TAEKWONDO_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo existed",
    ),
    "TAEKWONDO_NOT_EXISTED": MessageLookupByLibrary.simpleMessage(
      "Taekwondo not existed",
    ),
    "THE_CONNECTION_ERRORED": MessageLookupByLibrary.simpleMessage(
      "Server is under maintenance",
    ),
    "UNAUTHORIZED": MessageLookupByLibrary.simpleMessage("Session expired"),
    "UNKNOWN": MessageLookupByLibrary.simpleMessage("Unknown Error"),
    "VALIDATE_BANK_ACCOUNT_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Bank account must not null",
    ),
    "VALIDATE_BANK_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Bank id must not null",
    ),
    "VALIDATE_BANK_REF_BANK_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Ref bank must not null",
    ),
    "VALIDATE_CARD_CARD_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Card id must not null",
    ),
    "VALIDATE_CLAN_BIRTH_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Birth must not null",
    ),
    "VALIDATE_CLAN_CLAN_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Clan name must not null",
    ),
    "VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB",
        ),
    "VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Image base64 must not null",
    ),
    "VALIDATE_CLAN_ORIGIN_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Origin must not null",
    ),
    "VALIDATE_CLAN_PA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Pa must not null",
    ),
    "VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Personal name must not null"),
    "VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789",
        ),
    "VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Phone number must not null",
    ),
    "VALIDATE_CLAN_SE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Se must not null",
    ),
    "VALIDATE_EVENT_ACTION_TYPE_INVALID": MessageLookupByLibrary.simpleMessage(
      "Event action type must not null and value is 1 (check in) or 2 (check out)",
    ),
    "VALIDATE_EVENT_ID_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Event id must not null",
    ),
    "VALIDATE_PUBLIC_KEY_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Public key must not null",
    ),
    "VALIDATE_RAW_DATA_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Raw data must not null",
    ),
    "VALIDATE_SIGNATURE_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Signature must not null",
    ),
    "VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Id number must not null"),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB",
        ),
    "VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Image base64 must not null"),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT":
        MessageLookupByLibrary.simpleMessage(
          "Issued date must be in the format yyyy-MM-dd",
        ),
    "VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Issue date must not null"),
    "VALIDATE_TEAKWONDO_LEVEL_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Level must not null",
    ),
    "VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Level number must not null"),
    "VALIDATE_TEAKWONDO_NAME_NOT_NULL": MessageLookupByLibrary.simpleMessage(
      "Name must not null",
    ),
    "VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL":
        MessageLookupByLibrary.simpleMessage("Nationality must not null"),
    "VERIFIED": MessageLookupByLibrary.simpleMessage("Contact verified"),
    "VERIFY_CONTACT_NOT_EXIST": MessageLookupByLibrary.simpleMessage(
      "Contact not exist",
    ),
    "VERIFY_ERROR": MessageLookupByLibrary.simpleMessage("Verify OTP error"),
    "account": MessageLookupByLibrary.simpleMessage("ID (email)"),
    "accountInfoError": MessageLookupByLibrary.simpleMessage(
      "Account information error. Please check your input.",
    ),
    "accountList": MessageLookupByLibrary.simpleMessage("Account List"),
    "accountRegisted": MessageLookupByLibrary.simpleMessage(
      "Your account has been registered!",
    ),
    "accountRegistration": MessageLookupByLibrary.simpleMessage(
      "Register account",
    ),
    "accountRegistrationTerms": MessageLookupByLibrary.simpleMessage(
      "Purpose: Registration of settlement account for dues\n\nThis service involves registering and verifying bank account information to perform legitimate dues payments and settlement procedures.\nThe information entered is essential for identity verification and settlement processing and is used for the following purposes:\n\n1. Identity Verification & Real-Name Authentication\nTo confirm that the user has registered their own account, a real-name authentication process is conducted through financial institutions. This prevents accidents such as misappropriation of accounts or incorrect deposits.\n\n2. Dues Payment & Settlement Processing\nAccount information is used to accurately and safely process financial transactions such as dues, settlements, and rewards occurring during service use. Deposit and withdrawal details occurring during the settlement process are transparently notified to the user.\n\n3. Minimal Collection & Storage of Financial Information\nThe service collects and uses only the minimum financial information necessary for settlement purposes and retains it only for the period prescribed by law. Information that has exceeded the retention period is immediately destroyed through secure procedures.\n\n4. Legal Compliance & Dispute Response\nIn accordance with financial transaction laws, transaction records and account information may be submitted to relevant agencies for tax, audit, or dispute resolution purposes. Even in this case, it is not provided to third parties without legal grounds.\n\nAll collected information is encrypted and safely managed in accordance with the \'Personal Information Protection Act\' and related regulations.\nUsers may withdraw their consent to provide information at any time, but withdrawal may restrict subsequent use of the settlement service.",
    ),
    "accountVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "Account verification\ncompleted",
    ),
    "achievements": MessageLookupByLibrary.simpleMessage("Achievements"),
    "action_delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "action_ok": MessageLookupByLibrary.simpleMessage("OK"),
    "action_select": MessageLookupByLibrary.simpleMessage("Select"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addNewAccount": MessageLookupByLibrary.simpleMessage("Add new account"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "agreeAccountRealName": MessageLookupByLibrary.simpleMessage(
      "(Required) Consent to real-name account verification",
    ),
    "agreeAll": MessageLookupByLibrary.simpleMessage("Agree to all terms"),
    "agreeAndContinue": MessageLookupByLibrary.simpleMessage(
      "Agree and Continue",
    ),
    "agreeFinancialInfoCollection": MessageLookupByLibrary.simpleMessage(
      "(Required) Minimal collection/storage of financial info",
    ),
    "agreeNotification": MessageLookupByLibrary.simpleMessage(
      "(Optional) Receive receipt/settlement notifications (Push/Email)",
    ),
    "album": MessageLookupByLibrary.simpleMessage("Album"),
    "appLanguage": MessageLookupByLibrary.simpleMessage("App Language"),
    "approval": MessageLookupByLibrary.simpleMessage("Approval"),
    "approvalSuccess": MessageLookupByLibrary.simpleMessage("Approval success"),
    "askForAnything": MessageLookupByLibrary.simpleMessage("Ask for anything"),
    "attachmentLabel": MessageLookupByLibrary.simpleMessage("Attachment"),
    "aunt_father_sister": MessageLookupByLibrary.simpleMessage("Aunt"),
    "aunt_uncle_wife": MessageLookupByLibrary.simpleMessage("Aunt"),
    "authRejected": MessageLookupByLibrary.simpleMessage(
      "Mutual authentication was rejected",
    ),
    "authentication": MessageLookupByLibrary.simpleMessage("Authentication"),
    "authenticationRequest": MessageLookupByLibrary.simpleMessage(
      "List of received authentication requests",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank account"),
    "bankAccountNumber": MessageLookupByLibrary.simpleMessage(
      "Bank account number",
    ),
    "bankInfo": MessageLookupByLibrary.simpleMessage("Bank Information"),
    "birth": MessageLookupByLibrary.simpleMessage("Birth"),
    "birthYearSuffix": MessageLookupByLibrary.simpleMessage("born"),
    "blockHash": MessageLookupByLibrary.simpleMessage("Block Hash"),
    "brother": MessageLookupByLibrary.simpleMessage("Brother"),
    "brother2": MessageLookupByLibrary.simpleMessage("Brother"),
    "brother_in_law": MessageLookupByLibrary.simpleMessage("Brother in law"),
    "cameraNotInitialized": MessageLookupByLibrary.simpleMessage(
      "Camera not initialized",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera access required",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "captureIdCard": MessageLookupByLibrary.simpleMessage("Capture ID"),
    "certification": MessageLookupByLibrary.simpleMessage("Certification"),
    "certifierList": MessageLookupByLibrary.simpleMessage("Certifier list"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "changePhoneSuccess": MessageLookupByLibrary.simpleMessage(
      "Change phone number successfully",
    ),
    "char": MessageLookupByLibrary.simpleMessage("character"),
    "chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "checkAccount": MessageLookupByLibrary.simpleMessage("Check Account"),
    "checkIn": MessageLookupByLibrary.simpleMessage("Check In"),
    "checkInConfirmed": MessageLookupByLibrary.simpleMessage(
      "Check-in\nconfirmed",
    ),
    "checkOriginal": MessageLookupByLibrary.simpleMessage("Check original"),
    "checkOut": MessageLookupByLibrary.simpleMessage("Check Out"),
    "checkOutConfirmed": MessageLookupByLibrary.simpleMessage(
      "Check-out\nconfirmed",
    ),
    "children": MessageLookupByLibrary.simpleMessage("Children"),
    "clan": MessageLookupByLibrary.simpleMessage("Clan"),
    "clanOfCertificate": MessageLookupByLibrary.simpleMessage(
      "Certificate of Clan",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "coating": MessageLookupByLibrary.simpleMessage("Clan"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmCheckInOut": MessageLookupByLibrary.simpleMessage(
      "Do you want to\nCheck In/Out?",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete?",
    ),
    "confirmRelationSuffix": m0,
    "confirmed": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "connect": MessageLookupByLibrary.simpleMessage("Connect"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Connection error. Please try again",
    ),
    "connectionInterrupted": MessageLookupByLibrary.simpleMessage(
      "Connection interrupted. Please try again",
    ),
    "contactAction": MessageLookupByLibrary.simpleMessage("Contact"),
    "copied": MessageLookupByLibrary.simpleMessage("Copied to clipboard"),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "copyIdLink": MessageLookupByLibrary.simpleMessage(
      "Please copy the ID link to submit",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Copy link"),
    "copyVerificationLink": MessageLookupByLibrary.simpleMessage(
      "Copy Verification Link",
    ),
    "count": MessageLookupByLibrary.simpleMessage("Count"),
    "cousin": MessageLookupByLibrary.simpleMessage("Cousin"),
    "cousin_brother": MessageLookupByLibrary.simpleMessage("Cousin"),
    "cousin_brother_in_law": MessageLookupByLibrary.simpleMessage(
      "Cousin’s husband",
    ),
    "cousin_sister": MessageLookupByLibrary.simpleMessage("Cousin"),
    "cousin_sister_in_law": MessageLookupByLibrary.simpleMessage(
      "Cousin’s wife",
    ),
    "cousins_child": MessageLookupByLibrary.simpleMessage("Cousin’s child"),
    "cousins_childs_child": MessageLookupByLibrary.simpleMessage(
      "Cousin’s grand",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createSelfId": MessageLookupByLibrary.simpleMessage("Create SelfID"),
    "createSelfIdTitle": MessageLookupByLibrary.simpleMessage("Create Self ID"),
    "dateOfIssue": MessageLookupByLibrary.simpleMessage("Date of Issue"),
    "daughter": MessageLookupByLibrary.simpleMessage("Daughter"),
    "daughter2": MessageLookupByLibrary.simpleMessage("Daughter"),
    "daughterInLaw": MessageLookupByLibrary.simpleMessage("Daughter in law"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "driverLicense": MessageLookupByLibrary.simpleMessage("Driver\'s License"),
    "duplicateNameSelectNumber": MessageLookupByLibrary.simpleMessage(
      "Duplicate names found. Please select a number.",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "elder_brother": MessageLookupByLibrary.simpleMessage("elder brother"),
    "elder_sister": MessageLookupByLibrary.simpleMessage("elder sister"),
    "emailExists": MessageLookupByLibrary.simpleMessage(
      "This email is already registered",
    ),
    "emailFormat": MessageLookupByLibrary.simpleMessage(
      "The email format is incorrect",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "english": MessageLookupByLibrary.simpleMessage("english"),
    "enter": MessageLookupByLibrary.simpleMessage("Enter"),
    "enterAccountNumber": MessageLookupByLibrary.simpleMessage(
      "Enter Account Number",
    ),
    "enterInfoForIdCreation": MessageLookupByLibrary.simpleMessage(
      "Please enter the personal information\nrequired to create an ID",
    ),
    "enterNameAndRelationship": MessageLookupByLibrary.simpleMessage(
      "Please enter the name and\nset the \'Relationship\'",
    ),
    "enterWithoutHyphen": MessageLookupByLibrary.simpleMessage(
      "Enter without hyphens",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorPageNotLoading": MessageLookupByLibrary.simpleMessage(
      "Page not loading",
    ),
    "family": MessageLookupByLibrary.simpleMessage("Family"),
    "familyCertificate": MessageLookupByLibrary.simpleMessage(
      "Family Certificate",
    ),
    "familyEditInstruction": MessageLookupByLibrary.simpleMessage(
      "Tap a family icon and press the \"Add/Delete\" button to edit.",
    ),
    "familyTree": MessageLookupByLibrary.simpleMessage("Family Tree"),
    "father": MessageLookupByLibrary.simpleMessage("Father"),
    "father_2": MessageLookupByLibrary.simpleMessage("father"),
    "female": MessageLookupByLibrary.simpleMessage("female"),
    "field_given_name": MessageLookupByLibrary.simpleMessage("Given Name"),
    "field_surname": MessageLookupByLibrary.simpleMessage("Surname"),
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all required fields",
    ),
    "finishSigup": MessageLookupByLibrary.simpleMessage(
      "Your registration has been completed!",
    ),
    "firstTimeChon": MessageLookupByLibrary.simpleMessage(
      "New to Chon?\nCreate one right now",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "goToHome": MessageLookupByLibrary.simpleMessage("Go to home"),
    "grandfather": MessageLookupByLibrary.simpleMessage("Grandfather"),
    "grandmother": MessageLookupByLibrary.simpleMessage("Grandmother"),
    "greenOnion": MessageLookupByLibrary.simpleMessage("Green Onion"),
    "groupCall": MessageLookupByLibrary.simpleMessage("Group Call"),
    "groupChat": MessageLookupByLibrary.simpleMessage("Group Chat"),
    "guidanceAndAgreement": MessageLookupByLibrary.simpleMessage(
      "Guidance and Agreement",
    ),
    "hello": MessageLookupByLibrary.simpleMessage("hello"),
    "hint_ask_anything": MessageLookupByLibrary.simpleMessage(
      "Ask me anything",
    ),
    "hint_select_contact": MessageLookupByLibrary.simpleMessage(
      "Select a contact",
    ),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "howCanIhelpYou": MessageLookupByLibrary.simpleMessage(
      "How can I help you?",
    ),
    "howToCreateSelfId": MessageLookupByLibrary.simpleMessage(
      "How would you like to\ncreate your Self ID?",
    ),
    "husband": MessageLookupByLibrary.simpleMessage("Husband"),
    "idCardAreaGuide": MessageLookupByLibrary.simpleMessage(
      "Please place your ID card within the marked area.",
    ),
    "idCardTypes": MessageLookupByLibrary.simpleMessage(
      "Mobile ID, ID Card, Driver\'s License",
    ),
    "idCheckCompleted": MessageLookupByLibrary.simpleMessage(
      "ID verification\ncompleted",
    ),
    "idList": MessageLookupByLibrary.simpleMessage("ID list"),
    "idNumber": MessageLookupByLibrary.simpleMessage("ID Number"),
    "idVerificationCompleted": MessageLookupByLibrary.simpleMessage(
      "ID verification\ncompleted",
    ),
    "identityCard": MessageLookupByLibrary.simpleMessage("Identity Card"),
    "image": MessageLookupByLibrary.simpleMessage("Image"),
    "infoRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your information",
    ),
    "info_account_holder": m1,
    "info_issued_date": m2,
    "information": MessageLookupByLibrary.simpleMessage("Information"),
    "inputInfoTitle": MessageLookupByLibrary.simpleMessage("Input Information"),
    "inquiryTitle": MessageLookupByLibrary.simpleMessage("Inquiry"),
    "issueNumber": MessageLookupByLibrary.simpleMessage(
      " have been received. Please review them.",
    ),
    "issued": MessageLookupByLibrary.simpleMessage("Issued"),
    "issuedDate": MessageLookupByLibrary.simpleMessage("Issued Date"),
    "issuer": MessageLookupByLibrary.simpleMessage("Issuing Authority"),
    "korean": MessageLookupByLibrary.simpleMessage("korean"),
    "label_aptitude_test": MessageLookupByLibrary.simpleMessage(
      "Aptitude Test",
    ),
    "label_content": MessageLookupByLibrary.simpleMessage("Content"),
    "label_expiration_date": MessageLookupByLibrary.simpleMessage(
      "Expiration Date",
    ),
    "label_license_number": MessageLookupByLibrary.simpleMessage(
      "License Number",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "languageOption": MessageLookupByLibrary.simpleMessage("Language"),
    "level": MessageLookupByLibrary.simpleMessage("Level"),
    "levelNumber": MessageLookupByLibrary.simpleMessage("Level Number"),
    "like": MessageLookupByLibrary.simpleMessage("Like"),
    "little_brother": MessageLookupByLibrary.simpleMessage("little brother"),
    "little_sister": MessageLookupByLibrary.simpleMessage("little sister"),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "loginSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Login session expired",
    ),
    "makeCall": MessageLookupByLibrary.simpleMessage("Call"),
    "male": MessageLookupByLibrary.simpleMessage("male"),
    "manualInput": MessageLookupByLibrary.simpleMessage("Manual Input"),
    "maternalGrandfather": MessageLookupByLibrary.simpleMessage(
      "Maternal grandfather",
    ),
    "maternalGrandmother": MessageLookupByLibrary.simpleMessage(
      "Maternal grandmother",
    ),
    "membershipCard": MessageLookupByLibrary.simpleMessage("Membership Card"),
    "menuTitle": MessageLookupByLibrary.simpleMessage("Menu"),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile number"),
    "mobilePhoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "mother": MessageLookupByLibrary.simpleMessage("Mother"),
    "mother_2": MessageLookupByLibrary.simpleMessage("mother"),
    "mutualAuthDesc": MessageLookupByLibrary.simpleMessage(
      "Verify identity with\nfamily and friends",
    ),
    "mutualAuthTitle": MessageLookupByLibrary.simpleMessage("Mutual Auth"),
    "mutualAuthentication": MessageLookupByLibrary.simpleMessage(
      "Mutual Authentication",
    ),
    "myInfo": MessageLookupByLibrary.simpleMessage("My information"),
    "myInformation": MessageLookupByLibrary.simpleMessage("My information"),
    "myReportHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "My Report History",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
    "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
    "nephew": MessageLookupByLibrary.simpleMessage("Nephew"),
    "nephewInLaw": MessageLookupByLibrary.simpleMessage("Nephew in law"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "niece": MessageLookupByLibrary.simpleMessage("Niece"),
    "nieceInLaw": MessageLookupByLibrary.simpleMessage("Niece in law"),
    "niece_nephew": MessageLookupByLibrary.simpleMessage("Niece / Nephew"),
    "noCard": MessageLookupByLibrary.simpleMessage(
      "You currently do not have an ID.",
    ),
    "noCardsFound": MessageLookupByLibrary.simpleMessage("No cards available"),
    "noContact": MessageLookupByLibrary.simpleMessage(
      "Contact information could not be found.",
    ),
    "noRequest": MessageLookupByLibrary.simpleMessage(
      "No verification requests found.",
    ),
    "origin": MessageLookupByLibrary.simpleMessage("Origin"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "other_grand": MessageLookupByLibrary.simpleMessage("Other grand"),
    "otpRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter the 4-digit verification code sent to your email",
    ),
    "ownedIdList": MessageLookupByLibrary.simpleMessage("Owned ID List"),
    "ownerName": m3,
    "pa": MessageLookupByLibrary.simpleMessage("Pa"),
    "passport": MessageLookupByLibrary.simpleMessage("Passport"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordMatching": MessageLookupByLibrary.simpleMessage("Password match"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter the password you want to use",
    ),
    "personToVerify": MessageLookupByLibrary.simpleMessage(
      "Person I will verify",
    ),
    "personalInfo": MessageLookupByLibrary.simpleMessage(
      "Personal information",
    ),
    "phoneNotMatch": MessageLookupByLibrary.simpleMessage(
      "The phone number doesn\'t match.",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pleaseAddVerifier": MessageLookupByLibrary.simpleMessage(
      "Please add at least one verifier",
    ),
    "pleaseCreateCertificate": MessageLookupByLibrary.simpleMessage(
      "Please create a certificate to continue.",
    ),
    "pleaseEnter": MessageLookupByLibrary.simpleMessage("Please enter"),
    "pleaseEnterAccount": MessageLookupByLibrary.simpleMessage(
      "Please enter your account",
    ),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter password",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter your mobile phone number",
    ),
    "pleaseEnterUsername": MessageLookupByLibrary.simpleMessage(
      "Please enter username",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields",
    ),
    "pleaseRequestIdentityVerification": MessageLookupByLibrary.simpleMessage(
      "Please request identity verification for the requester below.",
    ),
    "pleaseSelectBank": MessageLookupByLibrary.simpleMessage(
      "Please select a bank",
    ),
    "pleaseSelectIds": MessageLookupByLibrary.simpleMessage(
      "Please select from the IDs below\nIf you do not have one, please use ‘Message’.",
    ),
    "pleaseSelectIdsToSubmit": MessageLookupByLibrary.simpleMessage(
      "Please select the ID you wish to submit",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "qrCheckInOut": MessageLookupByLibrary.simpleMessage(
      "QR Check-in/Check-out",
    ),
    "qrScanComplete": MessageLookupByLibrary.simpleMessage(
      "QR Scan Complete!\nPlease press Connect below",
    ),
    "qrScanOrUpload": MessageLookupByLibrary.simpleMessage(
      "Scan a QR code or upload an image.",
    ),
    "readAndAgree": MessageLookupByLibrary.simpleMessage(
      "Read and agree to the guidelines below",
    ),
    "redirectIdCreation": MessageLookupByLibrary.simpleMessage(
      "Let\'s move on to the ID creation step.",
    ),
    "refusal": MessageLookupByLibrary.simpleMessage("Refusal"),
    "refusalSuccess": MessageLookupByLibrary.simpleMessage("Refusal success"),
    "registerToFamilyTreeGuide": MessageLookupByLibrary.simpleMessage(
      "If confirmed, it will be registered to my family tree",
    ),
    "relationship": MessageLookupByLibrary.simpleMessage("Relationship"),
    "relatives": MessageLookupByLibrary.simpleMessage("relatives"),
    "reportContentLabel": MessageLookupByLibrary.simpleMessage(
      "Report Details",
    ),
    "reportProblem": MessageLookupByLibrary.simpleMessage("Report a Problem"),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Report a Problem",
    ),
    "requestVerificationGuide": MessageLookupByLibrary.simpleMessage(
      "Request verification from\nfamily, relatives, or friends\n(Mutual Authentication)",
    ),
    "requesterList": MessageLookupByLibrary.simpleMessage("Requester List"),
    "requireBothUpAndLowerCase": MessageLookupByLibrary.simpleMessage(
      "Including uppercase and lowercase",
    ),
    "requireConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter it again",
    ),
    "requireSpecial": MessageLookupByLibrary.simpleMessage(
      "Contains special characters",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage("Required"),
    "requiredFieldsNoticeHighlight": MessageLookupByLibrary.simpleMessage(
      "required",
    ),
    "requiredFieldsNoticePrefix": MessageLookupByLibrary.simpleMessage(
      "All fields are ",
    ),
    "requiredFieldsNoticeSuffix": MessageLookupByLibrary.simpleMessage(""),
    "resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "residenceCard": MessageLookupByLibrary.simpleMessage("Residence Card"),
    "residentNumber": MessageLookupByLibrary.simpleMessage("ID Number"),
    "residentNumberFirstPartInvalid": MessageLookupByLibrary.simpleMessage(
      "First part of ID must be 6 digits (YYMMDD)",
    ),
    "residentNumberSecondPartInvalid": MessageLookupByLibrary.simpleMessage(
      "Last part of ID must be 7 digits",
    ),
    "ruler": MessageLookupByLibrary.simpleMessage("Ruler"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Scan QR Code"),
    "se": MessageLookupByLibrary.simpleMessage("Se"),
    "select": MessageLookupByLibrary.simpleMessage("Select"),
    "selectCardType": MessageLookupByLibrary.simpleMessage("Select card type"),
    "selectFamilyRelationship": MessageLookupByLibrary.simpleMessage(
      "Please select a family relationship",
    ),
    "selectIdToSubmit": MessageLookupByLibrary.simpleMessage(
      "Please select the ID to submit",
    ),
    "selectPortraitPhoto": MessageLookupByLibrary.simpleMessage(
      "Please select a portrait photo",
    ),
    "self": MessageLookupByLibrary.simpleMessage("Oneself"),
    "self_id_created": MessageLookupByLibrary.simpleMessage(
      "Self ID has been created",
    ),
    "sendButton": MessageLookupByLibrary.simpleMessage("Send"),
    "sendSms": MessageLookupByLibrary.simpleMessage("Text"),
    "sendTextMessage": MessageLookupByLibrary.simpleMessage("Send Text"),
    "serviceInterruption": MessageLookupByLibrary.simpleMessage(
      "Service temporarily unavailable",
    ),
    "serviceTermsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. These Terms are effective from [Feb 01, 2026].\n2. These Terms also apply to Members who joined before the effective date (except where restricted by law).",
    ),
    "serviceTermsAddendumTitle": MessageLookupByLibrary.simpleMessage(
      "Addendum",
    ),
    "serviceTermsAgreeCheckbox": MessageLookupByLibrary.simpleMessage(
      "(Required) Agree to Terms of Service",
    ),
    "serviceTermsArt10Content": MessageLookupByLibrary.simpleMessage(
      "Users shall not engage in the following acts:\n1. Account theft, identity theft, impersonation\n2. Posting illegal information, copyright infringement, obscene/illegal filming content\n3. Causing overload to the Service or server or infringing security\n4. Unauthorized collection/scraping/crawling via automated means (except as permitted by the Company)\n5. Infringement of others\' rights (portrait rights, personal information, reputation, etc.)\n6. Other acts violating laws or contrary to good morals and social order",
    ),
    "serviceTermsArt10Title": MessageLookupByLibrary.simpleMessage(
      "Article 10 (Prohibited Acts)",
    ),
    "serviceTermsArt11Content": MessageLookupByLibrary.simpleMessage(
      "1. If a Member violates these Terms or operation policies, the Company may take measures such as warning, deletion/hiding of content, restriction of features, suspension of use, or permanent suspension (account termination) depending on the severity.\n2. Members may terminate the service contract (withdraw membership) at any time through the procedure within the Service.\n3. Even after restriction or termination, some information may be retained for a certain period according to relevant laws and Company retention policies; details follow the Privacy Policy.",
    ),
    "serviceTermsArt11Title": MessageLookupByLibrary.simpleMessage(
      "Article 11 (Restriction of Use and Termination)",
    ),
    "serviceTermsArt12Content": MessageLookupByLibrary.simpleMessage(
      "1. Details, fees, payment methods, provision period, refund standards, etc., of Paid Services follow separate guides (Service screen/payment page/refund policy).\n2. Automatic renewal, cancellation, and refund conditions for subscription services may be subject to both the payment method/store policy (e.g., App Store/Play Store) and Company policy.",
    ),
    "serviceTermsArt12Title": MessageLookupByLibrary.simpleMessage(
      "Article 12 (Paid Service and Payment)",
    ),
    "serviceTermsArt13Content": MessageLookupByLibrary.simpleMessage(
      "1. The Company is not liable if it cannot provide the Service due to force majeure such as natural disasters, war, power outage, telecommunication failure, or third-party service failure.\n2. The Company is not liable for disputes between Users, accuracy of information entered by Users, reliability of mutual authentication results, or legality of Content, except where liability is recognized by law.\n3. If AI features are provided, AI output is for reference only (errors possible), and final judgment and responsibility rest with the User.",
    ),
    "serviceTermsArt13Title": MessageLookupByLibrary.simpleMessage(
      "Article 13 (Indemnification and Limitation of Liability)",
    ),
    "serviceTermsArt14Content": MessageLookupByLibrary.simpleMessage(
      "1. The Company may notify via reasonable means such as email/phone/app push/in-service notifications registered by the Member.\n2. If a Member fails to receive notice due to not maintaining up-to-date contact information, any disadvantage falls on the Member.",
    ),
    "serviceTermsArt14Title": MessageLookupByLibrary.simpleMessage(
      "Article 14 (Notice)",
    ),
    "serviceTermsArt15Content": MessageLookupByLibrary.simpleMessage(
      "Matters regarding the processing of personal information (collection, use, provision, entrustment, destruction, etc.) follow the Privacy Policy and related consent procedures. These Terms alone do not substitute for personal information consent.",
    ),
    "serviceTermsArt15Title": MessageLookupByLibrary.simpleMessage(
      "Article 15 (Data Protection)",
    ),
    "serviceTermsArt16Content": MessageLookupByLibrary.simpleMessage(
      "1. These Terms shall be interpreted and applied in accordance with the laws of the Republic of Korea.\n2. In case of disputes regarding Service use, resolution through negotiation between parties is prioritized; if negotiation fails, the Seoul Central District Court shall be the exclusive competent court (or competent court under Civil Procedure Act).",
    ),
    "serviceTermsArt16Title": MessageLookupByLibrary.simpleMessage(
      "Article 16 (Governing Law and Jurisdiction)",
    ),
    "serviceTermsArt1Content": MessageLookupByLibrary.simpleMessage(
      "The purpose of these Terms is to stipulate the rights, obligations, responsibilities, conditions, and procedures of use between the Company and the User (including Members) regarding the use of the Chon Service provided by the Company.",
    ),
    "serviceTermsArt1Title": MessageLookupByLibrary.simpleMessage(
      "Article 1 (Purpose)",
    ),
    "serviceTermsArt2Content": MessageLookupByLibrary.simpleMessage(
      "1. Service: Refers to the Chon app/web and related services provided by the Company.\n2. User: Refers to a person who accesses the Service and uses it in accordance with these Terms.\n3. Member: Refers to a person who agrees to these Terms, creates an account, and uses the Service.\n4. Account: Refers to the login means (email/phone/social login, etc.) and accompanying information established by the Member for identification and Service use.\n5. Content: Refers to text, images, documents (including PDF), links, data (including family trees/relationship maps/profiles), and other information posted, registered, uploaded, or transmitted by the Member within the Service.\n6. Mutual Authentication: Refers to the authentication procedure or function provided by the Service to verify and connect specific relationships (family/friends/organizations, etc.) between Members.\n7. Paid Service: Refers to subscriptions, passes, add-on features, etc., provided by the Company for a fee (if applicable).",
    ),
    "serviceTermsArt2Title": MessageLookupByLibrary.simpleMessage(
      "Article 2 (Definitions)",
    ),
    "serviceTermsArt3Content": MessageLookupByLibrary.simpleMessage(
      "1. These Terms become effective upon being posted on the Service screen (initial screen or linked screen) or notified by other means and agreed to by the Member.\n2. The Company may amend these Terms to the extent not violating relevant laws.\n3. Matters not stipulated in these Terms shall be governed by relevant laws, operation policies/guides separately set by the Company, and general commercial practices.",
    ),
    "serviceTermsArt3Title": MessageLookupByLibrary.simpleMessage(
      "Article 3 (Effectiveness and Application)",
    ),
    "serviceTermsArt4Content": MessageLookupByLibrary.simpleMessage(
      "1. If the Company amends the Terms, it will notify the effective date, details of amendment, and reasons within the Service.\n2. In case of significant changes or changes unfavorable to Users, the Company will notify in advance with a reasonable period (e.g., at least 30 days) and provide individual notice if necessary.\n3. Members who do not agree to the amended Terms may terminate the service contract (withdraw membership) before the amended Terms take effect.",
    ),
    "serviceTermsArt4Title": MessageLookupByLibrary.simpleMessage(
      "Article 4 (Amendment and Notice)",
    ),
    "serviceTermsArt5Content": MessageLookupByLibrary.simpleMessage(
      "1. Membership registration is established when the User agrees to the Terms and completes the procedures set by the Company (account creation, identity verification, etc.).\n2. Members must maintain their account information up to date, and the Member is responsible for any disadvantages caused by providing false information or using another person\'s information.\n3. Members are responsible for managing their account/password (or authentication means) and must notify the Company immediately if third-party use is suspected.",
    ),
    "serviceTermsArt5Title": MessageLookupByLibrary.simpleMessage(
      "Article 5 (Registration and Account Management)",
    ),
    "serviceTermsArt6Content": MessageLookupByLibrary.simpleMessage(
      "1. Registration and personal information procedures for children under 14 follow relevant laws, such as legal representative consent (registration may be restricted according to Service policy).\n2. The Company may request age verification or legal representative consent if necessary.",
    ),
    "serviceTermsArt6Title": MessageLookupByLibrary.simpleMessage(
      "Article 6 (Use by Minors)",
    ),
    "serviceTermsArt7Content": MessageLookupByLibrary.simpleMessage(
      "1. The Company may provide the following services:\na. Relationship connection and management based on mutual authentication\nb. Creation, viewing, and sharing of family trees/relationship maps\nc. Profile/ID (identity/connection) configuration and display\nd. Document/image upload and organization (including PDF)\ne. AI-based search/summary/Q&A add-on features (if applicable)\n2. The Company may change or suspend all or part of the Service and will notify in advance in case of significant changes or suspension.\n3. The Company may conduct maintenance for operational/technical needs, and maintenance times will be announced on the Service screen.",
    ),
    "serviceTermsArt7Title": MessageLookupByLibrary.simpleMessage(
      "Article 7 (Service Provision and Change)",
    ),
    "serviceTermsArt8Content": MessageLookupByLibrary.simpleMessage(
      "1. Mutual Authentication is a feature to help verify relationships between Members, and the Company does not guarantee the legal effect or truthfulness of actual relationships between Members.\n2. Members must not input or post sensitive information about others (e.g., resident registration numbers) without their consent.\n3. Relationship Data (family trees) is created by Member input and interaction, and disputes arising therefrom shall in principle be resolved between the parties. The Company has no obligation to intervene unless liability is recognized by law.",
    ),
    "serviceTermsArt8Title": MessageLookupByLibrary.simpleMessage(
      "Article 8 (Special Rules on Mutual Auth and Relationship Data)",
    ),
    "serviceTermsArt9Content": MessageLookupByLibrary.simpleMessage(
      "1. Rights to Content belong in principle to the Member who created/registered it.\n2. Members grant the Company a non-exclusive license to store, copy, transmit, convert (e.g., format conversion/search indexing), and display such Content to the extent necessary to operate, provide, and improve the Service.\n3. Members warrant that they hold legitimate rights or have received permission for uploaded documents, images, text, etc.\n4. If the Company intends to use Content to improve AI features, etc., it will undergo separate notice/consent procedures required by law (if necessary).",
    ),
    "serviceTermsArt9Title": MessageLookupByLibrary.simpleMessage(
      "Article 9 (Rights to Content and License)",
    ),
    "serviceTermsCompanyInfoContent": MessageLookupByLibrary.simpleMessage(
      "• Name: Chon Inc.\n• CEO: Geun-young Shin\n• Reg. No.: 196-86-03544\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• CS: 010-3420-8691 / ops@chon.ai\n• CPO: Nam-yul Kim",
    ),
    "serviceTermsCompanyInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Company Information",
    ),
    "serviceTermsHeaderContent": MessageLookupByLibrary.simpleMessage(
      "Effective Date: Feb 01, 2026\nVersion: v1.0\nCompany: Chon Inc. (“Company”)\nService: Chon (“Service”)",
    ),
    "serviceTermsHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Chon Service Terms of Use",
    ),
    "serviceTermsTitle": MessageLookupByLibrary.simpleMessage(
      "Chon Terms of Service",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Setting"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "shootingGuide": MessageLookupByLibrary.simpleMessage(
      "Please take the photo against a dark background. Adjust the angle to avoid reflections.",
    ),
    "siblings_brother_sister": MessageLookupByLibrary.simpleMessage(
      "Brother and sister",
    ),
    "siblings_child": MessageLookupByLibrary.simpleMessage("Sibling’s child"),
    "siblings_grand_child": MessageLookupByLibrary.simpleMessage(
      "Great grandchild",
    ),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "sister": MessageLookupByLibrary.simpleMessage("Sister"),
    "sister2": MessageLookupByLibrary.simpleMessage("Sister"),
    "sister_in_law": MessageLookupByLibrary.simpleMessage("Sister in law"),
    "son": MessageLookupByLibrary.simpleMessage("Son"),
    "son2": MessageLookupByLibrary.simpleMessage("Son"),
    "sonInLaw": MessageLookupByLibrary.simpleMessage("Son in law"),
    "spouse": MessageLookupByLibrary.simpleMessage("Spouse"),
    "subTier": MessageLookupByLibrary.simpleMessage("Sub Tier"),
    "subjectLabel": MessageLookupByLibrary.simpleMessage("Subject"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "surname": MessageLookupByLibrary.simpleMessage("Surname"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("System Default"),
    "taekwondo": MessageLookupByLibrary.simpleMessage("Taekwondo"),
    "taekwondoCertificate": MessageLookupByLibrary.simpleMessage(
      "Taekwondo Certificate",
    ),
    "taekwondoOfCertificate": MessageLookupByLibrary.simpleMessage(
      "Certificate of Taekwondo",
    ),
    "termsAddendumContent": MessageLookupByLibrary.simpleMessage(
      "1. These terms are effective from [2026.02.01].\n2. Applies to existing members prior to this date.",
    ),
    "termsAddendumTitle": MessageLookupByLibrary.simpleMessage("Addendum"),
    "termsCheckboxMarketingOptional": MessageLookupByLibrary.simpleMessage(
      "(Optional) Consent to Receive Marketing Info (Email/SMS/Push)",
    ),
    "termsCheckboxPrivacyRequired": MessageLookupByLibrary.simpleMessage(
      "(Required) Consent to Collection and Use of Personal Information",
    ),
    "termsCheckboxThirdPartyRequired": MessageLookupByLibrary.simpleMessage(
      "(Required) Consent to Third-Party Provision (Mutual Auth/Family Tree)",
    ),
    "termsConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "termsItemsContent": MessageLookupByLibrary.simpleMessage(
      "The Company collects the following items:\n(A) Required for Account:\n• Email or Phone number\n• Password (encrypted) or auth tokens\n• Display name (Name/Nickname)\n• Internal UID\n(B) For Mutual Auth/Family Tree:\n• Relationship info entered by user\n• Auth info (invitation codes, tokens)\n• Public profile info (Photo, Bio)\n(C) Auto-generated:\n• Logs, IP address, Device info, Cookies",
    ),
    "termsItemsTitle": MessageLookupByLibrary.simpleMessage(
      "2) Items Collected",
    ),
    "termsMainTitle": MessageLookupByLibrary.simpleMessage(
      "Chon Terms of Service",
    ),
    "termsMarketingConsentDetailContent": MessageLookupByLibrary.simpleMessage(
      "Service is available without this consent.\n• Purpose: Events, Promotions, New Features\n• Items: Email, Phone, Push Token\n• Retention: Until withdrawal",
    ),
    "termsMarketingConsentDetailTitle": MessageLookupByLibrary.simpleMessage(
      "[Optional] Marketing Consent Details",
    ),
    "termsMarketingInfoContent": MessageLookupByLibrary.simpleMessage(
      "Even if you do not agree to marketing consent, you can still use the basic service.\nEffective Date: 2026.02.01\nCompany: Chon Inc.\n• CEO: Geun-young Shin\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul",
    ),
    "termsMarketingInfoTitle": MessageLookupByLibrary.simpleMessage(
      "5) Optional Consent (Marketing)",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "termsPrivacyConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Chon Personal Information Collection & Use Consent",
    ),
    "termsProvisionItemsContent": MessageLookupByLibrary.simpleMessage(
      "Only information set to public/shared by the member:\n• Display Name\n• Public Profile Info\n• Relationship Data\n• Family Tree Nodes\n* Contact info (Phone/Email) is not provided unless explicitly shared.",
    ),
    "termsProvisionItemsTitle": MessageLookupByLibrary.simpleMessage(
      "3) Items Provided",
    ),
    "termsProvisionPurposeContent": MessageLookupByLibrary.simpleMessage(
      "• Performing mutual authentication\n• Connecting relationships\n• Displaying family trees",
    ),
    "termsProvisionPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "2) Purpose of Provision",
    ),
    "termsPurposeContent": MessageLookupByLibrary.simpleMessage(
      "Chon Inc. (hereinafter referred to as the \"Company\") collects and uses personal information for the following purposes:\n• Member registration and account management (identification, verification, login, prevention of fraud)\n• Mutual authentication and relationship connection (family/friends/organizations), creation/display/management of family trees\n• Service operation, security, quality improvement\n• Customer support and inquiry handling",
    ),
    "termsPurposeTitle": MessageLookupByLibrary.simpleMessage(
      "1) Purpose of Collection & Use",
    ),
    "termsRecipientContent": MessageLookupByLibrary.simpleMessage(
      "• Other members with whom mutual authentication is established\n• Members designated for family tree sharing",
    ),
    "termsRecipientRetentionContent": MessageLookupByLibrary.simpleMessage(
      "• Provided while the relationship or sharing setting is maintained.\n• If the relationship is deleted, exposure stops.",
    ),
    "termsRecipientRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "4) Recipient\'s Retention Period",
    ),
    "termsRecipientTitle": MessageLookupByLibrary.simpleMessage("1) Recipient"),
    "termsRefusalContent": MessageLookupByLibrary.simpleMessage(
      "You have the right to refuse consent. However, refusal of mandatory items may restrict service usage (Registration, Mutual Auth, etc.).",
    ),
    "termsRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "4) Right to Refuse & Disadvantages",
    ),
    "termsRetentionContent": MessageLookupByLibrary.simpleMessage(
      "In principle, personal information is retained until membership withdrawal. Exceptions apply where required by law or for dispute resolution.",
    ),
    "termsRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "3) Retention & Use Period",
    ),
    "termsScrollDown": MessageLookupByLibrary.simpleMessage("Scroll Down"),
    "termsThirdPartyContent": MessageLookupByLibrary.simpleMessage(
      "Chon Inc. provides personal information to third parties (including other members) as follows:",
    ),
    "termsThirdPartyRefusalContent": MessageLookupByLibrary.simpleMessage(
      "You may refuse third-party provision. However, this is necessary for mutual authentication and family tree features, so refusal may restrict these functions.",
    ),
    "termsThirdPartyRefusalTitle": MessageLookupByLibrary.simpleMessage(
      "5) Right to Refuse (Third Party)",
    ),
    "termsThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "Chon Third-Party Provision Consent",
    ),
    "tier": MessageLookupByLibrary.simpleMessage("Tier"),
    "unVerifiedList": MessageLookupByLibrary.simpleMessage("Unverified List"),
    "uncle_aunt_husband": MessageLookupByLibrary.simpleMessage("Uncle"),
    "uncle_father_older": MessageLookupByLibrary.simpleMessage("Uncle"),
    "unverified": MessageLookupByLibrary.simpleMessage("Unverified"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("Cannot update"),
    "uploadSizeLimitWarning": MessageLookupByLibrary.simpleMessage(
      "Files under 300MB only.",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "verificationPoint": MessageLookupByLibrary.simpleMessage(
      "Verification Points",
    ),
    "verificationRequest": MessageLookupByLibrary.simpleMessage(
      "Verification Request",
    ),
    "verificationRequestedBy": MessageLookupByLibrary.simpleMessage(
      "has requested\nverification",
    ),
    "verificationScore": MessageLookupByLibrary.simpleMessage(
      "Verification Score",
    ),
    "verifiedList": MessageLookupByLibrary.simpleMessage("Verified List"),
    "verifierForMe": MessageLookupByLibrary.simpleMessage(
      "Person to verify me",
    ),
    "verifyFinish": MessageLookupByLibrary.simpleMessage(
      "Mutual authentication\nhas been completed",
    ),
    "verifyRequest": MessageLookupByLibrary.simpleMessage(
      "Verification requests",
    ),
    "verifycationRequest": MessageLookupByLibrary.simpleMessage(
      "Verifycation Request",
    ),
    "viewFamilyTree": MessageLookupByLibrary.simpleMessage("View family tree"),
    "visaType": MessageLookupByLibrary.simpleMessage("Visa Type"),
    "wife": MessageLookupByLibrary.simpleMessage("Wife"),
  };
}
