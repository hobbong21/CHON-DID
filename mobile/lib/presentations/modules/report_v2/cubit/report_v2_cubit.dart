import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_v2_state.dart';
part 'report_v2_cubit.freezed.dart';

/// Cubit for the Report flow — Figma section 11.
///
/// Stages: list → compose → submitting → submitted (or failed).
/// Repository-injected so tests can hand it a mock without GetIt.
class ReportV2Cubit extends Cubit<ReportV2State> {
  ReportV2Cubit({required ReportRepo reportRepo})
      : _reportRepo = reportRepo,
        super(ReportV2State());

  final ReportRepo _reportRepo;

  Future<void> loadReports() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final list = await _reportRepo.getListReport();
      emit(state.copyWith(isLoading: false, reports: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void openCompose() {
    emit(state.copyWith(
      stage: ReportV2Stage.compose,
      title: '',
      content: '',
      attachmentBase64: null,
      errorMessage: '',
    ));
  }

  void onTitleChanged(String v) {
    if (v == state.title) return;
    emit(state.copyWith(title: v, errorMessage: ''));
  }

  void onContentChanged(String v) {
    if (v == state.content) return;
    emit(state.copyWith(content: v, errorMessage: ''));
  }

  void onFullNameChanged(String v) {
    if (v == state.fullName) return;
    emit(state.copyWith(fullName: v));
  }

  void onEmailChanged(String v) {
    if (v == state.email) return;
    emit(state.copyWith(email: v));
  }

  void attachFile(String base64) {
    emit(state.copyWith(attachmentBase64: base64));
  }

  void clearAttachment() {
    emit(state.copyWith(attachmentBase64: null));
  }

  Future<void> submit() async {
    if (state.title.trim().isEmpty || state.content.trim().isEmpty) {
      emit(state.copyWith(errorMessage: '제목과 내용을 입력해주세요.'));
      return;
    }
    emit(state.copyWith(stage: ReportV2Stage.submitting, isLoading: true));
    try {
      await _reportRepo.createReport(
        report: CreateReportRequest(
          fullName: state.fullName,
          email: state.email,
          title: state.title,
          content: state.content,
          file: state.attachmentBase64,
        ),
      );
      emit(state.copyWith(
        stage: ReportV2Stage.submitted,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        stage: ReportV2Stage.failed,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void backToList() {
    emit(state.copyWith(
      stage: ReportV2Stage.list,
      title: '',
      content: '',
      attachmentBase64: null,
      errorMessage: '',
    ));
  }

  void retryFromFailed() {
    emit(state.copyWith(stage: ReportV2Stage.compose, errorMessage: ''));
  }
}
