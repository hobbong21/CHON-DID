import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutual_auth_request_state.dart';
part 'mutual_auth_request_cubit.freezed.dart';

/// Cubit that drives the Mutual Auth Request flow (Figma section 4,
/// frames `312:19987` … `473:29905`).
///
/// The cubit is intentionally repository-injected (rather than fishing
/// from `Injector.getIt`) so the tests can hand it a mock without GetIt
/// gymnastics. The production caller does:
///
/// ```dart
/// MutualAuthRequestCubit(relationRepo: Injector.getIt<RelationRepo>())
/// ```
class MutualAuthRequestCubit extends Cubit<MutualAuthRequestState> {
  MutualAuthRequestCubit({required RelationRepo relationRepo})
      : _relationRepo = relationRepo,
        super(MutualAuthRequestState());

  final RelationRepo _relationRepo;

  /// Update the phone search input. No emission if value is unchanged.
  void onPhoneChanged(String value) {
    if (value == state.phoneInput) return;
    emit(state.copyWith(phoneInput: value, errorMessage: ''));
  }

  /// Search for the target user by phone. Moves stage `search` → `confirm`
  /// when found, otherwise emits an error message and stays in `search`.
  Future<void> search() async {
    final phone = state.phoneInput.trim();
    if (phone.isEmpty) {
      emit(state.copyWith(errorMessage: S.current.chon_mauth_req_err_phone));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final list = await _relationRepo.getListRequester(phoneNumber: phone);
      final target = list.firstOrNull;
      if (target == null) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: S.current.chon_mauth_req_err_notfound,
        ));
        return;
      }
      emit(state.copyWith(
        isLoading: false,
        target: target,
        stage: MutualAuthRequestStage.confirm,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// Send the mutual-auth request. Stage `confirm` → `sending` → `awaiting`.
  /// On error, returns to `confirm` with [errorMessage] populated.
  Future<void> sendRequest({
    required GenderE gender,
    required int certOwnerId,
  }) async {
    final target = state.target;
    if (target == null) return;

    emit(state.copyWith(stage: MutualAuthRequestStage.sending, isLoading: true));
    try {
      await _relationRepo.createRelation(
        gender: gender,
        certOwnerId: certOwnerId,
        certRelatedId: target.certRelatedId,
      );
      emit(state.copyWith(
        stage: MutualAuthRequestStage.awaiting,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        stage: MutualAuthRequestStage.confirm,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Counterparty acted — record the outcome and move to `responded`.
  void onCounterpartyResponded({required bool approved}) {
    emit(state.copyWith(
      stage: MutualAuthRequestStage.responded,
      wasApproved: approved,
    ));
  }

  /// Move from `responded` → `done` after the user dismisses the result.
  void finish() {
    emit(state.copyWith(stage: MutualAuthRequestStage.done));
  }

  /// Reset back to the search step. Used when the user backs out of the
  /// confirm screen.
  void reset() {
    emit(MutualAuthRequestState(phoneInput: state.phoneInput));
  }
}
