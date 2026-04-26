// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OcrResponse _$OcrResponseFromJson(Map<String, dynamic> json) => _OcrResponse(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => OcrImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrResponseToJson(_OcrResponse instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

_OcrImage _$OcrImageFromJson(Map<String, dynamic> json) => _OcrImage(
      inferResult: json['inferResult'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => OcrField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrImageToJson(_OcrImage instance) => <String, dynamic>{
      'inferResult': instance.inferResult,
      'fields': instance.fields,
    };

_OcrField _$OcrFieldFromJson(Map<String, dynamic> json) => _OcrField(
      valueType: json['valueType'] as String?,
      boundingPoly: json['boundingPoly'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      inferText: json['inferText'] as String?,
      type: json['type'] as String?,
      lineBreak: json['lineBreak'] as bool?,
      inferConfidence: _numToDouble(json['inferConfidence'] as num),
    );

Map<String, dynamic> _$OcrFieldToJson(_OcrField instance) => <String, dynamic>{
      'valueType': instance.valueType,
      'boundingPoly': instance.boundingPoly,
      'inferText': instance.inferText,
      'type': instance.type,
      'lineBreak': instance.lineBreak,
      'inferConfidence': instance.inferConfidence,
    };

_BoundingPoly _$BoundingPolyFromJson(Map<String, dynamic> json) =>
    _BoundingPoly(
      vertices: (json['vertices'] as List<dynamic>?)
          ?.map((e) => Vertices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoundingPolyToJson(_BoundingPoly instance) =>
    <String, dynamic>{
      'vertices': instance.vertices,
    };

_Vertices _$VerticesFromJson(Map<String, dynamic> json) => _Vertices(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VerticesToJson(_Vertices instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

_OcrMessage _$OcrMessageFromJson(Map<String, dynamic> json) => _OcrMessage(
      version: json['version'] as String,
      requestId: json['requestId'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => OcrImageMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableTableDetection: json['enableTableDetection'] as bool? ?? false,
    );

Map<String, dynamic> _$OcrMessageToJson(_OcrMessage instance) =>
    <String, dynamic>{
      'version': instance.version,
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
      'images': instance.images,
      'enableTableDetection': instance.enableTableDetection,
    };

_OcrImageMessage _$OcrImageMessageFromJson(Map<String, dynamic> json) =>
    _OcrImageMessage(
      format: json['format'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OcrImageMessageToJson(_OcrImageMessage instance) =>
    <String, dynamic>{
      'format': instance.format,
      'name': instance.name,
    };
