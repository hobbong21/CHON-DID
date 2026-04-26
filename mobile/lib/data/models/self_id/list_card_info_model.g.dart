// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_card_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListCardInfoRequest _$ListCardInfoRequestFromJson(Map<String, dynamic> json) =>
    _ListCardInfoRequest(
      page: (json['pageIndex'] as num?)?.toInt(),
      size: (json['pageSize'] as num?)?.toInt(),
      status: json['isVerified'] as bool?,
    );

Map<String, dynamic> _$ListCardInfoRequestToJson(
        _ListCardInfoRequest instance) =>
    <String, dynamic>{
      'pageIndex': instance.page,
      'pageSize': instance.size,
      'isVerified': instance.status,
    };

_ListCardInfoResponse _$ListCardInfoResponseFromJson(
        Map<String, dynamic> json) =>
    _ListCardInfoResponse(
      status: (json['status'] as num?)?.toInt(),
      errorCode: json['errorCode'] as String?,
      errorDesc: json['errorDesc'] as String?,
      clientMessageId: json['clientMessageId'] as String?,
      data: json['data'] == null
          ? null
          : ListCardInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListCardInfoResponseToJson(
        _ListCardInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorCode': instance.errorCode,
      'errorDesc': instance.errorDesc,
      'clientMessageId': instance.clientMessageId,
      'data': instance.data,
    };

_ListCardInfoData _$ListCardInfoDataFromJson(Map<String, dynamic> json) =>
    _ListCardInfoData(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => CardInfoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ListCardInfoDataToJson(_ListCardInfoData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'count': instance.count,
    };

_CardInfoItem _$CardInfoItemFromJson(Map<String, dynamic> json) =>
    _CardInfoItem(
      id: (json['id'] as num?)?.toInt(),
      pointVerify: (json['pointVerify'] as num?)?.toInt(),
      imgPath: json['imgPath'] as String?,
      name: json['name'] as String?,
      status: $enumDecodeNullable(_$CardStatusEEnumMap, json['status']),
      idNumber: json['idNumber'] as String?,
      gender: $enumDecodeNullable(_$GenderCardEEnumMap, json['gender']),
      nationality: json['nationality'] as String?,
      refVisaType: json['refVisaType'] as String?,
      issuedDate: json['issuedDate'] as String?,
      digitalSignature: json['digitalSignature'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      qrCode: json['qrCode'] as String?,
      shareLink: json['shareLink'] as String?,
      address: json['address'] as String?,
      issuingAuthority: json['issuingAuthority'] as String?,
      blockHeight: json['blockHeight'] as String?,
      txId: json['txId'] as String?,
      did: json['did'] as String?,
    );

Map<String, dynamic> _$CardInfoItemToJson(_CardInfoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pointVerify': instance.pointVerify,
      'imgPath': instance.imgPath,
      'name': instance.name,
      'status': instance.status,
      'idNumber': instance.idNumber,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'refVisaType': instance.refVisaType,
      'issuedDate': instance.issuedDate,
      'digitalSignature': instance.digitalSignature,
      'phoneNumber': instance.phoneNumber,
      'qrCode': instance.qrCode,
      'shareLink': instance.shareLink,
      'address': instance.address,
      'issuingAuthority': instance.issuingAuthority,
      'blockHeight': instance.blockHeight,
      'txId': instance.txId,
      'did': instance.did,
    };

const _$CardStatusEEnumMap = {
  CardStatusE.unVerified: 0,
  CardStatusE.verified: 1,
};

const _$GenderCardEEnumMap = {
  GenderCardE.male: 'male',
  GenderCardE.female: 'female',
};
