import 'package:base_flutter/flavors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_info_model.freezed.dart';
part 'bank_info_model.g.dart';

@freezed
abstract class BankInfoModel with _$BankInfoModel {
  const BankInfoModel._();

  const factory BankInfoModel({
    @JsonKey(name: 'id') int? refBank,
    @JsonKey(name: 'bankName') String? name,
    @JsonKey(name: 'iconPath') String? iconPath,
  }) = _BankInfoModel;

  factory BankInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankInfoModelFromJson(json);

  String? get iconUrl {
    return F.imageUrl(iconPath ?? '');
  }
}
