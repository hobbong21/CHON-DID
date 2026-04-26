import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.g.dart';
part 'login_model.freezed.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'refresh_expires_in') int? refreshExpiresIn,
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'session_state') String? sessionState,
    @JsonKey(name: 'scope') String? iscoped,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
