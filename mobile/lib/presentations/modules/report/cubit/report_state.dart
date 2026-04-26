part of 'report_cubit.dart';

@freezed
abstract class ReportState with _$ReportState {
  factory ReportState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    File? selectedFile,
    @Default([]) List<ReportModel> reports,
  }) = _ReportState;
}
