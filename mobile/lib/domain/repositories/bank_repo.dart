import 'package:base_flutter/data/models/bank/bank_info_model.dart';
import 'package:base_flutter/data/models/bank/bank_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'bank_repo.g.dart';

@RestApi()
abstract class BankRepo {
  factory BankRepo(
    Dio dio, {
    String baseUrl,
  }) = _BankRepo;

  @GET(ApiEndpoints.getListBank)
  Future<List<BankModel>> getListBank();

  @GET(ApiEndpoints.getBankDetail)
  Future<BankModel> getBankDetail({
    @Path() required int id,
  });

  @POST(ApiEndpoints.addBank)
  Future<void> addBank({
    @Field() required int refBank,
    @Field() required String account,
  });

  @POST(ApiEndpoints.updateBank)
  Future<void> updateBank({
    @Field() required int id,
    @Field() required int refBank,
    @Field() required String account,
  });

  @POST(ApiEndpoints.deleteBank)
  Future<void> deleteBank({
    @Path() required int id,
  });
  @GET(ApiEndpoints.getBank)
  Future<List<BankInfoModel>> getBank();
}
