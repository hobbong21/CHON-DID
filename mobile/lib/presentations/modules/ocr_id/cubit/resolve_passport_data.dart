import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/ocr_passport.dart';
import 'package:intl/intl.dart';

import 'resolve_korean_data.dart';

class ResolveKoreanDataPassport {
  static KoreanIdCard parsePassport(OcrPassport passport) {
    final p = passport.passportResult;

    final firstName = p?.firstName?.asString?.replaceAll('-', ' ');
    final lastName = p?.lastName1?.asString?.replaceAll('-', ' ');
    final rrn = p?.documentNumber?.asString;
    final dateOfExpiry = p?.dateOfExpiry?.asString;
    final age = p?.age?.asInt;
    final gender = p?.gender?.asString?.toLowerCase();
    final issuer = p?.issuingStateCode?.asString;

    return KoreanIdCard(
      idType: IdType.passport,
      name: _joinName(firstName, lastName),
      rrn: rrn,
      address: null,
      issueDate: _parseIssueDate(dateOfExpiry, age),
      issuer: issuer?.toLowerCase() == 'Korea (the Republic of)'.toLowerCase()
          ? 'Republic of Korea'
          : issuer,
      gender: gender == 'female'
          ? GenderCardE.female
          : gender == 'male'
              ? GenderCardE.male
              : null,
      expirationDate: dateOfExpiry != null
          ? DateFormat('yyyy/MM/dd').parse(dateOfExpiry)
          : null,
      dateOfBirth: p?.dateOfBirth != null ? _parseDate(p?.dateOfBirth) : null,
    );
  }

  static String? _joinName(String? last, String? first) {
    if ((last ?? '').isEmpty && (first ?? '').isEmpty) return null;
    return [last, first]
        .where((e) => e != null && e.isNotEmpty)
        .join(' ')
        .trim();
  }

  static DateTime? _parseDate(OcrPassportField? field) {
    if (field == null) return null;

    return DateFormat('yyyy/MM/dd')
        .tryParse(field.asString?.replaceAll(' ', '') ?? '');
  }

  static DateTime? _parseIssueDate(String? dateOfExpiry, int? old) {
    if (dateOfExpiry == null) return null;

    final expiryDate =
        DateFormat('yyyy/MM/dd').tryParse(dateOfExpiry.replaceAll(' ', ''));

    if (expiryDate == null) return null;

    final estimatedYears = _estimatePassportValidityYears(age: old) ?? 10;

    return DateTime(
      expiryDate.year - estimatedYears,
      expiryDate.month,
      expiryDate.day,
    );
  }

  static int? _estimatePassportValidityYears({
    int? age,
  }) {
    if (age == null) return null;

    if (age >= 18) return 10;
    return 5;
  }
}
