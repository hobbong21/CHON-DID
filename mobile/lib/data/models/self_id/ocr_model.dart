import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_model.freezed.dart';
part 'ocr_model.g.dart';

@freezed
abstract class OcrResponse with _$OcrResponse {
  const factory OcrResponse({
    List<OcrImage>? images,
  }) = _OcrResponse;

  factory OcrResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrResponseFromJson(json);
}

@freezed
abstract class OcrImage with _$OcrImage {
  const factory OcrImage({
    String? inferResult,
    List<OcrField>? fields,
  }) = _OcrImage;

  factory OcrImage.fromJson(Map<String, dynamic> json) =>
      _$OcrImageFromJson(json);
}

@freezed
abstract class OcrField with _$OcrField {
  const factory OcrField({
    String? valueType,
    BoundingPoly? boundingPoly,
    String? inferText,
    String? type,
    bool? lineBreak,
    @JsonKey(fromJson: _numToDouble) required double inferConfidence,
  }) = _OcrField;

  factory OcrField.fromJson(Map<String, dynamic> json) =>
      _$OcrFieldFromJson(json);
}

double _numToDouble(num value) => value.toDouble();

@freezed
abstract class BoundingPoly with _$BoundingPoly {
  const factory BoundingPoly({
    List<Vertices>? vertices,
  }) = _BoundingPoly;

  factory BoundingPoly.fromJson(Map<String, dynamic> json) =>
      _$BoundingPolyFromJson(json);
}

@freezed
abstract class Vertices with _$Vertices {
  const factory Vertices({
    double? x,
    double? y,
  }) = _Vertices;

  factory Vertices.fromJson(Map<String, dynamic> json) =>
      _$VerticesFromJson(json);
}

@freezed
abstract class OcrMessage with _$OcrMessage {
  const factory OcrMessage({
    required String version,
    required String requestId,
    required int timestamp,
    required List<OcrImageMessage> images,
    @Default(false) bool enableTableDetection,
  }) = _OcrMessage;

  factory OcrMessage.fromJson(Map<String, dynamic> json) =>
      _$OcrMessageFromJson(json);
}

@freezed
abstract class OcrImageMessage with _$OcrImageMessage {
  const factory OcrImageMessage({
    required String format,
    required String name,
  }) = _OcrImageMessage;

  factory OcrImageMessage.fromJson(Map<String, dynamic> json) =>
      _$OcrImageMessageFromJson(json);
}
