part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    CardInfoItem? firstCard,
  }) = _ProfileState;
}
