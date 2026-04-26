import 'package:base_flutter/data/models/clan/clan_model.dart';
import 'package:base_flutter/data/models/phone/phone_res.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/data/models/self_id/selfid_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/data/models/taekwondo/taekwondo_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'verify_repo.g.dart';

@RestApi()
abstract class VerifyRepo {
  factory VerifyRepo(
    Dio dio, {
    String baseUrl,
  }) = _VerifyRepo;

  @GET(ApiEndpoints.getCardInfoVerify)
  Future<CardInfoItem> getCardInfoVerify({
    @Query('token') required String token,
  });

  @POST(ApiEndpoints.confirmVerify)
  Future<void> confirmVerify({
    @Field() required int verifyType,
    @Field() required int refVerifyId,
  });

  @POST(ApiEndpoints.rejectVerify)
  Future<void> rejectVerify({
    @Field() required int verifyType,
    @Field() required int refVerifyId,
  });

  @POST(ApiEndpoints.verifySignature)
  Future<void> verifySignature({
    @Field() required String signature,
    @Field() required String rawData,
    @Field() required String publicKey,
  });

  @GET(ApiEndpoints.verifyDid)
  Future<CardInfoItem> verifyDid({
    @Query('token') required String token,
  });

  @GET(ApiEndpoints.getClanInfoVerify)
  Future<ClanModel> getClanInfoVerify({
    @Query('token') required String token,
  });

  @GET(ApiEndpoints.getTaekwondoInfoVerify)
  Future<TaekwondoModel> getTaekwondoInfoVerify({
    @Query('token') required String token,
  });

  @GET(ApiEndpoints.getRequesters)
  Future<List<VerifierModer>> getRequesters({
    @Query('verifyType') int? verifyType,
  });

  @GET(ApiEndpoints.getPhone)
  Future<PhoneRes> getPhone();

  @POST(ApiEndpoints.changePhone)
  Future<void> changePhone({
    @Field() required String phone,
  });
}
