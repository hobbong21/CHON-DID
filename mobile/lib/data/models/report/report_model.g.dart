// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    _CreateReportRequest(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$CreateReportRequestToJson(
        _CreateReportRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'title': instance.title,
      'content': instance.content,
      'file': instance.file,
    };

_ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => _ReportModel(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      filePath: json['filePath'] as String?,
      createdTime: ReportModel.dateFromJson(json['createdTime']),
    );

Map<String, dynamic> _$ReportModelToJson(_ReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'title': instance.title,
      'content': instance.content,
      'filePath': instance.filePath,
      'createdTime': ReportModel.dateToJson(instance.createdTime),
    };
