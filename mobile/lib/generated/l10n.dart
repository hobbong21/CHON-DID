// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email already exists`
  String get LOGIN_ERROR_01 {
    return Intl.message(
      'Email already exists',
      name: 'LOGIN_ERROR_01',
      desc: '',
      args: [],
    );
  }

  /// `Input is empty`
  String get INPUT_EMPTY {
    return Intl.message(
      'Input is empty',
      name: 'INPUT_EMPTY',
      desc: '',
      args: [],
    );
  }

  /// `System error`
  String get SYSTEM_ERROR {
    return Intl.message(
      'System error',
      name: 'SYSTEM_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP error`
  String get VERIFY_ERROR {
    return Intl.message(
      'Verify OTP error',
      name: 'VERIFY_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get PASSWORD_NOT_MATCH {
    return Intl.message(
      'Password not match',
      name: 'PASSWORD_NOT_MATCH',
      desc: '',
      args: [],
    );
  }

  /// `OTP expired`
  String get OTP_EXPIRED {
    return Intl.message('OTP expired', name: 'OTP_EXPIRED', desc: '', args: []);
  }

  /// `Session expired`
  String get UNAUTHORIZED {
    return Intl.message(
      'Session expired',
      name: 'UNAUTHORIZED',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password or account`
  String get PASSWORD_OR_ACCOUNT_IN_ACTIVE {
    return Intl.message(
      'Incorrect password or account',
      name: 'PASSWORD_OR_ACCOUNT_IN_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get AN_ERROR_HAS_OCCURRED {
    return Intl.message(
      'An error has occurred',
      name: 'AN_ERROR_HAS_OCCURRED',
      desc: '',
      args: [],
    );
  }

  /// `Input invalid`
  String get INPUT_INVALID {
    return Intl.message(
      'Input invalid',
      name: 'INPUT_INVALID',
      desc: '',
      args: [],
    );
  }

  /// `Contact not exist`
  String get VERIFY_CONTACT_NOT_EXIST {
    return Intl.message(
      'Contact not exist',
      name: 'VERIFY_CONTACT_NOT_EXIST',
      desc: '',
      args: [],
    );
  }

  /// `Server is under maintenance`
  String get THE_CONNECTION_ERRORED {
    return Intl.message(
      'Server is under maintenance',
      name: 'THE_CONNECTION_ERRORED',
      desc: '',
      args: [],
    );
  }

  /// `ID number existed`
  String get ID_NUMBER_EXIST {
    return Intl.message(
      'ID number existed',
      name: 'ID_NUMBER_EXIST',
      desc: '',
      args: [],
    );
  }

  /// `ID number not exist`
  String get ID_NUMBER_NOT_EXISTED {
    return Intl.message(
      'ID number not exist',
      name: 'ID_NUMBER_NOT_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `No card found for this user`
  String get CARD_INFO_NOT_EXIST {
    return Intl.message(
      'No card found for this user',
      name: 'CARD_INFO_NOT_EXIST',
      desc: '',
      args: [],
    );
  }

  /// `Taekwondo existed`
  String get TAEKWONDO_EXISTED {
    return Intl.message(
      'Taekwondo existed',
      name: 'TAEKWONDO_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Taekwondo not existed`
  String get TAEKWONDO_NOT_EXISTED {
    return Intl.message(
      'Taekwondo not existed',
      name: 'TAEKWONDO_NOT_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Clan not existed`
  String get CLAN_NOT_EXISTED {
    return Intl.message(
      'Clan not existed',
      name: 'CLAN_NOT_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Clan existed`
  String get CLAN_EXISTED {
    return Intl.message(
      'Clan existed',
      name: 'CLAN_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Bank account found for this id`
  String get BANK_ACCOUNT_NOT_EXIST {
    return Intl.message(
      'Bank account found for this id',
      name: 'BANK_ACCOUNT_NOT_EXIST',
      desc: '',
      args: [],
    );
  }

  /// `Has error when gen share link`
  String get SHARE_LINK_ERROR {
    return Intl.message(
      'Has error when gen share link',
      name: 'SHARE_LINK_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Invalid token`
  String get INVALID_TOKEN {
    return Intl.message(
      'Invalid token',
      name: 'INVALID_TOKEN',
      desc: '',
      args: [],
    );
  }

  /// `Contact verified`
  String get VERIFIED {
    return Intl.message(
      'Contact verified',
      name: 'VERIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Card info existed`
  String get CARD_INFO_EXISTED {
    return Intl.message(
      'Card info existed',
      name: 'CARD_INFO_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `phone number existed`
  String get PHONE_NUMBER_EXISTED {
    return Intl.message(
      'phone number existed',
      name: 'PHONE_NUMBER_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Event not existed`
  String get EVENT_NOT_EXISTED {
    return Intl.message(
      'Event not existed',
      name: 'EVENT_NOT_EXISTED',
      desc: '',
      args: [],
    );
  }

  /// `Event must be check in before`
  String get EVENT_MUST_BE_CHECK_IN_BEFORE {
    return Intl.message(
      'Event must be check in before',
      name: 'EVENT_MUST_BE_CHECK_IN_BEFORE',
      desc: '',
      args: [],
    );
  }

  /// `Phone number not exist`
  String get PHONE_NUMBER_NOT_EXIST {
    return Intl.message(
      'Phone number not exist',
      name: 'PHONE_NUMBER_NOT_EXIST',
      desc: '',
      args: [],
    );
  }

  /// `Bank account must not null`
  String get VALIDATE_BANK_ACCOUNT_NOT_NULL {
    return Intl.message(
      'Bank account must not null',
      name: 'VALIDATE_BANK_ACCOUNT_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Ref bank must not null`
  String get VALIDATE_BANK_REF_BANK_NOT_NULL {
    return Intl.message(
      'Ref bank must not null',
      name: 'VALIDATE_BANK_REF_BANK_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Bank id must not null`
  String get VALIDATE_BANK_ID_NOT_NULL {
    return Intl.message(
      'Bank id must not null',
      name: 'VALIDATE_BANK_ID_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Clan name must not null`
  String get VALIDATE_CLAN_CLAN_NAME_NOT_NULL {
    return Intl.message(
      'Clan name must not null',
      name: 'VALIDATE_CLAN_CLAN_NAME_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must not null`
  String get VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL {
    return Intl.message(
      'Phone number must not null',
      name: 'VALIDATE_CLAN_PHONE_NUMBER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789`
  String get VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT {
    return Intl.message(
      'Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits, e.g., +84 123456789',
      name: 'VALIDATE_CLAN_PHONE_NUMBER_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Image base64 must not null`
  String get VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL {
    return Intl.message(
      'Image base64 must not null',
      name: 'VALIDATE_CLAN_IMAGE_BASE64_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB`
  String get VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT {
    return Intl.message(
      'Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB',
      name: 'VALIDATE_CLAN_IMAGE_BASE64_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Origin must not null`
  String get VALIDATE_CLAN_ORIGIN_NOT_NULL {
    return Intl.message(
      'Origin must not null',
      name: 'VALIDATE_CLAN_ORIGIN_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Pa must not null`
  String get VALIDATE_CLAN_PA_NOT_NULL {
    return Intl.message(
      'Pa must not null',
      name: 'VALIDATE_CLAN_PA_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Se must not null`
  String get VALIDATE_CLAN_SE_NOT_NULL {
    return Intl.message(
      'Se must not null',
      name: 'VALIDATE_CLAN_SE_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Birth must not null`
  String get VALIDATE_CLAN_BIRTH_NOT_NULL {
    return Intl.message(
      'Birth must not null',
      name: 'VALIDATE_CLAN_BIRTH_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Personal name must not null`
  String get VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL {
    return Intl.message(
      'Personal name must not null',
      name: 'VALIDATE_CLAN_PERSONAL_NAME_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Raw data must not null`
  String get VALIDATE_RAW_DATA_NOT_NULL {
    return Intl.message(
      'Raw data must not null',
      name: 'VALIDATE_RAW_DATA_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Signature must not null`
  String get VALIDATE_SIGNATURE_NOT_NULL {
    return Intl.message(
      'Signature must not null',
      name: 'VALIDATE_SIGNATURE_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Public key must not null`
  String get VALIDATE_PUBLIC_KEY_NOT_NULL {
    return Intl.message(
      'Public key must not null',
      name: 'VALIDATE_PUBLIC_KEY_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Name must not null`
  String get VALIDATE_TEAKWONDO_NAME_NOT_NULL {
    return Intl.message(
      'Name must not null',
      name: 'VALIDATE_TEAKWONDO_NAME_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Image base64 must not null`
  String get VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL {
    return Intl.message(
      'Image base64 must not null',
      name: 'VALIDATE_TEAKWONDO_IMAGE_BASE64_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB`
  String get VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT {
    return Intl.message(
      'Image must be in a valid base64 format (data:image/<type>;base64,...) and size <= 10MB',
      name: 'VALIDATE_TEAKWONDO_IMAGE_BASE64_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Id number must not null`
  String get VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL {
    return Intl.message(
      'Id number must not null',
      name: 'VALIDATE_TEAKWONDO_ID_NUMBER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Nationality must not null`
  String get VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL {
    return Intl.message(
      'Nationality must not null',
      name: 'VALIDATE_TEAKWONDO_NATIONALY_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Level must not null`
  String get VALIDATE_TEAKWONDO_LEVEL_NOT_NULL {
    return Intl.message(
      'Level must not null',
      name: 'VALIDATE_TEAKWONDO_LEVEL_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Level number must not null`
  String get VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL {
    return Intl.message(
      'Level number must not null',
      name: 'VALIDATE_TEAKWONDO_LEVEL_NUMBER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Issue date must not null`
  String get VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL {
    return Intl.message(
      'Issue date must not null',
      name: 'VALIDATE_TEAKWONDO_ISSUE_DATE_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Issued date must be in the format yyyy-MM-dd`
  String get VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT {
    return Intl.message(
      'Issued date must be in the format yyyy-MM-dd',
      name: 'VALIDATE_TEAKWONDO_ISSUE_DATE_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `ID number not null`
  String get ID_NUMBER_NOT_NULL {
    return Intl.message(
      'ID number not null',
      name: 'ID_NUMBER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `ID number must contain only digits`
  String get ID_NUMBER_INVALID_FORMAT {
    return Intl.message(
      'ID number must contain only digits',
      name: 'ID_NUMBER_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Gender not null`
  String get GENDER_NOT_NULL {
    return Intl.message(
      'Gender not null',
      name: 'GENDER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Gender must be either 'male' or 'female'`
  String get GENDER_INVALID {
    return Intl.message(
      'Gender must be either \'male\' or \'female\'',
      name: 'GENDER_INVALID',
      desc: '',
      args: [],
    );
  }

  /// `Nationality not null`
  String get NATIONALITY_NOT_NULL {
    return Intl.message(
      'Nationality not null',
      name: 'NATIONALITY_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Nationality must contain only letters and spaces`
  String get NATIONALITY_INVALID_FORMAT {
    return Intl.message(
      'Nationality must contain only letters and spaces',
      name: 'NATIONALITY_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Visa type not null`
  String get REF_VISA_TYPE_NOT_NULL {
    return Intl.message(
      'Visa type not null',
      name: 'REF_VISA_TYPE_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Issued date not null`
  String get ISSUED_DATE_NOT_NULL {
    return Intl.message(
      'Issued date not null',
      name: 'ISSUED_DATE_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Issued date must be in the format yyyy-MM-dd`
  String get ISSUED_DATE_INVALID_FORMAT {
    return Intl.message(
      'Issued date must be in the format yyyy-MM-dd',
      name: 'ISSUED_DATE_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Contact phone number not null`
  String get PHONE_NUMBER_NOT_NULL {
    return Intl.message(
      'Contact phone number not null',
      name: 'PHONE_NUMBER_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits`
  String get PHONE_NUMBER_INVALID_FORMAT {
    return Intl.message(
      'Contact phone number must start with a country code (e.g., +84, +1) followed by a space and 8 to 12 digits',
      name: 'PHONE_NUMBER_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `imgBase64 not null`
  String get IMG_BASE64_NOT_NULL {
    return Intl.message(
      'imgBase64 not null',
      name: 'IMG_BASE64_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Image must be in a valid base64 format`
  String get IMG_BASE64_INVALID_FORMAT {
    return Intl.message(
      'Image must be in a valid base64 format',
      name: 'IMG_BASE64_INVALID_FORMAT',
      desc: '',
      args: [],
    );
  }

  /// `Card id must not null`
  String get VALIDATE_CARD_CARD_ID_NOT_NULL {
    return Intl.message(
      'Card id must not null',
      name: 'VALIDATE_CARD_CARD_ID_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Certificate invalid`
  String get EVENT_CERTIFICATE_INVALID {
    return Intl.message(
      'Certificate invalid',
      name: 'EVENT_CERTIFICATE_INVALID',
      desc: '',
      args: [],
    );
  }

  /// `Certificate is not confirmed`
  String get EVENT_CERTIFICATE_IS_NOT_CONFIRMED {
    return Intl.message(
      'Certificate is not confirmed',
      name: 'EVENT_CERTIFICATE_IS_NOT_CONFIRMED',
      desc: '',
      args: [],
    );
  }

  /// `Event id must not null`
  String get VALIDATE_EVENT_ID_NOT_NULL {
    return Intl.message(
      'Event id must not null',
      name: 'VALIDATE_EVENT_ID_NOT_NULL',
      desc: '',
      args: [],
    );
  }

  /// `Event action type must not null and value is 1 (check in) or 2 (check out)`
  String get VALIDATE_EVENT_ACTION_TYPE_INVALID {
    return Intl.message(
      'Event action type must not null and value is 1 (check in) or 2 (check out)',
      name: 'VALIDATE_EVENT_ACTION_TYPE_INVALID',
      desc: '',
      args: [],
    );
  }

  /// `The family tree has been initiated.`
  String get FAMILY_TREE_HAS_BEEN_INITIATED {
    return Intl.message(
      'The family tree has been initiated.',
      name: 'FAMILY_TREE_HAS_BEEN_INITIATED',
      desc: '',
      args: [],
    );
  }

  /// `Cannot generate DID from public key`
  String get DID_GENERATE_FAIL {
    return Intl.message(
      'Cannot generate DID from public key',
      name: 'DID_GENERATE_FAIL',
      desc: '',
      args: [],
    );
  }

  /// `Integration DID fail`
  String get INTEGRATION_DID_FAIL {
    return Intl.message(
      'Integration DID fail',
      name: 'INTEGRATION_DID_FAIL',
      desc: '',
      args: [],
    );
  }

  /// `Enroll DID fail`
  String get ENROLL_DID_FAIL {
    return Intl.message(
      'Enroll DID fail',
      name: 'ENROLL_DID_FAIL',
      desc: '',
      args: [],
    );
  }

  /// `Confirm DID fail`
  String get CONFIRM_DID_FAIL {
    return Intl.message(
      'Confirm DID fail',
      name: 'CONFIRM_DID_FAIL',
      desc: '',
      args: [],
    );
  }

  /// `Submit DID fail`
  String get SUBMIT_DID_FAIL {
    return Intl.message(
      'Submit DID fail',
      name: 'SUBMIT_DID_FAIL',
      desc: '',
      args: [],
    );
  }

  /// `Data does not match`
  String get DATA_NOT_MATCH {
    return Intl.message(
      'Data does not match',
      name: 'DATA_NOT_MATCH',
      desc: '',
      args: [],
    );
  }

  /// `Messages must not exceed 2000 characters.`
  String get MESSAGE_TOO_LONG {
    return Intl.message(
      'Messages must not exceed 2000 characters.',
      name: 'MESSAGE_TOO_LONG',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get NOT_FOUND {
    return Intl.message('Not found', name: 'NOT_FOUND', desc: '', args: []);
  }

  /// `Request timeout`
  String get REQUEST_TIMEOUT {
    return Intl.message(
      'Request timeout',
      name: 'REQUEST_TIMEOUT',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get UNKNOWN {
    return Intl.message('Unknown Error', name: 'UNKNOWN', desc: '', args: []);
  }

  /// `hello`
  String get hello {
    return Intl.message('hello', name: 'hello', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Connection error. Please try again`
  String get connectionError {
    return Intl.message(
      'Connection error. Please try again',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Connection interrupted. Please try again`
  String get connectionInterrupted {
    return Intl.message(
      'Connection interrupted. Please try again',
      name: 'connectionInterrupted',
      desc: '',
      args: [],
    );
  }

  /// `Login session expired`
  String get loginSessionExpired {
    return Intl.message(
      'Login session expired',
      name: 'loginSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Service temporarily unavailable`
  String get serviceInterruption {
    return Intl.message(
      'Service temporarily unavailable',
      name: 'serviceInterruption',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter username`
  String get pleaseEnterUsername {
    return Intl.message(
      'Please enter username',
      name: 'pleaseEnterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `ID (email)`
  String get account {
    return Intl.message('ID (email)', name: 'account', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `The email format is incorrect`
  String get emailFormat {
    return Intl.message(
      'The email format is incorrect',
      name: 'emailFormat',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered`
  String get emailExists {
    return Intl.message(
      'This email is already registered',
      name: 'emailExists',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4-digit verification code sent to your email`
  String get otpRequired {
    return Intl.message(
      'Please enter the 4-digit verification code sent to your email',
      name: 'otpRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password you want to use`
  String get passwordRequired {
    return Intl.message(
      'Please enter the password you want to use',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `character`
  String get char {
    return Intl.message('character', name: 'char', desc: '', args: []);
  }

  /// `Including uppercase and lowercase`
  String get requireBothUpAndLowerCase {
    return Intl.message(
      'Including uppercase and lowercase',
      name: 'requireBothUpAndLowerCase',
      desc: '',
      args: [],
    );
  }

  /// `Contains special characters`
  String get requireSpecial {
    return Intl.message(
      'Contains special characters',
      name: 'requireSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Please enter it again`
  String get requireConfirmPassword {
    return Intl.message(
      'Please enter it again',
      name: 'requireConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password match`
  String get passwordMatching {
    return Intl.message(
      'Password match',
      name: 'passwordMatching',
      desc: '',
      args: [],
    );
  }

  /// `Your registration has been completed!`
  String get finishSigup {
    return Intl.message(
      'Your registration has been completed!',
      name: 'finishSigup',
      desc: '',
      args: [],
    );
  }

  /// `Go to home`
  String get goToHome {
    return Intl.message('Go to home', name: 'goToHome', desc: '', args: []);
  }

  /// `Please enter your information`
  String get infoRequired {
    return Intl.message(
      'Please enter your information',
      name: 'infoRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter`
  String get pleaseEnter {
    return Intl.message(
      'Please enter',
      name: 'pleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `female`
  String get female {
    return Intl.message('female', name: 'female', desc: '', args: []);
  }

  /// `male`
  String get male {
    return Intl.message('male', name: 'male', desc: '', args: []);
  }

  /// `Verifycation Request`
  String get verifycationRequest {
    return Intl.message(
      'Verifycation Request',
      name: 'verifycationRequest',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least one verifier`
  String get pleaseAddVerifier {
    return Intl.message(
      'Please add at least one verifier',
      name: 'pleaseAddVerifier',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get pleaseFillAllFields {
    return Intl.message(
      'Please fill in all fields',
      name: 'pleaseFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Certification`
  String get certification {
    return Intl.message(
      'Certification',
      name: 'certification',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `Personal information`
  String get personalInfo {
    return Intl.message(
      'Personal information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Bank account number`
  String get bankAccountNumber {
    return Intl.message(
      'Bank account number',
      name: 'bankAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mobile phone number`
  String get pleaseEnterPhone {
    return Intl.message(
      'Please enter your mobile phone number',
      name: 'pleaseEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `My information`
  String get myInformation {
    return Intl.message(
      'My information',
      name: 'myInformation',
      desc: '',
      args: [],
    );
  }

  /// `My information`
  String get myInfo {
    return Intl.message('My information', name: 'myInfo', desc: '', args: []);
  }

  /// `Clan`
  String get coating {
    return Intl.message('Clan', name: 'coating', desc: '', args: []);
  }

  /// `Family`
  String get family {
    return Intl.message('Family', name: 'family', desc: '', args: []);
  }

  /// `Taekwondo`
  String get taekwondo {
    return Intl.message('Taekwondo', name: 'taekwondo', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Copy link`
  String get copyLink {
    return Intl.message('Copy link', name: 'copyLink', desc: '', args: []);
  }

  /// `Bank account`
  String get bankAccount {
    return Intl.message(
      'Bank account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been registered!`
  String get accountRegisted {
    return Intl.message(
      'Your account has been registered!',
      name: 'accountRegisted',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Requester List`
  String get requesterList {
    return Intl.message(
      'Requester List',
      name: 'requesterList',
      desc: '',
      args: [],
    );
  }

  /// `Certifier list`
  String get certifierList {
    return Intl.message(
      'Certifier list',
      name: 'certifierList',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Refusal`
  String get refusal {
    return Intl.message('Refusal', name: 'refusal', desc: '', args: []);
  }

  /// `Approval`
  String get approval {
    return Intl.message('Approval', name: 'approval', desc: '', args: []);
  }

  /// `Refusal success`
  String get refusalSuccess {
    return Intl.message(
      'Refusal success',
      name: 'refusalSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Approval success`
  String get approvalSuccess {
    return Intl.message(
      'Approval success',
      name: 'approvalSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please select a bank`
  String get pleaseSelectBank {
    return Intl.message(
      'Please select a bank',
      name: 'pleaseSelectBank',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your account`
  String get pleaseEnterAccount {
    return Intl.message(
      'Please enter your account',
      name: 'pleaseEnterAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account List`
  String get accountList {
    return Intl.message(
      'Account List',
      name: 'accountList',
      desc: '',
      args: [],
    );
  }

  /// `Register account`
  String get accountRegistration {
    return Intl.message(
      'Register account',
      name: 'accountRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Ruler`
  String get ruler {
    return Intl.message('Ruler', name: 'ruler', desc: '', args: []);
  }

  /// `Like`
  String get like {
    return Intl.message('Like', name: 'like', desc: '', args: []);
  }

  /// `Surname`
  String get surname {
    return Intl.message('Surname', name: 'surname', desc: '', args: []);
  }

  /// `Green Onion`
  String get greenOnion {
    return Intl.message('Green Onion', name: 'greenOnion', desc: '', args: []);
  }

  /// `Count`
  String get count {
    return Intl.message('Count', name: 'count', desc: '', args: []);
  }

  /// `Achievements`
  String get achievements {
    return Intl.message(
      'Achievements',
      name: 'achievements',
      desc: '',
      args: [],
    );
  }

  /// `Unverified`
  String get unverified {
    return Intl.message('Unverified', name: 'unverified', desc: '', args: []);
  }

  /// `Change phone number successfully`
  String get changePhoneSuccess {
    return Intl.message(
      'Change phone number successfully',
      name: 'changePhoneSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Certificate of Clan`
  String get clanOfCertificate {
    return Intl.message(
      'Certificate of Clan',
      name: 'clanOfCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Taekwondo Certificate`
  String get taekwondoCertificate {
    return Intl.message(
      'Taekwondo Certificate',
      name: 'taekwondoCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Certificate of Taekwondo`
  String get taekwondoOfCertificate {
    return Intl.message(
      'Certificate of Taekwondo',
      name: 'taekwondoOfCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Residence Card`
  String get residenceCard {
    return Intl.message(
      'Residence Card',
      name: 'residenceCard',
      desc: '',
      args: [],
    );
  }

  /// `Membership Card`
  String get membershipCard {
    return Intl.message(
      'Membership Card',
      name: 'membershipCard',
      desc: '',
      args: [],
    );
  }

  /// `Issued`
  String get issued {
    return Intl.message('Issued', name: 'issued', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message('Confirmed', name: 'confirmed', desc: '', args: []);
  }

  /// `Please select from the IDs below\nIf you do not have one, please use ‘Message’.`
  String get pleaseSelectIds {
    return Intl.message(
      'Please select from the IDs below\nIf you do not have one, please use ‘Message’.',
      name: 'pleaseSelectIds',
      desc: '',
      args: [],
    );
  }

  /// `Please select the ID you wish to submit`
  String get pleaseSelectIdsToSubmit {
    return Intl.message(
      'Please select the ID you wish to submit',
      name: 'pleaseSelectIdsToSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Ask for anything`
  String get askForAnything {
    return Intl.message(
      'Ask for anything',
      name: 'askForAnything',
      desc: '',
      args: [],
    );
  }

  /// `Verification Score`
  String get verificationScore {
    return Intl.message(
      'Verification Score',
      name: 'verificationScore',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get idNumber {
    return Intl.message('ID Number', name: 'idNumber', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Nationality`
  String get nationality {
    return Intl.message('Nationality', name: 'nationality', desc: '', args: []);
  }

  /// `Visa Type`
  String get visaType {
    return Intl.message('Visa Type', name: 'visaType', desc: '', args: []);
  }

  /// `Issued Date`
  String get issuedDate {
    return Intl.message('Issued Date', name: 'issuedDate', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `ID Number`
  String get residentNumber {
    return Intl.message(
      'ID Number',
      name: 'residentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message('Level', name: 'level', desc: '', args: []);
  }

  /// `Level Number`
  String get levelNumber {
    return Intl.message(
      'Level Number',
      name: 'levelNumber',
      desc: '',
      args: [],
    );
  }

  /// `Clan`
  String get clan {
    return Intl.message('Clan', name: 'clan', desc: '', args: []);
  }

  /// `Origin`
  String get origin {
    return Intl.message('Origin', name: 'origin', desc: '', args: []);
  }

  /// `Pa`
  String get pa {
    return Intl.message('Pa', name: 'pa', desc: '', args: []);
  }

  /// `Se`
  String get se {
    return Intl.message('Se', name: 'se', desc: '', args: []);
  }

  /// `Birth`
  String get birth {
    return Intl.message('Birth', name: 'birth', desc: '', args: []);
  }

  /// `Phone Number`
  String get mobilePhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'mobilePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verification Request`
  String get verificationRequest {
    return Intl.message(
      'Verification Request',
      name: 'verificationRequest',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Tier`
  String get tier {
    return Intl.message('Tier', name: 'tier', desc: '', args: []);
  }

  /// `Sub Tier`
  String get subTier {
    return Intl.message('Sub Tier', name: 'subTier', desc: '', args: []);
  }

  /// `Verified List`
  String get verifiedList {
    return Intl.message(
      'Verified List',
      name: 'verifiedList',
      desc: '',
      args: [],
    );
  }

  /// `Unverified List`
  String get unVerifiedList {
    return Intl.message(
      'Unverified List',
      name: 'unVerifiedList',
      desc: '',
      args: [],
    );
  }

  /// `Add new account`
  String get addNewAccount {
    return Intl.message(
      'Add new account',
      name: 'addNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please create a certificate to continue.`
  String get pleaseCreateCertificate {
    return Intl.message(
      'Please create a certificate to continue.',
      name: 'pleaseCreateCertificate',
      desc: '',
      args: [],
    );
  }

  /// `How can I help you?`
  String get howCanIhelpYou {
    return Intl.message(
      'How can I help you?',
      name: 'howCanIhelpYou',
      desc: '',
      args: [],
    );
  }

  /// `Create SelfID`
  String get createSelfId {
    return Intl.message(
      'Create SelfID',
      name: 'createSelfId',
      desc: '',
      args: [],
    );
  }

  /// `Authentication`
  String get authentication {
    return Intl.message(
      'Authentication',
      name: 'authentication',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message('Information', name: 'information', desc: '', args: []);
  }

  /// `ID list`
  String get idList {
    return Intl.message('ID list', name: 'idList', desc: '', args: []);
  }

  /// `Please request identity verification for the requester below.`
  String get pleaseRequestIdentityVerification {
    return Intl.message(
      'Please request identity verification for the requester below.',
      name: 'pleaseRequestIdentityVerification',
      desc: '',
      args: [],
    );
  }

  /// `korean`
  String get korean {
    return Intl.message('korean', name: 'korean', desc: '', args: []);
  }

  /// `english`
  String get english {
    return Intl.message('english', name: 'english', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Connect`
  String get connect {
    return Intl.message('Connect', name: 'connect', desc: '', args: []);
  }

  /// `Enter Account Number`
  String get enterAccountNumber {
    return Intl.message(
      'Enter Account Number',
      name: 'enterAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter without hyphens`
  String get enterWithoutHyphen {
    return Intl.message(
      'Enter without hyphens',
      name: 'enterWithoutHyphen',
      desc: '',
      args: [],
    );
  }

  /// `Account information error. Please check your input.`
  String get accountInfoError {
    return Intl.message(
      'Account information error. Please check your input.',
      name: 'accountInfoError',
      desc: '',
      args: [],
    );
  }

  /// `Check Account`
  String get checkAccount {
    return Intl.message(
      'Check Account',
      name: 'checkAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account verification\ncompleted`
  String get accountVerificationCompleted {
    return Intl.message(
      'Account verification\ncompleted',
      name: 'accountVerificationCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Read and agree to the guidelines below`
  String get readAndAgree {
    return Intl.message(
      'Read and agree to the guidelines below',
      name: 'readAndAgree',
      desc: '',
      args: [],
    );
  }

  /// `Guidance and Agreement`
  String get guidanceAndAgreement {
    return Intl.message(
      'Guidance and Agreement',
      name: 'guidanceAndAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Purpose: Registration of settlement account for dues\n\nThis service involves registering and verifying bank account information to perform legitimate dues payments and settlement procedures.\nThe information entered is essential for identity verification and settlement processing and is used for the following purposes:\n\n1. Identity Verification & Real-Name Authentication\nTo confirm that the user has registered their own account, a real-name authentication process is conducted through financial institutions. This prevents accidents such as misappropriation of accounts or incorrect deposits.\n\n2. Dues Payment & Settlement Processing\nAccount information is used to accurately and safely process financial transactions such as dues, settlements, and rewards occurring during service use. Deposit and withdrawal details occurring during the settlement process are transparently notified to the user.\n\n3. Minimal Collection & Storage of Financial Information\nThe service collects and uses only the minimum financial information necessary for settlement purposes and retains it only for the period prescribed by law. Information that has exceeded the retention period is immediately destroyed through secure procedures.\n\n4. Legal Compliance & Dispute Response\nIn accordance with financial transaction laws, transaction records and account information may be submitted to relevant agencies for tax, audit, or dispute resolution purposes. Even in this case, it is not provided to third parties without legal grounds.\n\nAll collected information is encrypted and safely managed in accordance with the 'Personal Information Protection Act' and related regulations.\nUsers may withdraw their consent to provide information at any time, but withdrawal may restrict subsequent use of the settlement service.`
  String get accountRegistrationTerms {
    return Intl.message(
      'Purpose: Registration of settlement account for dues\n\nThis service involves registering and verifying bank account information to perform legitimate dues payments and settlement procedures.\nThe information entered is essential for identity verification and settlement processing and is used for the following purposes:\n\n1. Identity Verification & Real-Name Authentication\nTo confirm that the user has registered their own account, a real-name authentication process is conducted through financial institutions. This prevents accidents such as misappropriation of accounts or incorrect deposits.\n\n2. Dues Payment & Settlement Processing\nAccount information is used to accurately and safely process financial transactions such as dues, settlements, and rewards occurring during service use. Deposit and withdrawal details occurring during the settlement process are transparently notified to the user.\n\n3. Minimal Collection & Storage of Financial Information\nThe service collects and uses only the minimum financial information necessary for settlement purposes and retains it only for the period prescribed by law. Information that has exceeded the retention period is immediately destroyed through secure procedures.\n\n4. Legal Compliance & Dispute Response\nIn accordance with financial transaction laws, transaction records and account information may be submitted to relevant agencies for tax, audit, or dispute resolution purposes. Even in this case, it is not provided to third parties without legal grounds.\n\nAll collected information is encrypted and safely managed in accordance with the \'Personal Information Protection Act\' and related regulations.\nUsers may withdraw their consent to provide information at any time, but withdrawal may restrict subsequent use of the settlement service.',
      name: 'accountRegistrationTerms',
      desc: '',
      args: [],
    );
  }

  /// `Agree to all terms`
  String get agreeAll {
    return Intl.message(
      'Agree to all terms',
      name: 'agreeAll',
      desc: '',
      args: [],
    );
  }

  /// `(Required) Consent to real-name account verification`
  String get agreeAccountRealName {
    return Intl.message(
      '(Required) Consent to real-name account verification',
      name: 'agreeAccountRealName',
      desc: '',
      args: [],
    );
  }

  /// `(Required) Minimal collection/storage of financial info`
  String get agreeFinancialInfoCollection {
    return Intl.message(
      '(Required) Minimal collection/storage of financial info',
      name: 'agreeFinancialInfoCollection',
      desc: '',
      args: [],
    );
  }

  /// `(Optional) Receive receipt/settlement notifications (Push/Email)`
  String get agreeNotification {
    return Intl.message(
      '(Optional) Receive receipt/settlement notifications (Push/Email)',
      name: 'agreeNotification',
      desc: '',
      args: [],
    );
  }

  /// `Agree and Continue`
  String get agreeAndContinue {
    return Intl.message(
      'Agree and Continue',
      name: 'agreeAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `born`
  String get birthYearSuffix {
    return Intl.message('born', name: 'birthYearSuffix', desc: '', args: []);
  }

  /// `Do you want to\nCheck In/Out?`
  String get confirmCheckInOut {
    return Intl.message(
      'Do you want to\nCheck In/Out?',
      name: 'confirmCheckInOut',
      desc: '',
      args: [],
    );
  }

  /// `Check In`
  String get checkIn {
    return Intl.message('Check In', name: 'checkIn', desc: '', args: []);
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message('Check Out', name: 'checkOut', desc: '', args: []);
  }

  /// `has requested\nverification`
  String get verificationRequestedBy {
    return Intl.message(
      'has requested\nverification',
      name: 'verificationRequestedBy',
      desc: '',
      args: [],
    );
  }

  /// `If confirmed, it will be registered to my family tree`
  String get registerToFamilyTreeGuide {
    return Intl.message(
      'If confirmed, it will be registered to my family tree',
      name: 'registerToFamilyTreeGuide',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get makeCall {
    return Intl.message('Call', name: 'makeCall', desc: '', args: []);
  }

  /// `Text`
  String get sendSms {
    return Intl.message('Text', name: 'sendSms', desc: '', args: []);
  }

  /// `Please place your ID card within the marked area.`
  String get idCardAreaGuide {
    return Intl.message(
      'Please place your ID card within the marked area.',
      name: 'idCardAreaGuide',
      desc: '',
      args: [],
    );
  }

  /// `Please take the photo against a dark background. Adjust the angle to avoid reflections.`
  String get shootingGuide {
    return Intl.message(
      'Please take the photo against a dark background. Adjust the angle to avoid reflections.',
      name: 'shootingGuide',
      desc: '',
      args: [],
    );
  }

  /// `Capture ID`
  String get captureIdCard {
    return Intl.message(
      'Capture ID',
      name: 'captureIdCard',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message('Name', name: 'nameLabel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `QR Scan Complete!\nPlease press Connect below`
  String get qrScanComplete {
    return Intl.message(
      'QR Scan Complete!\nPlease press Connect below',
      name: 'qrScanComplete',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get scanQrCode {
    return Intl.message('Scan QR Code', name: 'scanQrCode', desc: '', args: []);
  }

  /// `Scan a QR code or upload an image.`
  String get qrScanOrUpload {
    return Intl.message(
      'Scan a QR code or upload an image.',
      name: 'qrScanOrUpload',
      desc: '',
      args: [],
    );
  }

  /// `Request verification from\nfamily, relatives, or friends\n(Mutual Authentication)`
  String get requestVerificationGuide {
    return Intl.message(
      'Request verification from\nfamily, relatives, or friends\n(Mutual Authentication)',
      name: 'requestVerificationGuide',
      desc: '',
      args: [],
    );
  }

  /// `Please copy the ID link to submit`
  String get copyIdLink {
    return Intl.message(
      'Please copy the ID link to submit',
      name: 'copyIdLink',
      desc: '',
      args: [],
    );
  }

  /// `Verification Points`
  String get verificationPoint {
    return Intl.message(
      'Verification Points',
      name: 'verificationPoint',
      desc: '',
      args: [],
    );
  }

  /// `Mutual Authentication`
  String get mutualAuthentication {
    return Intl.message(
      'Mutual Authentication',
      name: 'mutualAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the personal information\nrequired to create an ID`
  String get enterInfoForIdCreation {
    return Intl.message(
      'Please enter the personal information\nrequired to create an ID',
      name: 'enterInfoForIdCreation',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Issuing Authority`
  String get issuer {
    return Intl.message(
      'Issuing Authority',
      name: 'issuer',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get dateOfIssue {
    return Intl.message(
      'Date of Issue',
      name: 'dateOfIssue',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `ID verification\ncompleted`
  String get idVerificationCompleted {
    return Intl.message(
      'ID verification\ncompleted',
      name: 'idVerificationCompleted',
      desc: '',
      args: [],
    );
  }

  /// `How would you like to\ncreate your Self ID?`
  String get howToCreateSelfId {
    return Intl.message(
      'How would you like to\ncreate your Self ID?',
      name: 'howToCreateSelfId',
      desc: '',
      args: [],
    );
  }

  /// `Mobile ID, ID Card, Driver's License`
  String get idCardTypes {
    return Intl.message(
      'Mobile ID, ID Card, Driver\'s License',
      name: 'idCardTypes',
      desc: '',
      args: [],
    );
  }

  /// `Manual Input`
  String get manualInput {
    return Intl.message(
      'Manual Input',
      name: 'manualInput',
      desc: '',
      args: [],
    );
  }

  /// `Owned ID List`
  String get ownedIdList {
    return Intl.message(
      'Owned ID List',
      name: 'ownedIdList',
      desc: '',
      args: [],
    );
  }

  /// `Please select the ID to submit`
  String get selectIdToSubmit {
    return Intl.message(
      'Please select the ID to submit',
      name: 'selectIdToSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message('Enter', name: 'enter', desc: '', args: []);
  }

  /// `Relationship`
  String get relationship {
    return Intl.message(
      'Relationship',
      name: 'relationship',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate names found. Please select a number.`
  String get duplicateNameSelectNumber {
    return Intl.message(
      'Duplicate names found. Please select a number.',
      name: 'duplicateNameSelectNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name and\nset the 'Relationship'`
  String get enterNameAndRelationship {
    return Intl.message(
      'Please enter the name and\nset the \'Relationship\'',
      name: 'enterNameAndRelationship',
      desc: '',
      args: [],
    );
  }

  /// `Send Text`
  String get sendTextMessage {
    return Intl.message(
      'Send Text',
      name: 'sendTextMessage',
      desc: '',
      args: [],
    );
  }

  /// `Copy Verification Link`
  String get copyVerificationLink {
    return Intl.message(
      'Copy Verification Link',
      name: 'copyVerificationLink',
      desc: '',
      args: [],
    );
  }

  /// `Person to verify me`
  String get verifierForMe {
    return Intl.message(
      'Person to verify me',
      name: 'verifierForMe',
      desc: '',
      args: [],
    );
  }

  /// `Person I will verify`
  String get personToVerify {
    return Intl.message(
      'Person I will verify',
      name: 'personToVerify',
      desc: '',
      args: [],
    );
  }

  /// `ID verification\ncompleted`
  String get idCheckCompleted {
    return Intl.message(
      'ID verification\ncompleted',
      name: 'idCheckCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Mutual authentication\nhas been completed`
  String get verifyFinish {
    return Intl.message(
      'Mutual authentication\nhas been completed',
      name: 'verifyFinish',
      desc: '',
      args: [],
    );
  }

  /// `Check-in\nconfirmed`
  String get checkInConfirmed {
    return Intl.message(
      'Check-in\nconfirmed',
      name: 'checkInConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Check-out\nconfirmed`
  String get checkOutConfirmed {
    return Intl.message(
      'Check-out\nconfirmed',
      name: 'checkOutConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Block Hash`
  String get blockHash {
    return Intl.message('Block Hash', name: 'blockHash', desc: '', args: []);
  }

  /// `Create Self ID`
  String get createSelfIdTitle {
    return Intl.message(
      'Create Self ID',
      name: 'createSelfIdTitle',
      desc: '',
      args: [],
    );
  }

  /// `New to Chon?\nCreate one right now`
  String get firstTimeChon {
    return Intl.message(
      'New to Chon?\nCreate one right now',
      name: 'firstTimeChon',
      desc: '',
      args: [],
    );
  }

  /// `Mutual Auth`
  String get mutualAuthTitle {
    return Intl.message(
      'Mutual Auth',
      name: 'mutualAuthTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify identity with\nfamily and friends`
  String get mutualAuthDesc {
    return Intl.message(
      'Verify identity with\nfamily and friends',
      name: 'mutualAuthDesc',
      desc: '',
      args: [],
    );
  }

  /// `Input Information`
  String get inputInfoTitle {
    return Intl.message(
      'Input Information',
      name: 'inputInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contactAction {
    return Intl.message('Contact', name: 'contactAction', desc: '', args: []);
  }

  /// `QR Check-in/Check-out`
  String get qrCheckInOut {
    return Intl.message(
      'QR Check-in/Check-out',
      name: 'qrCheckInOut',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menuTitle {
    return Intl.message('Menu', name: 'menuTitle', desc: '', args: []);
  }

  /// `Language`
  String get languageOption {
    return Intl.message('Language', name: 'languageOption', desc: '', args: []);
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Report a Problem`
  String get reportProblem {
    return Intl.message(
      'Report a Problem',
      name: 'reportProblem',
      desc: '',
      args: [],
    );
  }

  /// `Bank Information`
  String get bankInfo {
    return Intl.message(
      'Bank Information',
      name: 'bankInfo',
      desc: '',
      args: [],
    );
  }

  /// `Grandfather`
  String get grandfather {
    return Intl.message('Grandfather', name: 'grandfather', desc: '', args: []);
  }

  /// `Grandmother`
  String get grandmother {
    return Intl.message('Grandmother', name: 'grandmother', desc: '', args: []);
  }

  /// `Maternal grandfather`
  String get maternalGrandfather {
    return Intl.message(
      'Maternal grandfather',
      name: 'maternalGrandfather',
      desc: '',
      args: [],
    );
  }

  /// `Maternal grandmother`
  String get maternalGrandmother {
    return Intl.message(
      'Maternal grandmother',
      name: 'maternalGrandmother',
      desc: '',
      args: [],
    );
  }

  /// `Father`
  String get father {
    return Intl.message('Father', name: 'father', desc: '', args: []);
  }

  /// `Mother`
  String get mother {
    return Intl.message('Mother', name: 'mother', desc: '', args: []);
  }

  /// `Uncle`
  String get uncle_father_older {
    return Intl.message(
      'Uncle',
      name: 'uncle_father_older',
      desc: '',
      args: [],
    );
  }

  /// `Aunt`
  String get aunt_father_sister {
    return Intl.message('Aunt', name: 'aunt_father_sister', desc: '', args: []);
  }

  /// `Aunt`
  String get aunt_uncle_wife {
    return Intl.message('Aunt', name: 'aunt_uncle_wife', desc: '', args: []);
  }

  /// `Uncle`
  String get uncle_aunt_husband {
    return Intl.message(
      'Uncle',
      name: 'uncle_aunt_husband',
      desc: '',
      args: [],
    );
  }

  /// `Cousin`
  String get cousin {
    return Intl.message('Cousin', name: 'cousin', desc: '', args: []);
  }

  /// `Cousin`
  String get cousin_sister {
    return Intl.message('Cousin', name: 'cousin_sister', desc: '', args: []);
  }

  /// `Cousin`
  String get cousin_brother {
    return Intl.message('Cousin', name: 'cousin_brother', desc: '', args: []);
  }

  /// `Cousin’s wife`
  String get cousin_sister_in_law {
    return Intl.message(
      'Cousin’s wife',
      name: 'cousin_sister_in_law',
      desc: '',
      args: [],
    );
  }

  /// `Cousin’s husband`
  String get cousin_brother_in_law {
    return Intl.message(
      'Cousin’s husband',
      name: 'cousin_brother_in_law',
      desc: '',
      args: [],
    );
  }

  /// `Cousin’s child`
  String get cousins_child {
    return Intl.message(
      'Cousin’s child',
      name: 'cousins_child',
      desc: '',
      args: [],
    );
  }

  /// `Cousin’s grand`
  String get cousins_childs_child {
    return Intl.message(
      'Cousin’s grand',
      name: 'cousins_childs_child',
      desc: '',
      args: [],
    );
  }

  /// `Niece / Nephew`
  String get niece_nephew {
    return Intl.message(
      'Niece / Nephew',
      name: 'niece_nephew',
      desc: '',
      args: [],
    );
  }

  /// `Nephew`
  String get nephew {
    return Intl.message('Nephew', name: 'nephew', desc: '', args: []);
  }

  /// `Niece`
  String get niece {
    return Intl.message('Niece', name: 'niece', desc: '', args: []);
  }

  /// `Other grand`
  String get other_grand {
    return Intl.message('Other grand', name: 'other_grand', desc: '', args: []);
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Son`
  String get son {
    return Intl.message('Son', name: 'son', desc: '', args: []);
  }

  /// `Daughter`
  String get daughter {
    return Intl.message('Daughter', name: 'daughter', desc: '', args: []);
  }

  /// `Brother and sister`
  String get siblings_brother_sister {
    return Intl.message(
      'Brother and sister',
      name: 'siblings_brother_sister',
      desc: '',
      args: [],
    );
  }

  /// `Brother`
  String get brother {
    return Intl.message('Brother', name: 'brother', desc: '', args: []);
  }

  /// `Sister`
  String get sister {
    return Intl.message('Sister', name: 'sister', desc: '', args: []);
  }

  /// `Sister in law`
  String get sister_in_law {
    return Intl.message(
      'Sister in law',
      name: 'sister_in_law',
      desc: '',
      args: [],
    );
  }

  /// `Brother in law`
  String get brother_in_law {
    return Intl.message(
      'Brother in law',
      name: 'brother_in_law',
      desc: '',
      args: [],
    );
  }

  /// `Sibling’s child`
  String get siblings_child {
    return Intl.message(
      'Sibling’s child',
      name: 'siblings_child',
      desc: '',
      args: [],
    );
  }

  /// `Great grandchild`
  String get siblings_grand_child {
    return Intl.message(
      'Great grandchild',
      name: 'siblings_grand_child',
      desc: '',
      args: [],
    );
  }

  /// `Husband`
  String get husband {
    return Intl.message('Husband', name: 'husband', desc: '', args: []);
  }

  /// `Wife`
  String get wife {
    return Intl.message('Wife', name: 'wife', desc: '', args: []);
  }

  /// `Oneself`
  String get self {
    return Intl.message('Oneself', name: 'self', desc: '', args: []);
  }

  /// `Spouse`
  String get spouse {
    return Intl.message('Spouse', name: 'spouse', desc: '', args: []);
  }

  /// `Brother`
  String get brother2 {
    return Intl.message('Brother', name: 'brother2', desc: '', args: []);
  }

  /// `Sister`
  String get sister2 {
    return Intl.message('Sister', name: 'sister2', desc: '', args: []);
  }

  /// `Son`
  String get son2 {
    return Intl.message('Son', name: 'son2', desc: '', args: []);
  }

  /// `Daughter`
  String get daughter2 {
    return Intl.message('Daughter', name: 'daughter2', desc: '', args: []);
  }

  /// `relatives`
  String get relatives {
    return Intl.message('relatives', name: 'relatives', desc: '', args: []);
  }

  /// `Daughter in law`
  String get daughterInLaw {
    return Intl.message(
      'Daughter in law',
      name: 'daughterInLaw',
      desc: '',
      args: [],
    );
  }

  /// `Son in law`
  String get sonInLaw {
    return Intl.message('Son in law', name: 'sonInLaw', desc: '', args: []);
  }

  /// `Niece in law`
  String get nieceInLaw {
    return Intl.message('Niece in law', name: 'nieceInLaw', desc: '', args: []);
  }

  /// `Nephew in law`
  String get nephewInLaw {
    return Intl.message(
      'Nephew in law',
      name: 'nephewInLaw',
      desc: '',
      args: [],
    );
  }

  /// `Family Tree`
  String get familyTree {
    return Intl.message('Family Tree', name: 'familyTree', desc: '', args: []);
  }

  /// `Please select a family relationship`
  String get selectFamilyRelationship {
    return Intl.message(
      'Please select a family relationship',
      name: 'selectFamilyRelationship',
      desc: '',
      args: [],
    );
  }

  /// `Tap a family icon and press the "Add/Delete" button to edit.`
  String get familyEditInstruction {
    return Intl.message(
      'Tap a family icon and press the "Add/Delete" button to edit.',
      name: 'familyEditInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message('Select', name: 'select', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Group Call`
  String get groupCall {
    return Intl.message('Group Call', name: 'groupCall', desc: '', args: []);
  }

  /// `Group Chat`
  String get groupChat {
    return Intl.message('Group Chat', name: 'groupChat', desc: '', args: []);
  }

  /// `Album`
  String get album {
    return Intl.message('Album', name: 'album', desc: '', args: []);
  }

  /// `Do you want to delete?`
  String get confirmDelete {
    return Intl.message(
      'Do you want to delete?',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `All fields are `
  String get requiredFieldsNoticePrefix {
    return Intl.message(
      'All fields are ',
      name: 'requiredFieldsNoticePrefix',
      desc: '',
      args: [],
    );
  }

  /// `required`
  String get requiredFieldsNoticeHighlight {
    return Intl.message(
      'required',
      name: 'requiredFieldsNoticeHighlight',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get requiredFieldsNoticeSuffix {
    return Intl.message(
      '',
      name: 'requiredFieldsNoticeSuffix',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Family Certificate`
  String get familyCertificate {
    return Intl.message(
      'Family Certificate',
      name: 'familyCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Camera access required`
  String get cameraPermissionRequired {
    return Intl.message(
      'Camera access required',
      name: 'cameraPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Camera not initialized`
  String get cameraNotInitialized {
    return Intl.message(
      'Camera not initialized',
      name: 'cameraNotInitialized',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get systemDefault {
    return Intl.message(
      'System Default',
      name: 'systemDefault',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Copied to clipboard`
  String get copied {
    return Intl.message(
      'Copied to clipboard',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required fields`
  String get fillAllRequiredFields {
    return Intl.message(
      'Please fill in all required fields',
      name: 'fillAllRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Please select a portrait photo`
  String get selectPortraitPhoto {
    return Intl.message(
      'Please select a portrait photo',
      name: 'selectPortraitPhoto',
      desc: '',
      args: [],
    );
  }

  /// `First part of ID must be 6 digits (YYMMDD)`
  String get residentNumberFirstPartInvalid {
    return Intl.message(
      'First part of ID must be 6 digits (YYMMDD)',
      name: 'residentNumberFirstPartInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Last part of ID must be 7 digits`
  String get residentNumberSecondPartInvalid {
    return Intl.message(
      'Last part of ID must be 7 digits',
      name: 'residentNumberSecondPartInvalid',
      desc: '',
      args: [],
    );
  }

  /// `No cards available`
  String get noCardsFound {
    return Intl.message(
      'No cards available',
      name: 'noCardsFound',
      desc: '',
      args: [],
    );
  }

  /// `Cannot update`
  String get updateFailed {
    return Intl.message(
      'Cannot update',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `{name}, `
  String ownerName(Object name) {
    return Intl.message('$name, ', name: 'ownerName', desc: '', args: [name]);
  }

  /// ` is {relation}.\nPlease confirm.`
  String confirmRelationSuffix(Object relation) {
    return Intl.message(
      ' is $relation.\nPlease confirm.',
      name: 'confirmRelationSuffix',
      desc: '',
      args: [relation],
    );
  }

  /// `Chon Terms of Service`
  String get termsMainTitle {
    return Intl.message(
      'Chon Terms of Service',
      name: 'termsMainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scroll Down`
  String get termsScrollDown {
    return Intl.message(
      'Scroll Down',
      name: 'termsScrollDown',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get termsConfirm {
    return Intl.message('Confirm', name: 'termsConfirm', desc: '', args: []);
  }

  /// `(Required) Consent to Collection and Use of Personal Information`
  String get termsCheckboxPrivacyRequired {
    return Intl.message(
      '(Required) Consent to Collection and Use of Personal Information',
      name: 'termsCheckboxPrivacyRequired',
      desc: '',
      args: [],
    );
  }

  /// `(Required) Consent to Third-Party Provision (Mutual Auth/Family Tree)`
  String get termsCheckboxThirdPartyRequired {
    return Intl.message(
      '(Required) Consent to Third-Party Provision (Mutual Auth/Family Tree)',
      name: 'termsCheckboxThirdPartyRequired',
      desc: '',
      args: [],
    );
  }

  /// `(Optional) Consent to Receive Marketing Info (Email/SMS/Push)`
  String get termsCheckboxMarketingOptional {
    return Intl.message(
      '(Optional) Consent to Receive Marketing Info (Email/SMS/Push)',
      name: 'termsCheckboxMarketingOptional',
      desc: '',
      args: [],
    );
  }

  /// `Chon Personal Information Collection & Use Consent`
  String get termsPrivacyConsentTitle {
    return Intl.message(
      'Chon Personal Information Collection & Use Consent',
      name: 'termsPrivacyConsentTitle',
      desc: '',
      args: [],
    );
  }

  /// `1) Purpose of Collection & Use`
  String get termsPurposeTitle {
    return Intl.message(
      '1) Purpose of Collection & Use',
      name: 'termsPurposeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chon Inc. (hereinafter referred to as the "Company") collects and uses personal information for the following purposes:\n• Member registration and account management (identification, verification, login, prevention of fraud)\n• Mutual authentication and relationship connection (family/friends/organizations), creation/display/management of family trees\n• Service operation, security, quality improvement\n• Customer support and inquiry handling`
  String get termsPurposeContent {
    return Intl.message(
      'Chon Inc. (hereinafter referred to as the "Company") collects and uses personal information for the following purposes:\n• Member registration and account management (identification, verification, login, prevention of fraud)\n• Mutual authentication and relationship connection (family/friends/organizations), creation/display/management of family trees\n• Service operation, security, quality improvement\n• Customer support and inquiry handling',
      name: 'termsPurposeContent',
      desc: '',
      args: [],
    );
  }

  /// `2) Items Collected`
  String get termsItemsTitle {
    return Intl.message(
      '2) Items Collected',
      name: 'termsItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Company collects the following items:\n(A) Required for Account:\n• Email or Phone number\n• Password (encrypted) or auth tokens\n• Display name (Name/Nickname)\n• Internal UID\n(B) For Mutual Auth/Family Tree:\n• Relationship info entered by user\n• Auth info (invitation codes, tokens)\n• Public profile info (Photo, Bio)\n(C) Auto-generated:\n• Logs, IP address, Device info, Cookies`
  String get termsItemsContent {
    return Intl.message(
      'The Company collects the following items:\n(A) Required for Account:\n• Email or Phone number\n• Password (encrypted) or auth tokens\n• Display name (Name/Nickname)\n• Internal UID\n(B) For Mutual Auth/Family Tree:\n• Relationship info entered by user\n• Auth info (invitation codes, tokens)\n• Public profile info (Photo, Bio)\n(C) Auto-generated:\n• Logs, IP address, Device info, Cookies',
      name: 'termsItemsContent',
      desc: '',
      args: [],
    );
  }

  /// `3) Retention & Use Period`
  String get termsRetentionTitle {
    return Intl.message(
      '3) Retention & Use Period',
      name: 'termsRetentionTitle',
      desc: '',
      args: [],
    );
  }

  /// `In principle, personal information is retained until membership withdrawal. Exceptions apply where required by law or for dispute resolution.`
  String get termsRetentionContent {
    return Intl.message(
      'In principle, personal information is retained until membership withdrawal. Exceptions apply where required by law or for dispute resolution.',
      name: 'termsRetentionContent',
      desc: '',
      args: [],
    );
  }

  /// `Addendum`
  String get termsAddendumTitle {
    return Intl.message(
      'Addendum',
      name: 'termsAddendumTitle',
      desc: '',
      args: [],
    );
  }

  /// `1. These terms are effective from [2026.02.01].\n2. Applies to existing members prior to this date.`
  String get termsAddendumContent {
    return Intl.message(
      '1. These terms are effective from [2026.02.01].\n2. Applies to existing members prior to this date.',
      name: 'termsAddendumContent',
      desc: '',
      args: [],
    );
  }

  /// `4) Right to Refuse & Disadvantages`
  String get termsRefusalTitle {
    return Intl.message(
      '4) Right to Refuse & Disadvantages',
      name: 'termsRefusalTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have the right to refuse consent. However, refusal of mandatory items may restrict service usage (Registration, Mutual Auth, etc.).`
  String get termsRefusalContent {
    return Intl.message(
      'You have the right to refuse consent. However, refusal of mandatory items may restrict service usage (Registration, Mutual Auth, etc.).',
      name: 'termsRefusalContent',
      desc: '',
      args: [],
    );
  }

  /// `5) Optional Consent (Marketing)`
  String get termsMarketingInfoTitle {
    return Intl.message(
      '5) Optional Consent (Marketing)',
      name: 'termsMarketingInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Even if you do not agree to marketing consent, you can still use the basic service.\nEffective Date: 2026.02.01\nCompany: Chon Inc.\n• CEO: Geun-young Shin\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul`
  String get termsMarketingInfoContent {
    return Intl.message(
      'Even if you do not agree to marketing consent, you can still use the basic service.\nEffective Date: 2026.02.01\nCompany: Chon Inc.\n• CEO: Geun-young Shin\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul',
      name: 'termsMarketingInfoContent',
      desc: '',
      args: [],
    );
  }

  /// `Chon Third-Party Provision Consent`
  String get termsThirdPartyTitle {
    return Intl.message(
      'Chon Third-Party Provision Consent',
      name: 'termsThirdPartyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chon Inc. provides personal information to third parties (including other members) as follows:`
  String get termsThirdPartyContent {
    return Intl.message(
      'Chon Inc. provides personal information to third parties (including other members) as follows:',
      name: 'termsThirdPartyContent',
      desc: '',
      args: [],
    );
  }

  /// `1) Recipient`
  String get termsRecipientTitle {
    return Intl.message(
      '1) Recipient',
      name: 'termsRecipientTitle',
      desc: '',
      args: [],
    );
  }

  /// `• Other members with whom mutual authentication is established\n• Members designated for family tree sharing`
  String get termsRecipientContent {
    return Intl.message(
      '• Other members with whom mutual authentication is established\n• Members designated for family tree sharing',
      name: 'termsRecipientContent',
      desc: '',
      args: [],
    );
  }

  /// `2) Purpose of Provision`
  String get termsProvisionPurposeTitle {
    return Intl.message(
      '2) Purpose of Provision',
      name: 'termsProvisionPurposeTitle',
      desc: '',
      args: [],
    );
  }

  /// `• Performing mutual authentication\n• Connecting relationships\n• Displaying family trees`
  String get termsProvisionPurposeContent {
    return Intl.message(
      '• Performing mutual authentication\n• Connecting relationships\n• Displaying family trees',
      name: 'termsProvisionPurposeContent',
      desc: '',
      args: [],
    );
  }

  /// `3) Items Provided`
  String get termsProvisionItemsTitle {
    return Intl.message(
      '3) Items Provided',
      name: 'termsProvisionItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Only information set to public/shared by the member:\n• Display Name\n• Public Profile Info\n• Relationship Data\n• Family Tree Nodes\n* Contact info (Phone/Email) is not provided unless explicitly shared.`
  String get termsProvisionItemsContent {
    return Intl.message(
      'Only information set to public/shared by the member:\n• Display Name\n• Public Profile Info\n• Relationship Data\n• Family Tree Nodes\n* Contact info (Phone/Email) is not provided unless explicitly shared.',
      name: 'termsProvisionItemsContent',
      desc: '',
      args: [],
    );
  }

  /// `4) Recipient's Retention Period`
  String get termsRecipientRetentionTitle {
    return Intl.message(
      '4) Recipient\'s Retention Period',
      name: 'termsRecipientRetentionTitle',
      desc: '',
      args: [],
    );
  }

  /// `• Provided while the relationship or sharing setting is maintained.\n• If the relationship is deleted, exposure stops.`
  String get termsRecipientRetentionContent {
    return Intl.message(
      '• Provided while the relationship or sharing setting is maintained.\n• If the relationship is deleted, exposure stops.',
      name: 'termsRecipientRetentionContent',
      desc: '',
      args: [],
    );
  }

  /// `5) Right to Refuse (Third Party)`
  String get termsThirdPartyRefusalTitle {
    return Intl.message(
      '5) Right to Refuse (Third Party)',
      name: 'termsThirdPartyRefusalTitle',
      desc: '',
      args: [],
    );
  }

  /// `You may refuse third-party provision. However, this is necessary for mutual authentication and family tree features, so refusal may restrict these functions.`
  String get termsThirdPartyRefusalContent {
    return Intl.message(
      'You may refuse third-party provision. However, this is necessary for mutual authentication and family tree features, so refusal may restrict these functions.',
      name: 'termsThirdPartyRefusalContent',
      desc: '',
      args: [],
    );
  }

  /// `[Optional] Marketing Consent Details`
  String get termsMarketingConsentDetailTitle {
    return Intl.message(
      '[Optional] Marketing Consent Details',
      name: 'termsMarketingConsentDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Service is available without this consent.\n• Purpose: Events, Promotions, New Features\n• Items: Email, Phone, Push Token\n• Retention: Until withdrawal`
  String get termsMarketingConsentDetailContent {
    return Intl.message(
      'Service is available without this consent.\n• Purpose: Events, Promotions, New Features\n• Items: Email, Phone, Push Token\n• Retention: Until withdrawal',
      name: 'termsMarketingConsentDetailContent',
      desc: '',
      args: [],
    );
  }

  /// `Chon Terms of Service`
  String get serviceTermsTitle {
    return Intl.message(
      'Chon Terms of Service',
      name: 'serviceTermsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chon Service Terms of Use`
  String get serviceTermsHeaderTitle {
    return Intl.message(
      'Chon Service Terms of Use',
      name: 'serviceTermsHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date: Feb 01, 2026\nVersion: v1.0\nCompany: Chon Inc. (“Company”)\nService: Chon (“Service”)`
  String get serviceTermsHeaderContent {
    return Intl.message(
      'Effective Date: Feb 01, 2026\nVersion: v1.0\nCompany: Chon Inc. (“Company”)\nService: Chon (“Service”)',
      name: 'serviceTermsHeaderContent',
      desc: '',
      args: [],
    );
  }

  /// `Article 1 (Purpose)`
  String get serviceTermsArt1Title {
    return Intl.message(
      'Article 1 (Purpose)',
      name: 'serviceTermsArt1Title',
      desc: '',
      args: [],
    );
  }

  /// `The purpose of these Terms is to stipulate the rights, obligations, responsibilities, conditions, and procedures of use between the Company and the User (including Members) regarding the use of the Chon Service provided by the Company.`
  String get serviceTermsArt1Content {
    return Intl.message(
      'The purpose of these Terms is to stipulate the rights, obligations, responsibilities, conditions, and procedures of use between the Company and the User (including Members) regarding the use of the Chon Service provided by the Company.',
      name: 'serviceTermsArt1Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 2 (Definitions)`
  String get serviceTermsArt2Title {
    return Intl.message(
      'Article 2 (Definitions)',
      name: 'serviceTermsArt2Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Service: Refers to the Chon app/web and related services provided by the Company.\n2. User: Refers to a person who accesses the Service and uses it in accordance with these Terms.\n3. Member: Refers to a person who agrees to these Terms, creates an account, and uses the Service.\n4. Account: Refers to the login means (email/phone/social login, etc.) and accompanying information established by the Member for identification and Service use.\n5. Content: Refers to text, images, documents (including PDF), links, data (including family trees/relationship maps/profiles), and other information posted, registered, uploaded, or transmitted by the Member within the Service.\n6. Mutual Authentication: Refers to the authentication procedure or function provided by the Service to verify and connect specific relationships (family/friends/organizations, etc.) between Members.\n7. Paid Service: Refers to subscriptions, passes, add-on features, etc., provided by the Company for a fee (if applicable).`
  String get serviceTermsArt2Content {
    return Intl.message(
      '1. Service: Refers to the Chon app/web and related services provided by the Company.\n2. User: Refers to a person who accesses the Service and uses it in accordance with these Terms.\n3. Member: Refers to a person who agrees to these Terms, creates an account, and uses the Service.\n4. Account: Refers to the login means (email/phone/social login, etc.) and accompanying information established by the Member for identification and Service use.\n5. Content: Refers to text, images, documents (including PDF), links, data (including family trees/relationship maps/profiles), and other information posted, registered, uploaded, or transmitted by the Member within the Service.\n6. Mutual Authentication: Refers to the authentication procedure or function provided by the Service to verify and connect specific relationships (family/friends/organizations, etc.) between Members.\n7. Paid Service: Refers to subscriptions, passes, add-on features, etc., provided by the Company for a fee (if applicable).',
      name: 'serviceTermsArt2Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 3 (Effectiveness and Application)`
  String get serviceTermsArt3Title {
    return Intl.message(
      'Article 3 (Effectiveness and Application)',
      name: 'serviceTermsArt3Title',
      desc: '',
      args: [],
    );
  }

  /// `1. These Terms become effective upon being posted on the Service screen (initial screen or linked screen) or notified by other means and agreed to by the Member.\n2. The Company may amend these Terms to the extent not violating relevant laws.\n3. Matters not stipulated in these Terms shall be governed by relevant laws, operation policies/guides separately set by the Company, and general commercial practices.`
  String get serviceTermsArt3Content {
    return Intl.message(
      '1. These Terms become effective upon being posted on the Service screen (initial screen or linked screen) or notified by other means and agreed to by the Member.\n2. The Company may amend these Terms to the extent not violating relevant laws.\n3. Matters not stipulated in these Terms shall be governed by relevant laws, operation policies/guides separately set by the Company, and general commercial practices.',
      name: 'serviceTermsArt3Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 4 (Amendment and Notice)`
  String get serviceTermsArt4Title {
    return Intl.message(
      'Article 4 (Amendment and Notice)',
      name: 'serviceTermsArt4Title',
      desc: '',
      args: [],
    );
  }

  /// `1. If the Company amends the Terms, it will notify the effective date, details of amendment, and reasons within the Service.\n2. In case of significant changes or changes unfavorable to Users, the Company will notify in advance with a reasonable period (e.g., at least 30 days) and provide individual notice if necessary.\n3. Members who do not agree to the amended Terms may terminate the service contract (withdraw membership) before the amended Terms take effect.`
  String get serviceTermsArt4Content {
    return Intl.message(
      '1. If the Company amends the Terms, it will notify the effective date, details of amendment, and reasons within the Service.\n2. In case of significant changes or changes unfavorable to Users, the Company will notify in advance with a reasonable period (e.g., at least 30 days) and provide individual notice if necessary.\n3. Members who do not agree to the amended Terms may terminate the service contract (withdraw membership) before the amended Terms take effect.',
      name: 'serviceTermsArt4Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 5 (Registration and Account Management)`
  String get serviceTermsArt5Title {
    return Intl.message(
      'Article 5 (Registration and Account Management)',
      name: 'serviceTermsArt5Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Membership registration is established when the User agrees to the Terms and completes the procedures set by the Company (account creation, identity verification, etc.).\n2. Members must maintain their account information up to date, and the Member is responsible for any disadvantages caused by providing false information or using another person's information.\n3. Members are responsible for managing their account/password (or authentication means) and must notify the Company immediately if third-party use is suspected.`
  String get serviceTermsArt5Content {
    return Intl.message(
      '1. Membership registration is established when the User agrees to the Terms and completes the procedures set by the Company (account creation, identity verification, etc.).\n2. Members must maintain their account information up to date, and the Member is responsible for any disadvantages caused by providing false information or using another person\'s information.\n3. Members are responsible for managing their account/password (or authentication means) and must notify the Company immediately if third-party use is suspected.',
      name: 'serviceTermsArt5Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 6 (Use by Minors)`
  String get serviceTermsArt6Title {
    return Intl.message(
      'Article 6 (Use by Minors)',
      name: 'serviceTermsArt6Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Registration and personal information procedures for children under 14 follow relevant laws, such as legal representative consent (registration may be restricted according to Service policy).\n2. The Company may request age verification or legal representative consent if necessary.`
  String get serviceTermsArt6Content {
    return Intl.message(
      '1. Registration and personal information procedures for children under 14 follow relevant laws, such as legal representative consent (registration may be restricted according to Service policy).\n2. The Company may request age verification or legal representative consent if necessary.',
      name: 'serviceTermsArt6Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 7 (Service Provision and Change)`
  String get serviceTermsArt7Title {
    return Intl.message(
      'Article 7 (Service Provision and Change)',
      name: 'serviceTermsArt7Title',
      desc: '',
      args: [],
    );
  }

  /// `1. The Company may provide the following services:\na. Relationship connection and management based on mutual authentication\nb. Creation, viewing, and sharing of family trees/relationship maps\nc. Profile/ID (identity/connection) configuration and display\nd. Document/image upload and organization (including PDF)\ne. AI-based search/summary/Q&A add-on features (if applicable)\n2. The Company may change or suspend all or part of the Service and will notify in advance in case of significant changes or suspension.\n3. The Company may conduct maintenance for operational/technical needs, and maintenance times will be announced on the Service screen.`
  String get serviceTermsArt7Content {
    return Intl.message(
      '1. The Company may provide the following services:\na. Relationship connection and management based on mutual authentication\nb. Creation, viewing, and sharing of family trees/relationship maps\nc. Profile/ID (identity/connection) configuration and display\nd. Document/image upload and organization (including PDF)\ne. AI-based search/summary/Q&A add-on features (if applicable)\n2. The Company may change or suspend all or part of the Service and will notify in advance in case of significant changes or suspension.\n3. The Company may conduct maintenance for operational/technical needs, and maintenance times will be announced on the Service screen.',
      name: 'serviceTermsArt7Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 8 (Special Rules on Mutual Auth and Relationship Data)`
  String get serviceTermsArt8Title {
    return Intl.message(
      'Article 8 (Special Rules on Mutual Auth and Relationship Data)',
      name: 'serviceTermsArt8Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Mutual Authentication is a feature to help verify relationships between Members, and the Company does not guarantee the legal effect or truthfulness of actual relationships between Members.\n2. Members must not input or post sensitive information about others (e.g., resident registration numbers) without their consent.\n3. Relationship Data (family trees) is created by Member input and interaction, and disputes arising therefrom shall in principle be resolved between the parties. The Company has no obligation to intervene unless liability is recognized by law.`
  String get serviceTermsArt8Content {
    return Intl.message(
      '1. Mutual Authentication is a feature to help verify relationships between Members, and the Company does not guarantee the legal effect or truthfulness of actual relationships between Members.\n2. Members must not input or post sensitive information about others (e.g., resident registration numbers) without their consent.\n3. Relationship Data (family trees) is created by Member input and interaction, and disputes arising therefrom shall in principle be resolved between the parties. The Company has no obligation to intervene unless liability is recognized by law.',
      name: 'serviceTermsArt8Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 9 (Rights to Content and License)`
  String get serviceTermsArt9Title {
    return Intl.message(
      'Article 9 (Rights to Content and License)',
      name: 'serviceTermsArt9Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Rights to Content belong in principle to the Member who created/registered it.\n2. Members grant the Company a non-exclusive license to store, copy, transmit, convert (e.g., format conversion/search indexing), and display such Content to the extent necessary to operate, provide, and improve the Service.\n3. Members warrant that they hold legitimate rights or have received permission for uploaded documents, images, text, etc.\n4. If the Company intends to use Content to improve AI features, etc., it will undergo separate notice/consent procedures required by law (if necessary).`
  String get serviceTermsArt9Content {
    return Intl.message(
      '1. Rights to Content belong in principle to the Member who created/registered it.\n2. Members grant the Company a non-exclusive license to store, copy, transmit, convert (e.g., format conversion/search indexing), and display such Content to the extent necessary to operate, provide, and improve the Service.\n3. Members warrant that they hold legitimate rights or have received permission for uploaded documents, images, text, etc.\n4. If the Company intends to use Content to improve AI features, etc., it will undergo separate notice/consent procedures required by law (if necessary).',
      name: 'serviceTermsArt9Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 10 (Prohibited Acts)`
  String get serviceTermsArt10Title {
    return Intl.message(
      'Article 10 (Prohibited Acts)',
      name: 'serviceTermsArt10Title',
      desc: '',
      args: [],
    );
  }

  /// `Users shall not engage in the following acts:\n1. Account theft, identity theft, impersonation\n2. Posting illegal information, copyright infringement, obscene/illegal filming content\n3. Causing overload to the Service or server or infringing security\n4. Unauthorized collection/scraping/crawling via automated means (except as permitted by the Company)\n5. Infringement of others' rights (portrait rights, personal information, reputation, etc.)\n6. Other acts violating laws or contrary to good morals and social order`
  String get serviceTermsArt10Content {
    return Intl.message(
      'Users shall not engage in the following acts:\n1. Account theft, identity theft, impersonation\n2. Posting illegal information, copyright infringement, obscene/illegal filming content\n3. Causing overload to the Service or server or infringing security\n4. Unauthorized collection/scraping/crawling via automated means (except as permitted by the Company)\n5. Infringement of others\' rights (portrait rights, personal information, reputation, etc.)\n6. Other acts violating laws or contrary to good morals and social order',
      name: 'serviceTermsArt10Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 11 (Restriction of Use and Termination)`
  String get serviceTermsArt11Title {
    return Intl.message(
      'Article 11 (Restriction of Use and Termination)',
      name: 'serviceTermsArt11Title',
      desc: '',
      args: [],
    );
  }

  /// `1. If a Member violates these Terms or operation policies, the Company may take measures such as warning, deletion/hiding of content, restriction of features, suspension of use, or permanent suspension (account termination) depending on the severity.\n2. Members may terminate the service contract (withdraw membership) at any time through the procedure within the Service.\n3. Even after restriction or termination, some information may be retained for a certain period according to relevant laws and Company retention policies; details follow the Privacy Policy.`
  String get serviceTermsArt11Content {
    return Intl.message(
      '1. If a Member violates these Terms or operation policies, the Company may take measures such as warning, deletion/hiding of content, restriction of features, suspension of use, or permanent suspension (account termination) depending on the severity.\n2. Members may terminate the service contract (withdraw membership) at any time through the procedure within the Service.\n3. Even after restriction or termination, some information may be retained for a certain period according to relevant laws and Company retention policies; details follow the Privacy Policy.',
      name: 'serviceTermsArt11Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 12 (Paid Service and Payment)`
  String get serviceTermsArt12Title {
    return Intl.message(
      'Article 12 (Paid Service and Payment)',
      name: 'serviceTermsArt12Title',
      desc: '',
      args: [],
    );
  }

  /// `1. Details, fees, payment methods, provision period, refund standards, etc., of Paid Services follow separate guides (Service screen/payment page/refund policy).\n2. Automatic renewal, cancellation, and refund conditions for subscription services may be subject to both the payment method/store policy (e.g., App Store/Play Store) and Company policy.`
  String get serviceTermsArt12Content {
    return Intl.message(
      '1. Details, fees, payment methods, provision period, refund standards, etc., of Paid Services follow separate guides (Service screen/payment page/refund policy).\n2. Automatic renewal, cancellation, and refund conditions for subscription services may be subject to both the payment method/store policy (e.g., App Store/Play Store) and Company policy.',
      name: 'serviceTermsArt12Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 13 (Indemnification and Limitation of Liability)`
  String get serviceTermsArt13Title {
    return Intl.message(
      'Article 13 (Indemnification and Limitation of Liability)',
      name: 'serviceTermsArt13Title',
      desc: '',
      args: [],
    );
  }

  /// `1. The Company is not liable if it cannot provide the Service due to force majeure such as natural disasters, war, power outage, telecommunication failure, or third-party service failure.\n2. The Company is not liable for disputes between Users, accuracy of information entered by Users, reliability of mutual authentication results, or legality of Content, except where liability is recognized by law.\n3. If AI features are provided, AI output is for reference only (errors possible), and final judgment and responsibility rest with the User.`
  String get serviceTermsArt13Content {
    return Intl.message(
      '1. The Company is not liable if it cannot provide the Service due to force majeure such as natural disasters, war, power outage, telecommunication failure, or third-party service failure.\n2. The Company is not liable for disputes between Users, accuracy of information entered by Users, reliability of mutual authentication results, or legality of Content, except where liability is recognized by law.\n3. If AI features are provided, AI output is for reference only (errors possible), and final judgment and responsibility rest with the User.',
      name: 'serviceTermsArt13Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 14 (Notice)`
  String get serviceTermsArt14Title {
    return Intl.message(
      'Article 14 (Notice)',
      name: 'serviceTermsArt14Title',
      desc: '',
      args: [],
    );
  }

  /// `1. The Company may notify via reasonable means such as email/phone/app push/in-service notifications registered by the Member.\n2. If a Member fails to receive notice due to not maintaining up-to-date contact information, any disadvantage falls on the Member.`
  String get serviceTermsArt14Content {
    return Intl.message(
      '1. The Company may notify via reasonable means such as email/phone/app push/in-service notifications registered by the Member.\n2. If a Member fails to receive notice due to not maintaining up-to-date contact information, any disadvantage falls on the Member.',
      name: 'serviceTermsArt14Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 15 (Data Protection)`
  String get serviceTermsArt15Title {
    return Intl.message(
      'Article 15 (Data Protection)',
      name: 'serviceTermsArt15Title',
      desc: '',
      args: [],
    );
  }

  /// `Matters regarding the processing of personal information (collection, use, provision, entrustment, destruction, etc.) follow the Privacy Policy and related consent procedures. These Terms alone do not substitute for personal information consent.`
  String get serviceTermsArt15Content {
    return Intl.message(
      'Matters regarding the processing of personal information (collection, use, provision, entrustment, destruction, etc.) follow the Privacy Policy and related consent procedures. These Terms alone do not substitute for personal information consent.',
      name: 'serviceTermsArt15Content',
      desc: '',
      args: [],
    );
  }

  /// `Article 16 (Governing Law and Jurisdiction)`
  String get serviceTermsArt16Title {
    return Intl.message(
      'Article 16 (Governing Law and Jurisdiction)',
      name: 'serviceTermsArt16Title',
      desc: '',
      args: [],
    );
  }

  /// `1. These Terms shall be interpreted and applied in accordance with the laws of the Republic of Korea.\n2. In case of disputes regarding Service use, resolution through negotiation between parties is prioritized; if negotiation fails, the Seoul Central District Court shall be the exclusive competent court (or competent court under Civil Procedure Act).`
  String get serviceTermsArt16Content {
    return Intl.message(
      '1. These Terms shall be interpreted and applied in accordance with the laws of the Republic of Korea.\n2. In case of disputes regarding Service use, resolution through negotiation between parties is prioritized; if negotiation fails, the Seoul Central District Court shall be the exclusive competent court (or competent court under Civil Procedure Act).',
      name: 'serviceTermsArt16Content',
      desc: '',
      args: [],
    );
  }

  /// `Addendum`
  String get serviceTermsAddendumTitle {
    return Intl.message(
      'Addendum',
      name: 'serviceTermsAddendumTitle',
      desc: '',
      args: [],
    );
  }

  /// `1. These Terms are effective from [Feb 01, 2026].\n2. These Terms also apply to Members who joined before the effective date (except where restricted by law).`
  String get serviceTermsAddendumContent {
    return Intl.message(
      '1. These Terms are effective from [Feb 01, 2026].\n2. These Terms also apply to Members who joined before the effective date (except where restricted by law).',
      name: 'serviceTermsAddendumContent',
      desc: '',
      args: [],
    );
  }

  /// `Company Information`
  String get serviceTermsCompanyInfoTitle {
    return Intl.message(
      'Company Information',
      name: 'serviceTermsCompanyInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `• Name: Chon Inc.\n• CEO: Geun-young Shin\n• Reg. No.: 196-86-03544\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• CS: 010-3420-8691 / ops@chon.ai\n• CPO: Nam-yul Kim`
  String get serviceTermsCompanyInfoContent {
    return Intl.message(
      '• Name: Chon Inc.\n• CEO: Geun-young Shin\n• Reg. No.: 196-86-03544\n• Address: 309, 3F, 464 Gangnam-daero, Gangnam-gu, Seoul\n• CS: 010-3420-8691 / ops@chon.ai\n• CPO: Nam-yul Kim',
      name: 'serviceTermsCompanyInfoContent',
      desc: '',
      args: [],
    );
  }

  /// `(Required) Agree to Terms of Service`
  String get serviceTermsAgreeCheckbox {
    return Intl.message(
      '(Required) Agree to Terms of Service',
      name: 'serviceTermsAgreeCheckbox',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `Subject`
  String get subjectLabel {
    return Intl.message('Subject', name: 'subjectLabel', desc: '', args: []);
  }

  /// `Report Details`
  String get reportContentLabel {
    return Intl.message(
      'Report Details',
      name: 'reportContentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachmentLabel {
    return Intl.message(
      'Attachment',
      name: 'attachmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Files under 300MB only.`
  String get uploadSizeLimitWarning {
    return Intl.message(
      'Files under 300MB only.',
      name: 'uploadSizeLimitWarning',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendButton {
    return Intl.message('Send', name: 'sendButton', desc: '', args: []);
  }

  /// `Required`
  String get requiredField {
    return Intl.message('Required', name: 'requiredField', desc: '', args: []);
  }

  /// `Page not loading`
  String get errorPageNotLoading {
    return Intl.message(
      'Page not loading',
      name: 'errorPageNotLoading',
      desc: '',
      args: [],
    );
  }

  /// `Inquiry`
  String get inquiryTitle {
    return Intl.message('Inquiry', name: 'inquiryTitle', desc: '', args: []);
  }

  /// `Report a Problem`
  String get reportProblemTitle {
    return Intl.message(
      'Report a Problem',
      name: 'reportProblemTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Report History`
  String get myReportHistoryTitle {
    return Intl.message(
      'My Report History',
      name: 'myReportHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `The phone number doesn't match.`
  String get phoneNotMatch {
    return Intl.message(
      'The phone number doesn\'t match.',
      name: 'phoneNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Identity Card`
  String get identityCard {
    return Intl.message(
      'Identity Card',
      name: 'identityCard',
      desc: '',
      args: [],
    );
  }

  /// `Driver's License`
  String get driverLicense {
    return Intl.message(
      'Driver\'s License',
      name: 'driverLicense',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get passport {
    return Intl.message('Passport', name: 'passport', desc: '', args: []);
  }

  /// `Select card type`
  String get selectCardType {
    return Intl.message(
      'Select card type',
      name: 'selectCardType',
      desc: '',
      args: [],
    );
  }

  /// `Verification requests`
  String get verifyRequest {
    return Intl.message(
      'Verification requests',
      name: 'verifyRequest',
      desc: '',
      args: [],
    );
  }

  /// ` have been received. Please review them.`
  String get issueNumber {
    return Intl.message(
      ' have been received. Please review them.',
      name: 'issueNumber',
      desc: '',
      args: [],
    );
  }

  /// `You currently do not have an ID.`
  String get noCard {
    return Intl.message(
      'You currently do not have an ID.',
      name: 'noCard',
      desc: '',
      args: [],
    );
  }

  /// `Let's move on to the ID creation step.`
  String get redirectIdCreation {
    return Intl.message(
      'Let\'s move on to the ID creation step.',
      name: 'redirectIdCreation',
      desc: '',
      args: [],
    );
  }

  /// `Contact information could not be found.`
  String get noContact {
    return Intl.message(
      'Contact information could not be found.',
      name: 'noContact',
      desc: '',
      args: [],
    );
  }

  /// `No verification requests found.`
  String get noRequest {
    return Intl.message(
      'No verification requests found.',
      name: 'noRequest',
      desc: '',
      args: [],
    );
  }

  /// `List of received authentication requests`
  String get authenticationRequest {
    return Intl.message(
      'List of received authentication requests',
      name: 'authenticationRequest',
      desc: '',
      args: [],
    );
  }

  /// `Mutual authentication was rejected`
  String get authRejected {
    return Intl.message(
      'Mutual authentication was rejected',
      name: 'authRejected',
      desc: '',
      args: [],
    );
  }

  /// `View family tree`
  String get viewFamilyTree {
    return Intl.message(
      'View family tree',
      name: 'viewFamilyTree',
      desc: '',
      args: [],
    );
  }

  /// `Check original`
  String get checkOriginal {
    return Intl.message(
      'Check original',
      name: 'checkOriginal',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get action_ok {
    return Intl.message('OK', name: 'action_ok', desc: '', args: []);
  }

  /// `Select`
  String get action_select {
    return Intl.message('Select', name: 'action_select', desc: '', args: []);
  }

  /// `Delete`
  String get action_delete {
    return Intl.message('Delete', name: 'action_delete', desc: '', args: []);
  }

  /// `Ask me anything`
  String get hint_ask_anything {
    return Intl.message(
      'Ask me anything',
      name: 'hint_ask_anything',
      desc: '',
      args: [],
    );
  }

  /// `Select a contact`
  String get hint_select_contact {
    return Intl.message(
      'Select a contact',
      name: 'hint_select_contact',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get label_content {
    return Intl.message('Content', name: 'label_content', desc: '', args: []);
  }

  /// `License Number`
  String get label_license_number {
    return Intl.message(
      'License Number',
      name: 'label_license_number',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get label_expiration_date {
    return Intl.message(
      'Expiration Date',
      name: 'label_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Aptitude Test`
  String get label_aptitude_test {
    return Intl.message(
      'Aptitude Test',
      name: 'label_aptitude_test',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get field_surname {
    return Intl.message('Surname', name: 'field_surname', desc: '', args: []);
  }

  /// `Given Name`
  String get field_given_name {
    return Intl.message(
      'Given Name',
      name: 'field_given_name',
      desc: '',
      args: [],
    );
  }

  /// `{account} {name}`
  String info_account_holder(Object account, Object name) {
    return Intl.message(
      '$account $name',
      name: 'info_account_holder',
      desc: 'Show account and name e.g. 123-456 Hong Gilsoon',
      args: [account, name],
    );
  }

  /// `Issued on {date}`
  String info_issued_date(Object date) {
    return Intl.message(
      'Issued on $date',
      name: 'info_issued_date',
      desc: 'Date issued string',
      args: [date],
    );
  }

  /// `Self ID has been created`
  String get self_id_created {
    return Intl.message(
      'Self ID has been created',
      name: 'self_id_created',
      desc: '',
      args: [],
    );
  }

  /// `father`
  String get father_2 {
    return Intl.message('father', name: 'father_2', desc: '', args: []);
  }

  /// `mother`
  String get mother_2 {
    return Intl.message('mother', name: 'mother_2', desc: '', args: []);
  }

  /// `elder brother`
  String get elder_brother {
    return Intl.message(
      'elder brother',
      name: 'elder_brother',
      desc: '',
      args: [],
    );
  }

  /// `little brother`
  String get little_brother {
    return Intl.message(
      'little brother',
      name: 'little_brother',
      desc: '',
      args: [],
    );
  }

  /// `elder sister`
  String get elder_sister {
    return Intl.message(
      'elder sister',
      name: 'elder_sister',
      desc: '',
      args: [],
    );
  }

  /// `little sister`
  String get little_sister {
    return Intl.message(
      'little sister',
      name: 'little_sister',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get chon_action_next {
    return Intl.message('Next', name: 'chon_action_next', desc: '', args: []);
  }

  /// `Skip`
  String get chon_action_skip {
    return Intl.message('Skip', name: 'chon_action_skip', desc: '', args: []);
  }

  /// `Get started`
  String get chon_action_start {
    return Intl.message(
      'Get started',
      name: 'chon_action_start',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get chon_action_confirm {
    return Intl.message(
      'Confirm',
      name: 'chon_action_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get chon_action_retry {
    return Intl.message(
      'Try again',
      name: 'chon_action_retry',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get chon_action_save {
    return Intl.message('Save', name: 'chon_action_save', desc: '', args: []);
  }

  /// `Send`
  String get chon_action_send {
    return Intl.message('Send', name: 'chon_action_send', desc: '', args: []);
  }

  /// `Get verified\nas yourself with CHON DID`
  String get chon_tutorial_s1_title {
    return Intl.message(
      'Get verified\nas yourself with CHON DID',
      name: 'chon_tutorial_s1_title',
      desc: '',
      args: [],
    );
  }

  /// `Get your identity verified by family\nand authenticate where needed.`
  String get chon_tutorial_s1_body {
    return Intl.message(
      'Get your identity verified by family\nand authenticate where needed.',
      name: 'chon_tutorial_s1_body',
      desc: '',
      args: [],
    );
  }

  /// `Mutual auth\nbetween people`
  String get chon_tutorial_s2_title {
    return Intl.message(
      'Mutual auth\nbetween people',
      name: 'chon_tutorial_s2_title',
      desc: '',
      args: [],
    );
  }

  /// `Authenticate with your family\nto prove your relationship.`
  String get chon_tutorial_s2_body {
    return Intl.message(
      'Authenticate with your family\nto prove your relationship.',
      name: 'chon_tutorial_s2_body',
      desc: '',
      args: [],
    );
  }

  /// `Family tree\nwith your loved ones`
  String get chon_tutorial_s3_title {
    return Intl.message(
      'Family tree\nwith your loved ones',
      name: 'chon_tutorial_s3_title',
      desc: '',
      args: [],
    );
  }

  /// `Visualize your family relations\nand keep the genealogy secure.`
  String get chon_tutorial_s3_body {
    return Intl.message(
      'Visualize your family relations\nand keep the genealogy secure.',
      name: 'chon_tutorial_s3_body',
      desc: '',
      args: [],
    );
  }

  /// `Ready to\nstart with CHON?`
  String get chon_tutorial_s4_title {
    return Intl.message(
      'Ready to\nstart with CHON?',
      name: 'chon_tutorial_s4_title',
      desc: '',
      args: [],
    );
  }

  /// `Setup is complete.\nUse it right away.`
  String get chon_tutorial_s4_body {
    return Intl.message(
      'Setup is complete.\nUse it right away.',
      name: 'chon_tutorial_s4_body',
      desc: '',
      args: [],
    );
  }

  /// `Create your CHON ID through mutual auth.`
  String get chon_home_banner {
    return Intl.message(
      'Create your CHON ID through mutual auth.',
      name: 'chon_home_banner',
      desc: '',
      args: [],
    );
  }

  /// `CHON DID\nTutorial`
  String get chon_home_tutorial_card {
    return Intl.message(
      'CHON DID\nTutorial',
      name: 'chon_home_tutorial_card',
      desc: '',
      args: [],
    );
  }

  /// `Mutual auth`
  String get chon_home_mutual_title {
    return Intl.message(
      'Mutual auth',
      name: 'chon_home_mutual_title',
      desc: '',
      args: [],
    );
  }

  /// `Verify each other\nwith family and relatives`
  String get chon_home_mutual_subtitle {
    return Intl.message(
      'Verify each other\nwith family and relatives',
      name: 'chon_home_mutual_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Input info`
  String get chon_home_input_label {
    return Intl.message(
      'Input info',
      name: 'chon_home_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Contact\n(Tree)`
  String get chon_home_q_contact {
    return Intl.message(
      'Contact\n(Tree)',
      name: 'chon_home_q_contact',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get chon_home_q_edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'chon_home_q_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `QR code`
  String get chon_home_q_qr {
    return Intl.message('QR code', name: 'chon_home_q_qr', desc: '', args: []);
  }

  /// `Support`
  String get chon_home_q_support {
    return Intl.message(
      'Support',
      name: 'chon_home_q_support',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get chon_nav_home {
    return Intl.message('Home', name: 'chon_nav_home', desc: '', args: []);
  }

  /// `CHON`
  String get chon_nav_chon {
    return Intl.message('CHON', name: 'chon_nav_chon', desc: '', args: []);
  }

  /// `ID card`
  String get chon_nav_id_card {
    return Intl.message(
      'ID card',
      name: 'chon_nav_id_card',
      desc: '',
      args: [],
    );
  }

  /// `Mutual auth`
  String get chon_nav_mutual {
    return Intl.message(
      'Mutual auth',
      name: 'chon_nav_mutual',
      desc: '',
      args: [],
    );
  }

  /// `Family tree`
  String get chon_nav_family_tree {
    return Intl.message(
      'Family tree',
      name: 'chon_nav_family_tree',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get chon_action_back {
    return Intl.message('Back', name: 'chon_action_back', desc: '', args: []);
  }

  /// `Continue`
  String get chon_action_continue {
    return Intl.message(
      'Continue',
      name: 'chon_action_continue',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get chon_action_close {
    return Intl.message('Close', name: 'chon_action_close', desc: '', args: []);
  }

  /// `Approve`
  String get chon_action_approve {
    return Intl.message(
      'Approve',
      name: 'chon_action_approve',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get chon_action_reject {
    return Intl.message(
      'Reject',
      name: 'chon_action_reject',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get chon_action_finish {
    return Intl.message(
      'Finish',
      name: 'chon_action_finish',
      desc: '',
      args: [],
    );
  }

  /// `Search again`
  String get chon_action_search_again {
    return Intl.message(
      'Search again',
      name: 'chon_action_search_again',
      desc: '',
      args: [],
    );
  }

  /// `Retake photo`
  String get chon_action_recapture {
    return Intl.message(
      'Retake photo',
      name: 'chon_action_recapture',
      desc: '',
      args: [],
    );
  }

  /// `Attach file`
  String get chon_action_attach {
    return Intl.message(
      'Attach file',
      name: 'chon_action_attach',
      desc: '',
      args: [],
    );
  }

  /// `Attached`
  String get chon_action_attached {
    return Intl.message(
      'Attached',
      name: 'chon_action_attached',
      desc: '',
      args: [],
    );
  }

  /// `Mutual auth`
  String get chon_mauth_req_title {
    return Intl.message(
      'Mutual auth',
      name: 'chon_mauth_req_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number\nof the family to verify.`
  String get chon_mauth_req_phone_prompt {
    return Intl.message(
      'Enter the phone number\nof the family to verify.',
      name: 'chon_mauth_req_phone_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Is this the right person?`
  String get chon_mauth_req_confirm_q {
    return Intl.message(
      'Is this the right person?',
      name: 'chon_mauth_req_confirm_q',
      desc: '',
      args: [],
    );
  }

  /// `Send request`
  String get chon_mauth_req_send {
    return Intl.message(
      'Send request',
      name: 'chon_mauth_req_send',
      desc: '',
      args: [],
    );
  }

  /// `Sending request…`
  String get chon_mauth_req_sending {
    return Intl.message(
      'Sending request…',
      name: 'chon_mauth_req_sending',
      desc: '',
      args: [],
    );
  }

  /// `Request sent.\nWaiting for the other party.`
  String get chon_mauth_req_awaiting {
    return Intl.message(
      'Request sent.\nWaiting for the other party.',
      name: 'chon_mauth_req_awaiting',
      desc: '',
      args: [],
    );
  }

  /// `Approved.`
  String get chon_mauth_req_approved {
    return Intl.message(
      'Approved.',
      name: 'chon_mauth_req_approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected.`
  String get chon_mauth_req_rejected {
    return Intl.message(
      'Rejected.',
      name: 'chon_mauth_req_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Authentication complete.`
  String get chon_mauth_req_done {
    return Intl.message(
      'Authentication complete.',
      name: 'chon_mauth_req_done',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later.`
  String get chon_mauth_req_retry_msg {
    return Intl.message(
      'Please try again later.',
      name: 'chon_mauth_req_retry_msg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a phone number.`
  String get chon_mauth_req_err_phone {
    return Intl.message(
      'Please enter a phone number.',
      name: 'chon_mauth_req_err_phone',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get chon_mauth_req_err_notfound {
    return Intl.message(
      'User not found.',
      name: 'chon_mauth_req_err_notfound',
      desc: '',
      args: [],
    );
  }

  /// `Received requests`
  String get chon_mauth_rcv_title {
    return Intl.message(
      'Received requests',
      name: 'chon_mauth_rcv_title',
      desc: '',
      args: [],
    );
  }

  /// `No requests yet.`
  String get chon_mauth_rcv_empty {
    return Intl.message(
      'No requests yet.',
      name: 'chon_mauth_rcv_empty',
      desc: '',
      args: [],
    );
  }

  /// `Request detail`
  String get chon_mauth_rcv_detail {
    return Intl.message(
      'Request detail',
      name: 'chon_mauth_rcv_detail',
      desc: '',
      args: [],
    );
  }

  /// `Approval complete`
  String get chon_mauth_rcv_approved {
    return Intl.message(
      'Approval complete',
      name: 'chon_mauth_rcv_approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejection complete`
  String get chon_mauth_rcv_rejected {
    return Intl.message(
      'Rejection complete',
      name: 'chon_mauth_rcv_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Approving…`
  String get chon_mauth_rcv_approving {
    return Intl.message(
      'Approving…',
      name: 'chon_mauth_rcv_approving',
      desc: '',
      args: [],
    );
  }

  /// `Rejecting…`
  String get chon_mauth_rcv_rejecting {
    return Intl.message(
      'Rejecting…',
      name: 'chon_mauth_rcv_rejecting',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get chon_mauth_rcv_anonymous {
    return Intl.message(
      'Unknown',
      name: 'chon_mauth_rcv_anonymous',
      desc: '',
      args: [],
    );
  }

  /// `Offline mutual auth`
  String get chon_mauth_off_title {
    return Intl.message(
      'Offline mutual auth',
      name: 'chon_mauth_off_title',
      desc: '',
      args: [],
    );
  }

  /// `Verify each other's CHON ID\nin person, offline.`
  String get chon_mauth_off_intro {
    return Intl.message(
      'Verify each other\'s CHON ID\nin person, offline.',
      name: 'chon_mauth_off_intro',
      desc: '',
      args: [],
    );
  }

  /// `Show my QR`
  String get chon_mauth_off_show {
    return Intl.message(
      'Show my QR',
      name: 'chon_mauth_off_show',
      desc: '',
      args: [],
    );
  }

  /// `The other party scans my QR.`
  String get chon_mauth_off_show_sub {
    return Intl.message(
      'The other party scans my QR.',
      name: 'chon_mauth_off_show_sub',
      desc: '',
      args: [],
    );
  }

  /// `Scan their QR`
  String get chon_mauth_off_scan {
    return Intl.message(
      'Scan their QR',
      name: 'chon_mauth_off_scan',
      desc: '',
      args: [],
    );
  }

  /// `Use the camera to read their QR.`
  String get chon_mauth_off_scan_sub {
    return Intl.message(
      'Use the camera to read their QR.',
      name: 'chon_mauth_off_scan_sub',
      desc: '',
      args: [],
    );
  }

  /// `My QR`
  String get chon_mauth_off_my_qr {
    return Intl.message(
      'My QR',
      name: 'chon_mauth_off_my_qr',
      desc: '',
      args: [],
    );
  }

  /// `Show this QR to your counterpart.`
  String get chon_mauth_off_show_prompt {
    return Intl.message(
      'Show this QR to your counterpart.',
      name: 'chon_mauth_off_show_prompt',
      desc: '',
      args: [],
    );
  }

  /// `This card has no QR payload.`
  String get chon_mauth_off_no_payload {
    return Intl.message(
      'This card has no QR payload.',
      name: 'chon_mauth_off_no_payload',
      desc: '',
      args: [],
    );
  }

  /// `QR scan`
  String get chon_mauth_off_scan_title {
    return Intl.message(
      'QR scan',
      name: 'chon_mauth_off_scan_title',
      desc: '',
      args: [],
    );
  }

  /// `Align the QR within the box.`
  String get chon_mauth_off_scan_prompt {
    return Intl.message(
      'Align the QR within the box.',
      name: 'chon_mauth_off_scan_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Verifying…`
  String get chon_mauth_off_verifying {
    return Intl.message(
      'Verifying…',
      name: 'chon_mauth_off_verifying',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get chon_mauth_off_verified {
    return Intl.message(
      'Verified',
      name: 'chon_mauth_off_verified',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get chon_contact_title {
    return Intl.message(
      'Contact',
      name: 'chon_contact_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick a family member to call.`
  String get chon_contact_idle_prompt {
    return Intl.message(
      'Pick a family member to call.',
      name: 'chon_contact_idle_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Connecting…`
  String get chon_contact_connecting {
    return Intl.message(
      'Connecting…',
      name: 'chon_contact_connecting',
      desc: '',
      args: [],
    );
  }

  /// `Call ended.`
  String get chon_contact_completed {
    return Intl.message(
      'Call ended.',
      name: 'chon_contact_completed',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't connect.`
  String get chon_contact_failed {
    return Intl.message(
      'Couldn\'t connect.',
      name: 'chon_contact_failed',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get chon_profile_edit_title {
    return Intl.message(
      'Edit profile',
      name: 'chon_profile_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get chon_profile_edit_surname {
    return Intl.message(
      'Surname',
      name: 'chon_profile_edit_surname',
      desc: '',
      args: [],
    );
  }

  /// `Given name`
  String get chon_profile_edit_given {
    return Intl.message(
      'Given name',
      name: 'chon_profile_edit_given',
      desc: '',
      args: [],
    );
  }

  /// `Required.`
  String get chon_profile_edit_required {
    return Intl.message(
      'Required.',
      name: 'chon_profile_edit_required',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get chon_report_title {
    return Intl.message(
      'Report a problem',
      name: 'chon_report_title',
      desc: '',
      args: [],
    );
  }

  /// `No prior reports.`
  String get chon_report_empty {
    return Intl.message(
      'No prior reports.',
      name: 'chon_report_empty',
      desc: '',
      args: [],
    );
  }

  /// `New report`
  String get chon_report_new {
    return Intl.message(
      'New report',
      name: 'chon_report_new',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get chon_report_field_title {
    return Intl.message(
      'Title',
      name: 'chon_report_field_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the report title.`
  String get chon_report_field_title_hint {
    return Intl.message(
      'Enter the report title.',
      name: 'chon_report_field_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get chon_report_field_content {
    return Intl.message(
      'Content',
      name: 'chon_report_field_content',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem in detail.`
  String get chon_report_field_content_hint {
    return Intl.message(
      'Describe the problem in detail.',
      name: 'chon_report_field_content_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sending report…`
  String get chon_report_sending {
    return Intl.message(
      'Sending report…',
      name: 'chon_report_sending',
      desc: '',
      args: [],
    );
  }

  /// `Your report was received.`
  String get chon_report_submitted {
    return Intl.message(
      'Your report was received.',
      name: 'chon_report_submitted',
      desc: '',
      args: [],
    );
  }

  /// `We'll get back to you soon.`
  String get chon_report_submitted_sub {
    return Intl.message(
      'We\'ll get back to you soon.',
      name: 'chon_report_submitted_sub',
      desc: '',
      args: [],
    );
  }

  /// `Send failed.`
  String get chon_report_failed {
    return Intl.message(
      'Send failed.',
      name: 'chon_report_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a title and content.`
  String get chon_report_err_required {
    return Intl.message(
      'Please enter a title and content.',
      name: 'chon_report_err_required',
      desc: '',
      args: [],
    );
  }

  /// `CHON AI`
  String get chon_chat_title {
    return Intl.message('CHON AI', name: 'chon_chat_title', desc: '', args: []);
  }

  /// `Ask CHON AI anything`
  String get chon_chat_empty_title {
    return Intl.message(
      'Ask CHON AI anything',
      name: 'chon_chat_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Ask about family relations,\nverification, family tree.`
  String get chon_chat_empty_body {
    return Intl.message(
      'Ask about family relations,\nverification, family tree.',
      name: 'chon_chat_empty_body',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get chon_chat_input_hint {
    return Intl.message(
      'Type a message',
      name: 'chon_chat_input_hint',
      desc: '',
      args: [],
    );
  }

  /// `Issue ID`
  String get chon_id_gen_title {
    return Intl.message(
      'Issue ID',
      name: 'chon_id_gen_title',
      desc: '',
      args: [],
    );
  }

  /// `Let's start issuing\nyour CHON ID`
  String get chon_id_gen_intro_title {
    return Intl.message(
      'Let\'s start issuing\nyour CHON ID',
      name: 'chon_id_gen_intro_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID info and capture\nphotos to create your CHON ID.`
  String get chon_id_gen_intro_body {
    return Intl.message(
      'Enter ID info and capture\nphotos to create your CHON ID.',
      name: 'chon_id_gen_intro_body',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get chon_id_gen_field_name {
    return Intl.message(
      'Full name',
      name: 'chon_id_gen_field_name',
      desc: '',
      args: [],
    );
  }

  /// `Name on the ID`
  String get chon_id_gen_field_name_hint {
    return Intl.message(
      'Name on the ID',
      name: 'chon_id_gen_field_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Resident / Foreigner ID number`
  String get chon_id_gen_field_id {
    return Intl.message(
      'Resident / Foreigner ID number',
      name: 'chon_id_gen_field_id',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get chon_id_gen_verified_ok {
    return Intl.message(
      'Verified',
      name: 'chon_id_gen_verified_ok',
      desc: '',
      args: [],
    );
  }

  /// `Could not verify`
  String get chon_id_gen_verified_fail {
    return Intl.message(
      'Could not verify',
      name: 'chon_id_gen_verified_fail',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter info`
  String get chon_id_gen_reenter {
    return Intl.message(
      'Re-enter info',
      name: 'chon_id_gen_reenter',
      desc: '',
      args: [],
    );
  }

  /// `Pick the ID type`
  String get chon_id_gen_pick_type {
    return Intl.message(
      'Pick the ID type',
      name: 'chon_id_gen_pick_type',
      desc: '',
      args: [],
    );
  }

  /// `Resident / Foreigner card`
  String get chon_id_gen_type_resident {
    return Intl.message(
      'Resident / Foreigner card',
      name: 'chon_id_gen_type_resident',
      desc: '',
      args: [],
    );
  }

  /// `Family relation cert.`
  String get chon_id_gen_type_family {
    return Intl.message(
      'Family relation cert.',
      name: 'chon_id_gen_type_family',
      desc: '',
      args: [],
    );
  }

  /// `Taekwondo certificate`
  String get chon_id_gen_type_taekwondo {
    return Intl.message(
      'Taekwondo certificate',
      name: 'chon_id_gen_type_taekwondo',
      desc: '',
      args: [],
    );
  }

  /// `Before you capture`
  String get chon_id_gen_prep_title {
    return Intl.message(
      'Before you capture',
      name: 'chon_id_gen_prep_title',
      desc: '',
      args: [],
    );
  }

  /// `Shoot against a dark background.`
  String get chon_id_gen_prep_tip1 {
    return Intl.message(
      'Shoot against a dark background.',
      name: 'chon_id_gen_prep_tip1',
      desc: '',
      args: [],
    );
  }

  /// `Adjust angle to avoid glare.`
  String get chon_id_gen_prep_tip2 {
    return Intl.message(
      'Adjust angle to avoid glare.',
      name: 'chon_id_gen_prep_tip2',
      desc: '',
      args: [],
    );
  }

  /// `Place the ID inside the guide.`
  String get chon_id_gen_prep_tip3 {
    return Intl.message(
      'Place the ID inside the guide.',
      name: 'chon_id_gen_prep_tip3',
      desc: '',
      args: [],
    );
  }

  /// `Start capturing`
  String get chon_id_gen_prep_start {
    return Intl.message(
      'Start capturing',
      name: 'chon_id_gen_prep_start',
      desc: '',
      args: [],
    );
  }

  /// `Align the front of the ID inside the guide`
  String get chon_id_gen_capture_front {
    return Intl.message(
      'Align the front of the ID inside the guide',
      name: 'chon_id_gen_capture_front',
      desc: '',
      args: [],
    );
  }

  /// `Align the back of the ID inside the guide`
  String get chon_id_gen_capture_back {
    return Intl.message(
      'Align the back of the ID inside the guide',
      name: 'chon_id_gen_capture_back',
      desc: '',
      args: [],
    );
  }

  /// `Confirm what we read`
  String get chon_id_gen_ocr_title {
    return Intl.message(
      'Confirm what we read',
      name: 'chon_id_gen_ocr_title',
      desc: '',
      args: [],
    );
  }

  /// `No auto-read result. If you typed it manually, continue.`
  String get chon_id_gen_ocr_no_result {
    return Intl.message(
      'No auto-read result. If you typed it manually, continue.',
      name: 'chon_id_gen_ocr_no_result',
      desc: '',
      args: [],
    );
  }

  /// `Review and finish`
  String get chon_id_gen_review_title {
    return Intl.message(
      'Review and finish',
      name: 'chon_id_gen_review_title',
      desc: '',
      args: [],
    );
  }

  /// `Issue ID`
  String get chon_id_gen_review_finish {
    return Intl.message(
      'Issue ID',
      name: 'chon_id_gen_review_finish',
      desc: '',
      args: [],
    );
  }

  /// `Your CHON ID is issued`
  String get chon_id_gen_done {
    return Intl.message(
      'Your CHON ID is issued',
      name: 'chon_id_gen_done',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get chon_id_gen_field_id_label {
    return Intl.message(
      'ID number',
      name: 'chon_id_gen_field_id_label',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get chon_id_gen_field_address {
    return Intl.message(
      'Address',
      name: 'chon_id_gen_field_address',
      desc: '',
      args: [],
    );
  }

  /// `Issued date`
  String get chon_id_gen_field_issued {
    return Intl.message(
      'Issued date',
      name: 'chon_id_gen_field_issued',
      desc: '',
      args: [],
    );
  }

  /// `Issuing authority`
  String get chon_id_gen_field_authority {
    return Intl.message(
      'Issuing authority',
      name: 'chon_id_gen_field_authority',
      desc: '',
      args: [],
    );
  }

  /// `Required information missing.`
  String get chon_id_gen_err_required {
    return Intl.message(
      'Required information missing.',
      name: 'chon_id_gen_err_required',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't read the ID. Please retake.`
  String get chon_id_gen_ocr_err {
    return Intl.message(
      'Couldn\'t read the ID. Please retake.',
      name: 'chon_id_gen_ocr_err',
      desc: '',
      args: [],
    );
  }

  /// `Family tree`
  String get chon_ft_title {
    return Intl.message(
      'Family tree',
      name: 'chon_ft_title',
      desc: '',
      args: [],
    );
  }

  /// `No family info.`
  String get chon_ft_empty {
    return Intl.message(
      'No family info.',
      name: 'chon_ft_empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
