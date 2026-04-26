import 'package:base_flutter/data/models/event/event_model.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/create_verifier_req.dart';
import 'package:base_flutter/data/models/self_id/home_info_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/data/models/self_id/selfid_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'self_id_repo.g.dart';

@RestApi()
abstract class SelfIdRepo {
  factory SelfIdRepo(
    Dio dio, {
    String baseUrl,
  }) = _SelfIdRepo;

  @GET(ApiEndpoints.getEventInfo)
  Future<List<EventModel>> getEventInfo({@Path() required int id});

  @POST(ApiEndpoints.createSelfId)
  Future<CreateCardData> createCard({
    @Body() required CreateCardRequest body,
  });

  // NOTE: `createCardSecond` (POST /identifier/create/card-second) was
  // removed on 2026-04-26 — the backend never implemented the endpoint and
  // there were zero callers in the mobile app. If the backend adds it later,
  // re-add this method and the matching `ApiEndpoints.createSecond` constant.
  // See `docs/backend_endpoint_audit.md` for the full audit trail.

  @POST(ApiEndpoints.updateSelfId)
  Future<void> updateSelfId({
    @Body() required CreateCardRequest selfidModel,
  });

  @POST(ApiEndpoints.createVerifier)
  Future<void> createVerifier({
    @Body() required CreateVerifierReq createVerifierReq,
  });

  @GET(ApiEndpoints.getHomeInfo)
  Future<List<HomeInfoModel>> getHomeInfo();

  @GET(ApiEndpoints.getListVerifier)
  Future<List<VerifierModer>> getListVerifier({
    @Query('cardId') required int cardId,
    @Query('verifyType') required int verifyType,
  });

  @GET(ApiEndpoints.getSelfIdDetail)
  Future<CardInfoItem> getSelfIdDetail({
    @Path("id") required int id,
  });

  @POST(ApiEndpoints.deleteVerifier)
  Future<void> deleteVerifier({
    @Path() required int id,
  });
  @GET(ApiEndpoints.listCardInfo)
  Future<ListCardInfoData> getListCardInfo({
    @Queries() required ListCardInfoRequest body,
  });

  @POST(ApiEndpoints.initRelationList)
  Future<void> initRelationList({
    @Path("cardId") required int cardId,
  });

  @POST(ApiEndpoints.deleteCard)
  Future<void> deleteCard({
    @Body() required List<int> ids,
  });
}
