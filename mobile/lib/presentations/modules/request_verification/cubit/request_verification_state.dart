part of 'request_verification_cubit.dart';

@freezed
abstract class RequestVerificationState with _$RequestVerificationState {
  const factory RequestVerificationState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingBlock,
    @Default('') String errorMessage,
    CardInfoItem? card,
  }) = _RequestVerificationState;
}
