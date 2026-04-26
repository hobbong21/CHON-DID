// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_card_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OcrDocumentIdCardResponse _$OcrDocumentIdCardResponseFromJson(
        Map<String, dynamic> json) =>
    _OcrDocumentIdCardResponse(
      version: json['version'] as String,
      requestId: json['requestId'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => OcrDocumentImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrDocumentIdCardResponseToJson(
        _OcrDocumentIdCardResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
      'images': instance.images,
    };

_OcrDocumentImage _$OcrDocumentImageFromJson(Map<String, dynamic> json) =>
    _OcrDocumentImage(
      uid: json['uid'] as String,
      name: json['name'] as String,
      inferResult: json['inferResult'] as String,
      message: json['message'] as String?,
      validationResult: json['validationResult'] == null
          ? null
          : OcrValidationResult.fromJson(
              json['validationResult'] as Map<String, dynamic>),
      idCard: json['idCard'] == null
          ? null
          : OcrIdCard.fromJson(json['idCard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrDocumentImageToJson(_OcrDocumentImage instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'inferResult': instance.inferResult,
      'message': instance.message,
      'validationResult': instance.validationResult,
      'idCard': instance.idCard,
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

_OcrIdCard _$OcrIdCardFromJson(Map<String, dynamic> json) => _OcrIdCard(
      meta: json['meta'] == null
          ? null
          : OcrIdCardMeta.fromJson(json['meta'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : OcrIdCardResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrIdCardToJson(_OcrIdCard instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'result': instance.result,
    };

_OcrIdCardMeta _$OcrIdCardMetaFromJson(Map<String, dynamic> json) =>
    _OcrIdCardMeta(
      estimatedLanguage: json['estimatedLanguage'] as String?,
    );

Map<String, dynamic> _$OcrIdCardMetaToJson(_OcrIdCardMeta instance) =>
    <String, dynamic>{
      'estimatedLanguage': instance.estimatedLanguage,
    };

_OcrIdCardResult _$OcrIdCardResultFromJson(Map<String, dynamic> json) =>
    _OcrIdCardResult(
      isConfident: json['isConfident'] as bool?,
      ic: json['ic'] == null
          ? null
          : OcrIdCardIC.fromJson(json['ic'] as Map<String, dynamic>),
      dl: json['dl'] == null
          ? null
          : OcrIdCardDL.fromJson(json['dl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrIdCardResultToJson(_OcrIdCardResult instance) =>
    <String, dynamic>{
      'isConfident': instance.isConfident,
      'ic': instance.ic,
      'dl': instance.dl,
    };

_OcrIdCardIC _$OcrIdCardICFromJson(Map<String, dynamic> json) => _OcrIdCardIC(
      name: (json['name'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalNum: (json['personalNum'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueDate: (json['issueDate'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      authority: (json['authority'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrIdCardICToJson(_OcrIdCardIC instance) =>
    <String, dynamic>{
      'name': instance.name,
      'personalNum': instance.personalNum,
      'address': instance.address,
      'issueDate': instance.issueDate,
      'authority': instance.authority,
    };

_OcrIdCardDL _$OcrIdCardDLFromJson(Map<String, dynamic> json) => _OcrIdCardDL(
      type: (json['type'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      num: (json['num'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalNum: (json['personalNum'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewStartDate: (json['renewStartDate'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewEndDate: (json['renewEndDate'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: (json['condition'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      organDonation: (json['organDonation'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueDate: (json['issueDate'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
      authority: (json['authority'] as List<dynamic>?)
          ?.map((e) => OcrIdCardField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OcrIdCardDLToJson(_OcrIdCardDL instance) =>
    <String, dynamic>{
      'type': instance.type,
      'num': instance.num,
      'name': instance.name,
      'personalNum': instance.personalNum,
      'address': instance.address,
      'renewStartDate': instance.renewStartDate,
      'renewEndDate': instance.renewEndDate,
      'condition': instance.condition,
      'code': instance.code,
      'organDonation': instance.organDonation,
      'issueDate': instance.issueDate,
      'authority': instance.authority,
    };

_OcrIdCardField _$OcrIdCardFieldFromJson(Map<String, dynamic> json) =>
    _OcrIdCardField(
      text: json['text'] as String?,
      formatted: json['formatted'] == null
          ? null
          : OcrFormattedValue.fromJson(
              json['formatted'] as Map<String, dynamic>),
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OcrIdCardFieldToJson(_OcrIdCardField instance) =>
    <String, dynamic>{
      'text': instance.text,
      'formatted': instance.formatted,
      'confidenceScore': instance.confidenceScore,
    };

_OcrFormattedValue _$OcrFormattedValueFromJson(Map<String, dynamic> json) =>
    _OcrFormattedValue(
      value: json['value'],
      year: json['year'] as String?,
      month: json['month'] as String?,
      day: json['day'] as String?,
    );

Map<String, dynamic> _$OcrFormattedValueToJson(_OcrFormattedValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };
