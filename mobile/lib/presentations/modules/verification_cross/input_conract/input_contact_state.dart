part of 'input_contact_cubit.dart';

@freezed
abstract class InputContactState with _$InputContactState {
  factory InputContactState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(RelationUserModel()) RelationUserModel relation,
  }) = _InputContactState;
}
