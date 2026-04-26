import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_passport.freezed.dart';
part 'ocr_passport.g.dart';

@freezed
abstract class OcrDocumentPassportResponse with _$OcrDocumentPassportResponse {
  const factory OcrDocumentPassportResponse({
    required String version,
    required String requestId,
    required int timestamp,
    required List<OcrPassportImage> images,
  }) = _OcrDocumentPassportResponse;

  factory OcrDocumentPassportResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentPassportResponseFromJson(json);
}

@freezed
abstract class OcrPassportImage with _$OcrPassportImage {
  const factory OcrPassportImage({
    required String uid,
    required String name,
    required String inferResult,
    String? message,
    OcrValidationResult? validationResult,
    OcrPassport? passport,
  }) = _OcrPassportImage;

  factory OcrPassportImage.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportImageFromJson(json);
}

@freezed
abstract class OcrValidationResult with _$OcrValidationResult {
  const factory OcrValidationResult({
    String? result,
  }) = _OcrValidationResult;

  factory OcrValidationResult.fromJson(Map<String, dynamic> json) =>
      _$OcrValidationResultFromJson(json);
}

@freezed
abstract class OcrPassport with _$OcrPassport {
  const factory OcrPassport({
    OcrPassportResult? passportResult,
  }) = _OcrPassport;

  factory OcrPassport.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportFromJson(json);
}

@freezed
abstract class OcrPassportResult with _$OcrPassportResult {
  const factory OcrPassportResult({
    OcrPassportField? documentClassCode,
    OcrPassportField? issuingStateCode,
    OcrPassportField? firstName,
    OcrPassportField? lastName1,
    OcrPassportField? lastName2,
    OcrPassportField? documentNumber,
    OcrPassportField? checkDigitForDocumentNumber,
    OcrPassportField? nationality,
    OcrPassportField? dateOfBirth,
    OcrPassportField? age,
    OcrPassportField? checkDigitForDateOfBirth,
    OcrPassportField? gender,
    OcrPassportField? dateOfExpiry,
    OcrPassportField? checkDigitForDateOfExpiry,
    OcrPassportField? personalNumber,
    OcrPassportField? finalDigitForPersonalNumber,
    OcrPassportField? mrzType,
    OcrPassportField? mrzLines,
    OcrPassportField? isExpired,
  }) = _OcrPassportResult;

  factory OcrPassportResult.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportResultFromJson(json);
}

@freezed
abstract class OcrPassportField with _$OcrPassportField {
  const factory OcrPassportField({
    String? rawText,
    dynamic refinedText,
  }) = _OcrPassportField;

  factory OcrPassportField.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportFieldFromJson(json);
}

extension OcrPassportFieldX on OcrPassportField {
  String? get asString => refinedText is String ? refinedText as String : null;
  int? get asInt => refinedText is int ? refinedText as int : null;
  bool? get asBool => refinedText is bool ? refinedText as bool : null;
}
