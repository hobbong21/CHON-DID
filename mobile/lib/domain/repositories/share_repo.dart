import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'share_repo.g.dart';

@RestApi()
abstract class ShareRepo {
  factory ShareRepo(
    Dio dio, {
    String baseUrl,
  }) = _ShareRepo;

  @GET(ApiEndpoints.getLink)
  Future<String> getLink({
    @Query('type') required LinkTypeE type,
    @Query('verifyType') required int verifyType,
    @Query('cardId') required int cardId,
  });
}

@JsonEnum(alwaysCreate: true)
enum LinkTypeE {
  @JsonValue('verify')
  verify(),
  @JsonValue('info-verification')
  info(),
  @JsonValue('event')
  event();

  String? toJson() {
    return _$LinkTypeEEnumMap[this];
  }
}
