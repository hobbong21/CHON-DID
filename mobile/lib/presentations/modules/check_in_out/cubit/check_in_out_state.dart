part of 'check_in_out_cubit.dart';

@freezed
abstract class CheckInOutState with _$CheckInOutState {
  const factory CheckInOutState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isVisiting,
    CardInfoItem? card, 
    VisitEventModel? visitResult,
  }) = _CheckInOutState;
}