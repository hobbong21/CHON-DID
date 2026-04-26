import 'dart:io';

import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportState());

  final _repo = Injector.getIt<ReportRepo>();

  final keyForm = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void onImageSelected(File file) =>
      emit(state.copyWith(selectedFile: file, messageError: ''));

  Future<void> create() async {
    if (keyForm.currentState?.validate() != true) return;
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      await _repo.createReport(
          report: CreateReportRequest(
        content: contentController.text,
        email: emailController.text,
        fullName: nameController.text,
        title: titleController.text,
        file: state.selectedFile != null
            ? AppUtils.fileToBase64(state.selectedFile!)
            : null,
      ));
      emit(state.copyWith(isLoading: false));
      clear();
      AppUtils.showSnackBarSuccess(
        context: AppNavigator.context,
        title: S.current.success,
      );
      getList();
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          messageError: e.toString(),
        ),
      );
    }
  }

  clear() {
    nameController.clear();
    emailController.clear();
    titleController.clear();
    contentController.clear();
  }

  Future<void> getList() async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      final res = await _repo.getListReport();
      emit(state.copyWith(isLoading: false, reports: res));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          messageError: e.toString(),
        ),
      );
    }
  }
}
