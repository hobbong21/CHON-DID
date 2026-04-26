import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutual_auth_receive_state.dart';
part 'mutual_auth_receive_cubit.freezed.dart';

/// Cubit for the Mutual Auth Receive flow (Figma section 5,
/// `MutualAuthRcv_01` … `MutualAuthRcv_06` + reject `RJ_01/02`).
///
/// Loads incoming requests via [RelationRepo.getListRequester], then
/// approves or rejects each via [VerifyRepo.confirmVerify] /
/// [VerifyRepo.rejectVerify].
class MutualAuthReceiveCubit extends Cubit<MutualAuthReceiveState> {
  MutualAuthReceiveCubit({
    required RelationRepo relationRepo,
    required VerifyRepo verifyRepo,
  })  : _relationRepo = relationRepo,
        _verifyRepo = verifyRepo,
        super(MutualAuthReceiveState());

  final RelationRepo _relationRepo;
  final VerifyRepo _verifyRepo;

  /// Load incoming verification requests for the given phone number.
  /// Only `unVerified` rows are kept — already-handled requests are
  /// hidden from the list.
  Future<void> load(String phoneNumber) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final list =
          await _relationRepo.getListRequester(phoneNumber: phoneNumber);
      final pending = list
          .where((r) => r.status == StatusRelationE.unVerified)
          .toList();
      emit(state.copyWith(isLoading: false, requests: pending));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// Open / close the detail sheet for a specific request.
  void selectRequest(RelationUserModel? r) {
    emit(state.copyWith(selected: r, stage: MutualAuthReceiveStage.idle));
  }

  /// Approve [state.selected]. Stage cycles approving → approved, then
  /// the request is removed from the list so the UI updates.
  Future<void> approve() async {
    final s = state.selected;
    if (s == null) return;
    final id = s.certRelatedId;
    if (id == null) {
      emit(state.copyWith(errorMessage: 'invalid request id'));
      return;
    }
    emit(state.copyWith(stage: MutualAuthReceiveStage.approving, isLoading: true));
    try {
      await _verifyRepo.confirmVerify(
        verifyType: VerifyTypeE.cardFamily.index,
        refVerifyId: id,
      );
      emit(state.copyWith(
        stage: MutualAuthReceiveStage.approved,
        isLoading: false,
        requests: state.requests.where((r) => r.id != s.id).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        stage: MutualAuthReceiveStage.idle,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Reject [state.selected]. Same shape as [approve].
  Future<void> reject() async {
    final s = state.selected;
    if (s == null) return;
    final id = s.certRelatedId;
    if (id == null) {
      emit(state.copyWith(errorMessage: 'invalid request id'));
      return;
    }
    emit(state.copyWith(stage: MutualAuthReceiveStage.rejecting, isLoading: true));
    try {
      await _verifyRepo.rejectVerify(
        verifyType: VerifyTypeE.cardFamily.index,
        refVerifyId: id,
      );
      emit(state.copyWith(
        stage: MutualAuthReceiveStage.rejected,
        isLoading: false,
        requests: state.requests.where((r) => r.id != s.id).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        stage: MutualAuthReceiveStage.idle,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Dismiss the success / failure message and return to the list view.
  void dismiss() {
    emit(state.copyWith(
      selected: null,
      stage: MutualAuthReceiveStage.idle,
      errorMessage: '',
    ));
  }
}
