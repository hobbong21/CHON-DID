part of 'verification_cross_cubit.dart';

@freezed
abstract class VerificationCrossState with _$VerificationCrossState {
  factory VerificationCrossState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<RelationUserModel> relations,
    CardInfoItem? card,
  }) = _VerificationCrossState;
}
