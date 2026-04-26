// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_passport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OcrDocumentPassportResponse _$OcrDocumentPassportResponseFromJson(
        Map<String, dynamic> json) =>
    _OcrDocumentPassportResponse(
      version: json['version'] as String,
      requestId: json['requestId'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => OcrPassportImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrDocumentPassportResponseToJson(
        _OcrDocumentPassportResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
      'images': instance.images,
    };

_OcrPassportImage _$OcrPassportImageFromJson(Map<String, dynamic> json) =>
    _OcrPassportImage(
      uid: json['uid'] as String,
      name: json['name'] as String,
      inferResult: json['inferResult'] as String,
      message: json['message'] as String?,
      validationResult: json['validationResult'] == null
          ? null
          : OcrValidationResult.fromJson(
              json['validationResult'] as Map<String, dynamic>),
      passport: json['passport'] == null
          ? null
          : OcrPassport.fromJson(json['passport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrPassportImageToJson(_OcrPassportImage instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'inferResult': instance.inferResult,
      'message': instance.message,
      'validationResult': instance.validationResult,
      'passport': instance.passport,
    };

_OcrValidationResult _$OcrValidationResultFromJson(Map<String, dynamic> json) =>
    _OcrValidationResult(
      result: json['result'] as String?,
    );

Map<String, dynamic> _$OcrValidationResultToJson(
        _OcrValidationResult instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_OcrPassport _$OcrPassportFromJson(Map<String, dynamic> json) => _OcrPassport(
      passportResult: json['passportResult'] == null
          ? null
          : OcrPassportResult.fromJson(
              json['passportResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrPassportToJson(_OcrPassport instance) =>
    <String, dynamic>{
      'passportResult': instance.passportResult,
    };

_OcrPassportResult _$OcrPassportResultFromJson(Map<String, dynamic> json) =>
    _OcrPassportResult(
      documentClassCode: json['documentClassCode'] == null
          ? null
          : OcrPassportField.fromJson(
              json['documentClassCode'] as Map<String, dynamic>),
      issuingStateCode: json['issuingStateCode'] == null
          ? null
          : OcrPassportField.fromJson(
              json['issuingStateCode'] as Map<String, dynamic>),
      firstName: json['firstName'] == null
          ? null
          : OcrPassportField.fromJson(
              json['firstName'] as Map<String, dynamic>),
      lastName1: json['lastName1'] == null
          ? null
          : OcrPassportField.fromJson(
              json['lastName1'] as Map<String, dynamic>),
      lastName2: json['lastName2'] == null
          ? null
          : OcrPassportField.fromJson(
              json['lastName2'] as Map<String, dynamic>),
      documentNumber: json['documentNumber'] == null
          ? null
          : OcrPassportField.fromJson(
              json['documentNumber'] as Map<String, dynamic>),
      checkDigitForDocumentNumber: json['checkDigitForDocumentNumber'] == null
          ? null
          : OcrPassportField.fromJson(
              json['checkDigitForDocumentNumber'] as Map<String, dynamic>),
      nationality: json['nationality'] == null
          ? null
          : OcrPassportField.fromJson(
              json['nationality'] as Map<String, dynamic>),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : OcrPassportField.fromJson(
              json['dateOfBirth'] as Map<String, dynamic>),
      age: json['age'] == null
          ? null
          : OcrPassportField.fromJson(json['age'] as Map<String, dynamic>),
      checkDigitForDateOfBirth: json['checkDigitForDateOfBirth'] == null
          ? null
          : OcrPassportField.fromJson(
              json['checkDigitForDateOfBirth'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : OcrPassportField.fromJson(json['gender'] as Map<String, dynamic>),
      dateOfExpiry: json['dateOfExpiry'] == null
          ? null
          : OcrPassportField.fromJson(
              json['dateOfExpiry'] as Map<String, dynamic>),
      checkDigitForDateOfExpiry: json['checkDigitForDateOfExpiry'] == null
          ? null
          : OcrPassportField.fromJson(
              json['checkDigitForDateOfExpiry'] as Map<String, dynamic>),
      personalNumber: json['personalNumber'] == null
          ? null
          : OcrPassportField.fromJson(
              json['personalNumber'] as Map<String, dynamic>),
      finalDigitForPersonalNumber: json['finalDigitForPersonalNumber'] == null
          ? null
          : OcrPassportField.fromJson(
              json['finalDigitForPersonalNumber'] as Map<String, dynamic>),
      mrzType: json['mrzType'] == null
          ? null
          : OcrPassportField.fromJson(json['mrzType'] as Map<String, dynamic>),
      mrzLines: json['mrzLines'] == null
          ? null
          : OcrPassportField.fromJson(json['mrzLines'] as Map<String, dynamic>),
      isExpired: json['isExpired'] == null
          ? null
          : OcrPassportField.fromJson(
              json['isExpired'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrPassportResultToJson(_OcrPassportResult instance) =>
    <String, dynamic>{
      'documentClassCode': instance.documentClassCode,
      'issuingStateCode': instance.issuingStateCode,
      'firstName': instance.firstName,
      'lastName1': instance.lastName1,
      'lastName2': instance.lastName2,
      'documentNumber': instance.documentNumber,
      'checkDigitForDocumentNumber': instance.checkDigitForDocumentNumber,
      'nationality': instance.nationality,
      'dateOfBirth': instance.dateOfBirth,
      'age': instance.age,
      'checkDigitForDateOfBirth': instance.checkDigitForDateOfBirth,
      'gender': instance.gender,
      'dateOfExpiry': instance.dateOfExpiry,
      'checkDigitForDateOfExpiry': instance.checkDigitForDateOfExpiry,
      'personalNumber': instance.personalNumber,
      'finalDigitForPersonalNumber': instance.finalDigitForPersonalNumber,
      'mrzType': instance.mrzType,
      'mrzLines': instance.mrzLines,
      'isExpired': instance.isExpired,
    };

_OcrPassportField _$OcrPassportFieldFromJson(Map<String, dynamic> json) =>
    _OcrPassportField(
      rawText: json['rawText'] as String?,
      refinedText: json['refinedText'],
    );

Map<String, dynamic> _$OcrPassportFieldToJson(_OcrPassportField instance) =>
    <String, dynamic>{
      'rawText': instance.rawText,
      'refinedText': instance.refinedText,
    };
