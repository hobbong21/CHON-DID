part of 'mutual_auth_request_cubit.dart';

/// Stage of the request flow. Maps roughly to the 6 Figma screens
/// `MutualAuthReq_01` … `MutualAuthReq_06` (`312:19987` …).
enum MutualAuthRequestStage {
  /// Req_01 — phone / target search.
  search,

  /// Req_02 — confirm the target and the relation.
  confirm,

  /// Req_03 — request is being sent (loading).
  sending,

  /// Req_04 — request sent; waiting for the other side.
  awaiting,

  /// Req_05 — counterparty took action (approved / rejected).
  responded,

  /// Req_06 — flow finished, certificate issued.
  done,
}

@freezed
abstract class MutualAuthRequestState with _$MutualAuthRequestState {
  factory MutualAuthRequestState({
    @Default(MutualAuthRequestStage.search) MutualAuthRequestStage stage,
    @Default('') String phoneInput,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,

    /// Set after a successful search — the user we'll request auth from.
    @Default(null) RelationUserModel? target,

    /// Final approval state populated when stage is `responded`.
    @Default(false) bool? wasApproved,
  }) = _MutualAuthRequestState;
}
