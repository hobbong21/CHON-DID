// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCardRequest _$CreateCardRequestFromJson(Map<String, dynamic> json) =>
    _CreateCardRequest(
      cardId: (json['cardId'] as num?)?.toInt(),
      name: json['name'] as String?,
      idNumber: json['idNumber'] as String?,
      address: json['address'] as String?,
      issuingAuthority: json['issuingAuthority'] as String?,
      issuedDate: json['issuedDate'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: $enumDecodeNullable(_$GenderCardEEnumMap, json['gender']),
      imgBase64: json['imgBase64'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      licenseValidity: json['licenseValidity'] as String?,
      expirationDatePassport: json['expirationDatePassport'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$CreateCardRequestToJson(_CreateCardRequest instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'name': instance.name,
      'idNumber': instance.idNumber,
      'address': instance.address,
      'issuingAuthority': instance.issuingAuthority,
      'issuedDate': instance.issuedDate,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'imgBase64': instance.imgBase64,
      'licenseNumber': instance.licenseNumber,
      'licenseValidity': instance.licenseValidity,
      'expirationDatePassport': instance.expirationDatePassport,
      'dateOfBirth': instance.dateOfBirth,
    };

const _$GenderCardEEnumMap = {
  GenderCardE.male: 'male',
  GenderCardE.female: 'female',
};

_CreateCardResponse _$CreateCardResponseFromJson(Map<String, dynamic> json) =>
    _CreateCardResponse(
      status: (json['status'] as num?)?.toInt(),
      errorCode: json['errorCode'] as String?,
      errorDesc: json['errorDesc'] as String?,
      data: json['data'] == null
          ? null
          : CreateCardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCardResponseToJson(_CreateCardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorCode': instance.errorCode,
      'errorDesc': instance.errorDesc,
      'data': instance.data,
    };

_CreateCardData _$CreateCardDataFromJson(Map<String, dynamic> json) =>
    _CreateCardData(
      cardId: (json['id'] as num?)?.toInt(),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$CreateCardDataToJson(_CreateCardData instance) =>
    <String, dynamic>{
      'id': instance.cardId,
      'accessToken': instance.accessToken,
    };
