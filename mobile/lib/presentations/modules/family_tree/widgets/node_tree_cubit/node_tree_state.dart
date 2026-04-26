part of 'node_tree_cubit.dart';

@freezed
abstract class NodeTreeState with _$NodeTreeState {
  factory NodeTreeState({
    PersonNode? root,
    PersonNode? maternal,
    PersonNode? selectedNode,
    @Default(0) int count,
  }) = _NodeTreeState;
}

class PersonNode {
  final int id;
  List<PersonNode> children;
  PersonNode? spouse;
  RelationUserModel model;

  Offset position = Offset.zero;
  Offset coupleposition = Offset.zero;
  double subtreeWidth = 0;

  /// including the children that have been collaped
  List<PersonNode> fullChildren;

  /// including the spouse that have been collaped
  PersonNode? fullSpouse;

  Rect? rect;

  PersonNode({
    required this.id,
    required this.model,
    List<PersonNode>? children,
    List<PersonNode>? fullChildren,
  })  : children = children ?? [],
        fullChildren = fullChildren ?? [];
}
