import 'package:base_flutter/core/utils/datetime_utils.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/ocr_card_id.dart';

class ResolveKoreanData {
  static KoreanIdCard parseByIdCard(OcrIdCardIC ic) {
    return KoreanIdCard(
      idType: IdType.resident,
      name: _firstFormatted(ic.name),
      rrn: _firstFormatted(ic.personalNum),
      address: _firstFormatted(ic.address),
      issueDate: _parseIssueDate(ic.issueDate),
      issuer: _firstFormatted(ic.authority),
    );
  }

  static KoreanIdCard parseByDriverLicense(OcrIdCardDL dl) {
    final renewStartDateTime = _parseIssueDate(dl.renewStartDate);
    final renewStartDate =
        DateTimeUtils.convertDateToString(renewStartDateTime, 'yyyy.MM.dd');
    final renewEndDate = DateTimeUtils.convertDateToString(
        _parseIssueDate(dl.renewEndDate, defaultDate: renewStartDateTime),
        'yyyy.MM.dd');
    return KoreanIdCard(
      idType: IdType.driver,
      name: _firstFormatted(dl.name),
      rrn: _firstFormatted(dl.personalNum),
      address: _firstFormatted(dl.address),
      issueDate: _parseIssueDate(dl.issueDate),
      issuer: _firstFormatted(dl.authority),
      licenseNumber: _firstFormatted(dl.num),
      licenseValidity: '$renewStartDate~$renewEndDate',
    );
  }

  static String? _firstFormatted(List<OcrIdCardField>? fields) {
    if (fields == null || fields.isEmpty) return null;

    final f = fields.first;
    return f.formatted?.asString?.trim().isNotEmpty == true
        ? f.formatted!.asString!.trim()
        : f.text?.trim();
  }

  static DateTime? _parseIssueDate(List<OcrIdCardField>? fields,
      {DateTime? defaultDate}) {
    if (fields == null || fields.isEmpty) return null;

    final f = fields.first;
    final yearString = f.formatted?.year ?? '';
    final monthString = f.formatted?.month ?? '';
    final dayString = f.formatted?.day ?? '';

    final year = int.tryParse(yearString) ?? defaultDate?.year;
    final month = int.tryParse(monthString) ?? defaultDate?.month;
    final day = int.tryParse(dayString) ?? defaultDate?.day;

    if (year != null && month != null && day != null) {
      return DateTime(year, month, day);
    }
    return null;
  }
}

class KoreanIdCard {
  IdType? idType; // 주민등록증
  String? name; // 홍길순
  String? rrn; // 820701-2345678
  String? address; // 행복특별시 행복한구 행복로 1길 123
  DateTime? issueDate; // 2019-03-01
  String? issuer; // 행복한구청장
  GenderCardE? gender;
  String? licenseNumber;
  String? licenseValidity;
  DateTime? expirationDate;
  DateTime? dateOfBirth;

  KoreanIdCard({
    this.address,
    this.idType,
    this.issueDate,
    this.issuer,
    this.name,
    this.rrn,
    this.gender,
    this.licenseNumber,
    this.licenseValidity,
    this.expirationDate,
    this.dateOfBirth,
  });
}

enum IdType { resident, driver, passport }
