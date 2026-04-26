import 'package:base_flutter/data/models/bank/bank_model.dart';
import 'package:base_flutter/data/models/category/category_model.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'category_repo.g.dart';

@RestApi()
abstract class CategoryRepo {
  factory CategoryRepo(
    Dio dio, {
    String baseUrl,
  }) = _CategoryRepo;

  @GET(ApiEndpoints.getListCategory)
  Future<List<CategoryModel>> getListCategory({@Field() required String code});

  @GET(ApiEndpoints.getListSubCategory)
  Future<BankModel> getListSubCategory({@Field() required String code});
}
