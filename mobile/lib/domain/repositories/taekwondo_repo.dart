import 'package:base_flutter/data/models/self_id/create_clan_res.dart';
import 'package:base_flutter/data/models/taekwondo/taekwondo_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'taekwondo_repo.g.dart';

@RestApi()
abstract class TaekwondoRepo {
  factory TaekwondoRepo(
    Dio dio, {
    String baseUrl,
  }) = _TaekwondoRepo;

  @GET(ApiEndpoints.getTaekwondoDetail)
  Future<List<TaekwondoModel>> getTaekwondoDetail({@Path() required int id});

  @POST(ApiEndpoints.addTaekwondo)
  Future<CreateCertificateRes> addTaekwondo({
    @Body() required TaekwondoModel clan,
  });

  @POST(ApiEndpoints.updateTaekwondo)
  Future<void> updateTaekwondo({
    @Body() required TaekwondoModel clan,
  });
}
