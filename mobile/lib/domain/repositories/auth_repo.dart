import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:base_flutter/data/data_source/remote/dio.dart';
import 'package:base_flutter/data/models/auth/login_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repo.g.dart';

@RestApi()
abstract class AuthRepo {
  factory AuthRepo(
    Dio dio, {
    String baseUrl,
  }) = _AuthRepo;

  @POST(ApiEndpoints.login)
  Future<LoginModel> login({
    @Field() required String username,
    @Field() required String password,
    @Field() String grantType = "password",
    @Field() String clientId = "cms-parking",
    @Field() String clientSecret = "",
  });

  @FormUrlEncoded()
  @POST(ApiEndpoints.refreshToken)
  Future<LoginModel> refreshToken({
    @Field() required String refreshToken,
    @Header(DioInjection.kUnauth) String unauth = '',
    @Field() String grantType = "refresh_token",
    @Field() String clientId = "cms-parking",
    @Field() String clientSecret = "LN1LjiodrgAeKi071TAPjHZLoCdjI0Ob",
  });

  @POST(ApiEndpoints.firstPassword)
  Future<bool> changePassword({
    @Field() required String tokenVerify,
    @Field() required String password,
    @Field() required String rePassword,
  });
}
