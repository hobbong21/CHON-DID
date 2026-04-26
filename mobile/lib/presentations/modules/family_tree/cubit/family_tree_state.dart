part of 'family_tree_cubit.dart';

@freezed
abstract class FamilyTreeState with _$FamilyTreeState {
  factory FamilyTreeState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    @Default([]) List<RelationUserModel> relationUser,
    @Default([]) List<RelationModel> relationTypeList,
    CardInfoItem? card,
    PersonNode? rootNode,
  }) = _FamilyTreeState;
}
