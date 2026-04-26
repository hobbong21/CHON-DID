import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_card_id.freezed.dart';
part 'ocr_card_id.g.dart';

@freezed
abstract class OcrDocumentIdCardResponse with _$OcrDocumentIdCardResponse {
  const factory OcrDocumentIdCardResponse({
    required String version,
    required String requestId,
    required int timestamp,
    required List<OcrDocumentImage> images,
  }) = _OcrDocumentIdCardResponse;

  factory OcrDocumentIdCardResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentIdCardResponseFromJson(json);
}

@freezed
abstract class OcrDocumentImage with _$OcrDocumentImage {
  const factory OcrDocumentImage({
    required String uid,
    required String name,
    required String inferResult,
    String? message,
    OcrValidationResult? validationResult,
    OcrIdCard? idCard,
  }) = _OcrDocumentImage;

  factory OcrDocumentImage.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentImageFromJson(json);
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
abstract class OcrIdCard with _$OcrIdCard {
  const factory OcrIdCard({
    OcrIdCardMeta? meta,
    OcrIdCardResult? result,
  }) = _OcrIdCard;

  factory OcrIdCard.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardFromJson(json);
}

@freezed
abstract class OcrIdCardMeta with _$OcrIdCardMeta {
  const factory OcrIdCardMeta({
    String? estimatedLanguage,
  }) = _OcrIdCardMeta;

  factory OcrIdCardMeta.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardMetaFromJson(json);
}

@freezed
abstract class OcrIdCardResult with _$OcrIdCardResult {
  const factory OcrIdCardResult({
    bool? isConfident,
    OcrIdCardIC? ic,
    OcrIdCardDL? dl,
  }) = _OcrIdCardResult;

  factory OcrIdCardResult.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardResultFromJson(json);
}

@freezed
abstract class OcrIdCardIC with _$OcrIdCardIC {
  const factory OcrIdCardIC({
    List<OcrIdCardField>? name,
    List<OcrIdCardField>? personalNum,
    List<OcrIdCardField>? address,
    List<OcrIdCardField>? issueDate,
    List<OcrIdCardField>? authority,
  }) = _OcrIdCardIC;

  factory OcrIdCardIC.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardICFromJson(json);
}

@freezed
abstract class OcrIdCardDL with _$OcrIdCardDL {
  const factory OcrIdCardDL({
    List<OcrIdCardField>? type, // 1종대형, 2종보통...
    List<OcrIdCardField>? num, // 21-19-174133-01
    List<OcrIdCardField>? name, // 홍길순
    List<OcrIdCardField>? personalNum, // 000829-2134567
    List<OcrIdCardField>? address, // 서울시 서대문구 ...
    List<OcrIdCardField>? renewStartDate, // 2029.01.01
    List<OcrIdCardField>? renewEndDate, // 2029.12.31
    List<OcrIdCardField>? condition, // A
    List<OcrIdCardField>? code, // 8H1X3Y
    List<OcrIdCardField>? organDonation, // 장기 조직기증
    List<OcrIdCardField>? issueDate, // 2019.09.10
    List<OcrIdCardField>? authority, // 서울지방경찰청장
  }) = _OcrIdCardDL;

  factory OcrIdCardDL.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardDLFromJson(json);
}

@freezed
abstract class OcrIdCardField with _$OcrIdCardField {
  const factory OcrIdCardField({
    String? text,
    OcrFormattedValue? formatted,
    double? confidenceScore,
  }) = _OcrIdCardField;

  factory OcrIdCardField.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardFieldFromJson(json);
}

@freezed
abstract class OcrFormattedValue with _$OcrFormattedValue {
  const factory OcrFormattedValue({
    dynamic value,
    String? year,
    String? month,
    String? day,
  }) = _OcrFormattedValue;

  factory OcrFormattedValue.fromJson(Map<String, dynamic> json) =>
      _$OcrFormattedValueFromJson(json);
}

extension OcrFormattedValueX on OcrFormattedValue {
  String? get asString => value is String ? value as String : null;
  int? get asInt => value is int ? value as int : null;
  bool? get asBool => value is bool ? value as bool : null;
}
