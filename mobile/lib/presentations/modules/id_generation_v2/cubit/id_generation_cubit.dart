import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_generation_state.dart';
part 'id_generation_cubit.freezed.dart';

/// Cubit that orchestrates the ID Generation flow — Figma section 3.
///
/// 10 phases drive the page; the page renders a small leaf widget for
/// each. SelfIdRepo is injected so tests can drive the create call
/// without GetIt.
class IdGenerationCubit extends Cubit<IdGenerationState> {
  IdGenerationCubit({required SelfIdRepo selfIdRepo})
      : _selfIdRepo = selfIdRepo,
        super(IdGenerationState());

  final SelfIdRepo _selfIdRepo;

  // ---- Linear navigation -------------------------------------------------

  void next() {
    final next = _nextStage(state.stage, verificationFailed: state.verificationFailed);
    if (next != null) emit(state.copyWith(stage: next, errorMessage: ''));
  }

  void back() {
    final prev = _previousStage(state.stage);
    if (prev != null) emit(state.copyWith(stage: prev, errorMessage: ''));
  }

  void goTo(IdGenStage stage) {
    if (stage == state.stage) return;
    emit(state.copyWith(stage: stage, errorMessage: ''));
  }

  // ---- Phase mutations ---------------------------------------------------

  void setIdType(IdGenType t) => emit(state.copyWith(idType: t));

  void onPersonalInfoChanged({
    String? fullName,
    String? idNumber,
    String? address,
    String? issuedDate,
    String? issuingAuthority,
  }) {
    emit(state.copyWith(
      fullName: fullName ?? state.fullName,
      idNumber: idNumber ?? state.idNumber,
      address: address ?? state.address,
      issuedDate: issuedDate ?? state.issuedDate,
      issuingAuthority: issuingAuthority ?? state.issuingAuthority,
    ));
  }

  void markVerification({required bool ok}) {
    emit(state.copyWith(
      stage: IdGenStage.verificationOk,
      verificationFailed: !ok,
    ));
  }

  void setFrontImage(String base64) {
    emit(state.copyWith(frontImageBase64: base64));
  }

  void setBackImage(String base64) {
    emit(state.copyWith(backImageBase64: base64));
  }

  // ---- Final submit ------------------------------------------------------

  Future<void> submit() async {
    if (state.fullName.isEmpty || state.idNumber.isEmpty) {
      emit(state.copyWith(errorMessage: '필수 정보가 누락되었습니다.'));
      return;
    }
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      await _selfIdRepo.createCard(
        body: CreateCardRequest(
          name: state.fullName,
          idNumber: state.idNumber,
          address: state.address.isEmpty ? null : state.address,
          issuedDate: state.issuedDate.isEmpty ? null : state.issuedDate,
          issuingAuthority:
              state.issuingAuthority.isEmpty ? null : state.issuingAuthority,
          imgBase64: state.frontImageBase64,
        ),
      );
      emit(state.copyWith(
        stage: IdGenStage.done,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // ---- Private -----------------------------------------------------------

  static IdGenStage? _nextStage(
    IdGenStage current, {
    required bool verificationFailed,
  }) {
    switch (current) {
      case IdGenStage.start:
        return IdGenStage.personalInfo;
      case IdGenStage.personalInfo:
        return IdGenStage.verificationOk;
      case IdGenStage.verificationOk:
        // Failure state stays inside verificationOk; success advances.
        return verificationFailed ? null : IdGenStage.selectIdType;
      case IdGenStage.selectIdType:
        return IdGenStage.capturePrep;
      case IdGenStage.capturePrep:
        return IdGenStage.captureFront;
      case IdGenStage.captureFront:
        return IdGenStage.captureBack;
      case IdGenStage.captureBack:
        return IdGenStage.ocrConfirm;
      case IdGenStage.ocrConfirm:
        return IdGenStage.review;
      case IdGenStage.review:
        return IdGenStage.done;
      case IdGenStage.done:
        return null;
    }
  }

  static IdGenStage? _previousStage(IdGenStage current) {
    final all = IdGenStage.values;
    final i = all.indexOf(current);
    if (i <= 0) return null;
    return all[i - 1];
  }
}
