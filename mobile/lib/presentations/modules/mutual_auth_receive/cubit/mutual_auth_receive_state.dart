part of 'mutual_auth_receive_cubit.dart';

@freezed
abstract class MutualAuthReceiveState with _$MutualAuthReceiveState {
  factory MutualAuthReceiveState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<RelationUserModel> requests,

    /// Currently focused request (sheet open).
    @Default(null) RelationUserModel? selected,

    /// One of: idle, approving, rejecting, approved, rejected.
    @Default(MutualAuthReceiveStage.idle) MutualAuthReceiveStage stage,
  }) = _MutualAuthReceiveState;
}

enum MutualAuthReceiveStage { idle, approving, rejecting, approved, rejected }
