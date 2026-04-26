// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankInfoModel _$BankInfoModelFromJson(Map<String, dynamic> json) =>
    _BankInfoModel(
      refBank: (json['id'] as num?)?.toInt(),
      name: json['bankName'] as String?,
      iconPath: json['iconPath'] as String?,
    );

Map<String, dynamic> _$BankInfoModelToJson(_BankInfoModel instance) =>
    <String, dynamic>{
      'id': instance.refBank,
      'bankName': instance.name,
      'iconPath': instance.iconPath,
    };
