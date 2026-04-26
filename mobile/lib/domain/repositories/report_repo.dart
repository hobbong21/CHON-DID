import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/data/models/self_id/create_clan_res.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/data/data_source/remote/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'report_repo.g.dart';

@RestApi()
abstract class ReportRepo {
  factory ReportRepo(
    Dio dio, {
    String baseUrl,
  }) = _ReportRepo;

  @POST(ApiEndpoints.createReport)
  Future<CreateCertificateRes> createReport({
    @Body() required CreateReportRequest report,
  });

  @GET(ApiEndpoints.listReport)
  Future<List<ReportModel>> getListReport();
}
