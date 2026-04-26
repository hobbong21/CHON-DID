import 'dart:io';

import 'package:base_flutter/core/utils/datetime_utils.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_korean_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_generation_state.dart';
part 'id_generation_cubit.freezed.dart';

class IdGenerationCubit extends Cubit<IdGenerationState> {
  IdGenerationCubit({
    required SelfIdRepo selfIdRepo,
    required OcrRepo ocrRepo,
  })  : _selfIdRepo = selfIdRepo,
        _ocrRepo = ocrRepo,
        super(IdGenerationState());

  final SelfIdRepo _selfIdRepo;
  final OcrRepo _ocrRepo;

  void next() {
    final n = _nextStage(state.stage, verificationFailed: state.verificationFailed);
    if (n != null) emit(state.copyWith(stage: n, errorMessage: ''));
  }

  void back() {
    final p = _previousStage(state.stage);
    if (p != null) emit(state.copyWith(stage: p, errorMessage: ''));
  }

  void goTo(IdGenStage stage) {
    if (stage == state.stage) return;
    emit(state.copyWith(stage: stage, errorMessage: ''));
  }

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

  void setFrontImage(String base64) =>
      emit(state.copyWith(frontImageBase64: base64));

  void setBackImage(String base64) =>
      emit(state.copyWith(backImageBase64: base64));

  Future<void> runOcr({
    required File file,
    required String secretKey,
    String message =
        '{"version": "V2", "requestId": "id-gen", "timestamp": 0, "images": [{"format": "jpg", "name": "id"}]}',
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final res = await _ocrRepo.idCardOcr(
        secretKey: secretKey,
        file: file,
        message: message,
      );

      KoreanIdCard? card;
      final imageRes = res.images.firstOrNull;
      if (imageRes?.idCard?.result?.ic != null) {
        card = ResolveKoreanData.parseByIdCard(imageRes!.idCard!.result!.ic!);
      } else if (imageRes?.idCard?.result?.dl != null) {
        card = ResolveKoreanData.parseByDriverLicense(
            imageRes!.idCard!.result!.dl!);
      }

      if (card == null) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: '신분증을 인식하지 못했어요. 다시 촬영해주세요.',
        ));
        return;
      }

      emit(state.copyWith(
        isLoading: false,
        ocrResult: card,
        fullName: card.name ?? state.fullName,
        idNumber: card.rrn ?? state.idNumber,
        address: card.address ?? state.address,
        issuedDate: card.issueDate != null
            ? DateTimeUtils.convertDateToString(card.issueDate, 'yyyy-MM-dd')
            : state.issuedDate,
        issuingAuthority: card.issuer ?? state.issuingAuthority,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

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
      emit(state.copyWith(stage: IdGenStage.done, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

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
