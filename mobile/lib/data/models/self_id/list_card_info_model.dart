import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_card_model.dart';

part 'list_card_info_model.freezed.dart';
part 'list_card_info_model.g.dart';

@freezed
abstract class ListCardInfoRequest with _$ListCardInfoRequest {
  const factory ListCardInfoRequest({
    @JsonKey(name: 'pageIndex') int? page,
    @JsonKey(name: 'pageSize') int? size,
    @JsonKey(name: 'isVerified') bool? status,
  }) = _ListCardInfoRequest;

  factory ListCardInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoRequestFromJson(json);
}

@freezed
abstract class ListCardInfoResponse with _$ListCardInfoResponse {
  const factory ListCardInfoResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'errorCode') String? errorCode,
    @JsonKey(name: 'errorDesc') String? errorDesc,
    @JsonKey(name: 'clientMessageId') String? clientMessageId,
    @JsonKey(name: 'data') ListCardInfoData? data,
  }) = _ListCardInfoResponse;

  factory ListCardInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoResponseFromJson(json);
}

@freezed
abstract class ListCardInfoData with _$ListCardInfoData {
  const factory ListCardInfoData({
    @JsonKey(name: 'list') List<CardInfoItem>? list,
    @JsonKey(name: 'count') int? count,
  }) = _ListCardInfoData;

  factory ListCardInfoData.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoDataFromJson(json);
}

@freezed
abstract class CardInfoItem with _$CardInfoItem {
  const factory CardInfoItem({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'pointVerify') int? pointVerify,
    @JsonKey(name: 'imgPath') String? imgPath,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'status') CardStatusE? status,
    @JsonKey(name: 'idNumber') String? idNumber,
    @JsonKey(name: 'gender') GenderCardE? gender,
    @JsonKey(name: 'nationality') String? nationality,
    @JsonKey(name: 'refVisaType') String? refVisaType,
    @JsonKey(name: 'issuedDate') String? issuedDate,
    @JsonKey(name: 'digitalSignature') String? digitalSignature,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'qrCode') String? qrCode,
    @JsonKey(name: 'shareLink') String? shareLink,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
    @JsonKey(name: 'blockHeight') String? blockHeight,
    @JsonKey(name: 'txId') String? txId,
    @JsonKey(name: 'did') String? did,
  }) = _CardInfoItem;

  factory CardInfoItem.fromJson(Map<String, dynamic> json) =>
      _$CardInfoItemFromJson(json);
}

enum CardStatusE {
  @JsonValue(0)
  unVerified,
  @JsonValue(1)
  verified,
  ;

  int? toJson() {
    return _$CardStatusEEnumMap[this];
  }
}
