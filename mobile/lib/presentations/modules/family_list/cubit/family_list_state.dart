part of 'family_list_cubit.dart';

@freezed
abstract class FamilyListState with _$FamilyListState {
  factory FamilyListState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<RelationUserModel> relations,
  }) = _FamilyListState;
}
