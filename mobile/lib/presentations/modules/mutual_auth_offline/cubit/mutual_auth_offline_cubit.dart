import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutual_auth_offline_state.dart';
part 'mutual_auth_offline_cubit.freezed.dart';

/// Drives the offline (QR-based) mutual-auth flow — Figma section 6.
///
/// Two roles share this cubit:
///
/// - **Display side**: the user has a card; the cubit takes that card,
///   pulls its `qrCode` (or `did` as a fallback), and parks the state
///   in `displaying`. Pure UI from there — no remote calls.
/// - **Scan side**: the camera produces a token string; the cubit hits
///   `VerifyRepo.verifyDid(token)` and surfaces the decoded card.
///
/// The cubit is intentionally repository-injected so widget tests can
/// hand it a mock without touching `Injector.getIt`.
class MutualAuthOfflineCubit extends Cubit<MutualAuthOfflineState> {
  MutualAuthOfflineCubit({required VerifyRepo verifyRepo})
      : _verifyRepo = verifyRepo,
        super(MutualAuthOfflineState());

  final VerifyRepo _verifyRepo;

  // ---- Display side ---------------------------------------------------------

  /// Park the cubit in `displaying` with the QR payload from [card].
  /// Tolerates a card without `qrCode`: falls back to `did`, then to
  /// an error message.
  void startDisplay(CardInfoItem card) {
    final payload = card.qrCode?.isNotEmpty == true
        ? card.qrCode
        : (card.did?.isNotEmpty == true ? card.did : null);

    if (payload == null) {
      emit(state.copyWith(
        stage: MutualAuthOfflineStage.idle,
        errorMessage: '이 카드는 QR 정보가 없습니다.',
      ));
      return;
    }
    emit(state.copyWith(
      stage: MutualAuthOfflineStage.displaying,
      displayQr: payload,
      errorMessage: '',
    ));
  }

  // ---- Scan side ------------------------------------------------------------

  /// Open the camera (`stage: scanning`).
  void startScan() {
    emit(state.copyWith(
      stage: MutualAuthOfflineStage.scanning,
      errorMessage: '',
      scannedCard: null,
    ));
  }

  /// The camera detected a QR — verify the embedded token. On success,
  /// move to `result` with the decoded card. On error, stay in `scanning`
  /// with an error message so the camera can keep trying.
  Future<void> onScanned(String token) async {
    if (token.isEmpty) return;
    emit(state.copyWith(
      stage: MutualAuthOfflineStage.verifying,
      isLoading: true,
      errorMessage: '',
    ));
    try {
      final card = await _verifyRepo.verifyDid(token: token);
      emit(state.copyWith(
        stage: MutualAuthOfflineStage.result,
        isLoading: false,
        scannedCard: card,
      ));
    } catch (e) {
      emit(state.copyWith(
        stage: MutualAuthOfflineStage.scanning,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Reset back to the chooser. Used by the back button on either page.
  void reset() {
    emit(MutualAuthOfflineState());
  }
}
