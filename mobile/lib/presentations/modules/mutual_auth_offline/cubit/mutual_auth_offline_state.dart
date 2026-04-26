part of 'mutual_auth_offline_cubit.dart';

/// Outline of the offline mutual-auth flow.
///
/// `idle` is the chooser screen (Section 6 entry — Home offline variant).
/// From there the user goes either:
///
/// - `displaying` — show their own QR (Req_02 offline `853:22949`)
/// - `scanning` — open the camera (InProc_QR_02 `376:24436`)
///
/// After a successful scan, the cubit calls `VerifyRepo.verifyDid` and
/// transitions to `verifying → result`. On the display side the cubit
/// stays in `displaying` until the user backs out.
enum MutualAuthOfflineStage {
  idle,
  displaying,
  scanning,
  verifying,
  result,
}

@freezed
abstract class MutualAuthOfflineState with _$MutualAuthOfflineState {
  factory MutualAuthOfflineState({
    @Default(MutualAuthOfflineStage.idle) MutualAuthOfflineStage stage,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,

    /// On `displaying`, the QR string that gets rendered.
    @Default(null) String? displayQr,

    /// On `result`, the card decoded from a scan.
    @Default(null) CardInfoItem? scannedCard,
  }) = _MutualAuthOfflineState;
}
