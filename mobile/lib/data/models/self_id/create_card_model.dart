import 'package:base_flutter/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_card_model.freezed.dart';
part 'create_card_model.g.dart';

@freezed
abstract class CreateCardRequest with _$CreateCardRequest {
  const factory CreateCardRequest({
    @JsonKey(name: 'cardId') int? cardId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'idNumber') String? idNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
    @JsonKey(name: 'issuedDate') String? issuedDate,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'gender') GenderCardE? gender,
    @JsonKey(name: 'imgBase64') String? imgBase64,
    @JsonKey(name: 'licenseNumber') String? licenseNumber,
    @JsonKey(name: 'licenseValidity') String? licenseValidity,
    @JsonKey(name: 'expirationDatePassport') String? expirationDatePassport,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
  }) = _CreateCardRequest;

  factory CreateCardRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCardRequestFromJson(json);
}

@freezed
abstract class CreateCardResponse with _$CreateCardResponse {
  const factory CreateCardResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'errorCode') String? errorCode,
    @JsonKey(name: 'errorDesc') String? errorDesc,
    @JsonKey(name: 'data') CreateCardData? data,
  }) = _CreateCardResponse;

  factory CreateCardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCardResponseFromJson(json);
}

@freezed
abstract class CreateCardData with _$CreateCardData {
  const factory CreateCardData({
    @JsonKey(name: 'id') int? cardId,
    @JsonKey(name: 'accessToken') String? accessToken,
  }) = _CreateCardData;

  factory CreateCardData.fromJson(Map<String, dynamic> json) =>
      _$CreateCardDataFromJson(json);
}

enum GenderCardE {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  ;

  String? toJson() {
    return _$GenderCardEEnumMap[this];
  }
}

extension GenderEExt on GenderCardE {
  String get title => switch (this) {
        GenderCardE.male => S.current.male,
        GenderCardE.female => S.current.female,
      };
}
