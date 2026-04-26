import 'package:base_flutter/data/models/clan/clan_model.dart';
import 'package:base_flutter/data/models/self_id/create_clan_res.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'clan_repo.g.dart';

@RestApi()
abstract class ClanRepo {
  factory ClanRepo(
    Dio dio, {
    String baseUrl,
  }) = _ClanRepo;

  @GET(ApiEndpoints.getClanDetail)
  Future<List<ClanModel>> getClanDetail({@Path() required int id});

  @POST(ApiEndpoints.addClan)
  Future<CreateCertificateRes> addClan({
    @Body() required ClanModel clan,
  });

  @POST(ApiEndpoints.updateClan)
  Future<void> updateClan({
    @Body() required ClanModel clan,
  });
}
