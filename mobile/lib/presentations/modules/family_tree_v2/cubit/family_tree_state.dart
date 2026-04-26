part of 'family_tree_cubit.dart';

@freezed
abstract class FamilyTreeState with _$FamilyTreeState {
  factory FamilyTreeState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<RelationUserModel> rawList,
    @Default([]) List<FamilyTreeNode> roots,

    /// Currently selected node id. `null` = nothing selected.
    @Default(null) int? selectedId,
  }) = _FamilyTreeState;
}
