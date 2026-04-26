import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'relation_repo.g.dart';

@RestApi()
abstract class RelationRepo {
  factory RelationRepo(
    Dio dio, {
    String baseUrl,
  }) = _RelationRepo;

  @POST(ApiEndpoints.getRelationList)
  Future<List<RelationUserModel>> getRelationList({
    @Field('certOwnerId') int? certOwnerId,
    @Field('phoneNumber') String? phoneNumber,
  });

  @POST(ApiEndpoints.getListRequester)
  Future<List<RelationUserModel>> getListRequester({
    @Field('phoneNumber') required String phoneNumber,
  });

  @POST(ApiEndpoints.createRelation)
  Future<RelationUserModel> createRelation({
    @Field('gender') required GenderE gender,
    @Field('parentId') int? parentId,
    @Field('spouseId') int? spouseId,
    @Field('certOwnerId') required int certOwnerId,
    @Field('certRelatedId') int? certRelatedId,
    @Field('certRelatedName') String? certRelatedName,
    @Field('certRelatedPhone') String? certRelatedPhone,
    @Field('relationId') required int relationId,
    @Field('isActive') int isActive = 1,
  });

  @PUT(ApiEndpoints.updateRelation)
  Future<void> updateRelation({
    @Field('id') int? id,
    @Field('gender') GenderE? gender,
    @Field('certRelatedName') String? certRelatedName,
    @Field('certRelatedPhone') String? certRelatedPhone,
    @Field('certRelatedId') int? certRelatedId,
    @Field('isCollapsed') bool? isCollapsed,
    @Field('parentId') int? parentId,
  });

  @DELETE(ApiEndpoints.deleteRelation)
  Future<void> deleteRelation({
    @Path('id') int? id,
  });

  @GET(ApiEndpoints.getListRelationType)
  Future<List<RelationModel>> getListRelationType();
}
