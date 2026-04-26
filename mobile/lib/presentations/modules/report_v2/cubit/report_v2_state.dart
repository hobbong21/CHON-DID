part of 'report_v2_cubit.dart';

/// Stage of the Report (문제 신고) flow — Figma section 11.
///
/// Note: the 11 frames in section 11 are mislabeled in Figma as
/// `Edit profile_NN`. See `docs/figma/section_11_renaming.md` for
/// the suggested rename map.
enum ReportV2Stage {
  /// `Home (report)` — entry, list of past reports.
  list,

  /// `Edit profile_01..04` — compose form (title / content / attach).
  compose,

  /// `Edit profile_05..07` — submitting (loading).
  submitting,

  /// `Edit profile_08..09` — success.
  submitted,

  /// `Edit profile_10` — failed / retry.
  failed,
}

@freezed
abstract class ReportV2State with _$ReportV2State {
  factory ReportV2State({
    @Default(ReportV2Stage.list) ReportV2Stage stage,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<ReportModel> reports,

    // compose form fields
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String title,
    @Default('') String content,
    @Default(null) String? attachmentBase64,
  }) = _ReportV2State;
}
