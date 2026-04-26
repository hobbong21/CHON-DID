part of 'profile_edit_cubit.dart';

@freezed
abstract class ProfileEditState with _$ProfileEditState {
  factory ProfileEditState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
  }) = _ProfileEditState;
}
