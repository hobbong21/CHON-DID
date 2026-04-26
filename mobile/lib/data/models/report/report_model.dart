import 'package:base_flutter/core/utils/datetime_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class CreateReportRequest with _$CreateReportRequest {
  const factory CreateReportRequest({
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'file') String? file,
  }) = _CreateReportRequest;

  factory CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);
}

@freezed
abstract class ReportModel with _$ReportModel {
  const factory ReportModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'filePath') String? filePath,
    @JsonKey(
      name: 'createdTime',
      fromJson: ReportModel.dateFromJson,
      toJson: ReportModel.dateToJson,
    )
    String? createdTime,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  static String? dateFromJson(dynamic dateString) {
    return DateTimeUtils.convertDateToString(dateString, 'yyyy.MM.dd');
  }

  static String? dateToJson(String? date) {
    return DateTimeUtils.convertStringToDate(date, 'yyyy.MM.dd')
        ?.toIso8601String();
  }

  static DateTime? dateTimeFromJson(dynamic dateString) {
    return DateTimeUtils.convertStringToDate(dateString, 'yyyy.MM.dd');
  }
}
