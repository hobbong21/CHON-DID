import 'package:base_flutter/data/models/family/relation_model.dart';

/// Tree node used by the v2 Family Tree screens (Figma section 7).
///
/// Wraps the raw [RelationUserModel] returned by the API and resolves
/// parent/child links into a real tree, so renderers can lay nodes out
/// without re-running graph traversal each frame.
class FamilyTreeNode {
  FamilyTreeNode({
    required this.id,
    required this.raw,
    this.name,
    this.depth = 0,
    List<FamilyTreeNode>? children,
  }) : children = children ?? [];

  final int id;
  final RelationUserModel raw;
  final String? name;

  /// Mutable so [buildForest] can fill it in via BFS after the tree is wired.
  int depth;
  final List<FamilyTreeNode> children;

  bool get isRoot => raw.parentId == null;

  /// Spouse — if any, attached as a sibling rather than a child.
  FamilyTreeNode? spouse;

  /// Builds a list of root nodes from a flat [RelationUserModel] list.
  ///
  /// - Nodes with `parentId == null` are roots.
  /// - Spouses (`spouseId`) are linked horizontally; they don't appear
  ///   as children in [FamilyTreeNode.children].
  /// - Nodes whose parent isn't in the input list become roots themselves
  ///   so that orphaned subtrees are still rendered.
  static List<FamilyTreeNode> buildForest(List<RelationUserModel> models) {
    final byId = <int, FamilyTreeNode>{};
    for (final m in models) {
      final id = m.id;
      if (id == null) continue;
      byId[id] = FamilyTreeNode(id: id, raw: m, name: m.cardName);
    }

    final roots = <FamilyTreeNode>[];

    for (final m in models) {
      final id = m.id;
      if (id == null) continue;
      final node = byId[id]!;
      final parentId = m.parentId;
      if (parentId != null && byId.containsKey(parentId)) {
        byId[parentId]!.children.add(node);
      } else {
        roots.add(node);
      }
    }

    // Wire spouses; do this in a second pass so all nodes exist.
    for (final m in models) {
      final id = m.id;
      final spouseId = m.spouseId;
      if (id == null || spouseId == null) continue;
      final node = byId[id];
      final spouseNode = byId[spouseId];
      if (node != null && spouseNode != null) {
        node.spouse = spouseNode;
      }
    }

    // Compute depths (BFS).
    for (final root in roots) {
      _setDepth(root, 0);
    }
    return roots;
  }

  static void _setDepth(FamilyTreeNode n, int d) {
    n.depth = d;
    for (final c in n.children) {
      _setDepth(c, d + 1);
    }
  }

  @override
  String toString() => 'FamilyTreeNode(id=$id, name=$name, '
      'children=${children.length}, '
      'spouse=${spouse?.id})';
}
