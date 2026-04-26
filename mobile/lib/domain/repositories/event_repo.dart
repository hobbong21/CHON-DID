import 'package:base_flutter/data/models/event/certificate_verified_model.dart';
import 'package:base_flutter/data/models/event/event_model.dart';
import 'package:base_flutter/data/models/event/visit_event_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'event_repo.g.dart';

@RestApi()
abstract class EventRepo {
  factory EventRepo(
    Dio dio, {
    String baseUrl,
  }) = _EventRepo;

  @GET(ApiEndpoints.getEventInfo)
  Future<List<EventModel>> getEventInfo({@Path() required int id});

  @POST(ApiEndpoints.visitEvent)
  Future<VisitEventModel> visitEvent({
    @Field() required int eventId,
    @Field() required VisitEventActionT actionType,
    @Field() required int certificateType,
    @Field() required int cardId,
  });

  @GET(ApiEndpoints.eventListVerified)
  Future<List<CertificateVerifiedModel>> eventListVerified();
}
