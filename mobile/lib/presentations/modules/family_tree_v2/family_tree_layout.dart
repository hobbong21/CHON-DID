import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:flutter/widgets.dart';

/// One placed node in the laid-out tree. Coordinate origin is top-left
/// of the canvas, so placing a SizedBox(width: width, height: height) at
/// (offset.dx, offset.dy) renders the node at the right spot.
class PlacedNode {
  PlacedNode({
    required this.node,
    required this.offset,
    required this.size,
  });

  final FamilyTreeNode node;
  final Offset offset;
  final Size size;

  Rect get rect => offset & size;
  Offset get center => Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height / 2,
      );
  Offset get bottomCenter => Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height,
      );
  Offset get topCenter => Offset(
        offset.dx + size.width / 2,
        offset.dy,
      );
}

/// Output of the layout pass.
class FamilyTreeLayout {
  FamilyTreeLayout({
    required this.placed,
    required this.canvas,
  });

  final List<PlacedNode> placed;
  final Size canvas;

  PlacedNode? findById(int id) {
    for (final p in placed) {
      if (p.node.id == id) return p;
    }
    return null;
  }
}

/// Lay out a list of root [FamilyTreeNode]s into a 2D canvas.
///
/// Algorithm (a stripped-down Reingold–Tilford):
/// 1. Recursively measure each subtree's footprint width.
/// 2. Place each node at the horizontal center of its subtree's slot.
/// 3. Stack roots horizontally so multiple disjoint trees render
///    side-by-side without overlap.
///
/// Each node is rendered at [nodeSize]; siblings are separated by
/// [hGap] horizontal gap, generations by [vGap] vertical gap.
FamilyTreeLayout layoutForest(
  List<FamilyTreeNode> roots, {
  Size nodeSize = const Size(96, 96),
  double hGap = 16,
  double vGap = 32,
}) {
  if (roots.isEmpty) {
    return FamilyTreeLayout(placed: const [], canvas: Size.zero);
  }

  double cursorX = 0;
  double maxBottom = 0;
  final placed = <PlacedNode>[];

  for (final root in roots) {
    final width = _placeSubtree(
      root,
      x: cursorX,
      y: 0,
      placed: placed,
      nodeSize: nodeSize,
      hGap: hGap,
      vGap: vGap,
    );
    cursorX += width + hGap;
  }

  for (final p in placed) {
    final bottom = p.offset.dy + p.size.height;
    if (bottom > maxBottom) maxBottom = bottom;
  }

  return FamilyTreeLayout(
    placed: placed,
    canvas: Size(cursorX - hGap, maxBottom),
  );
}

/// Place [node] and its descendants. Returns the **horizontal footprint**
/// (width) of the subtree rooted at [node].
double _placeSubtree(
  FamilyTreeNode node, {
  required double x,
  required double y,
  required List<PlacedNode> placed,
  required Size nodeSize,
  required double hGap,
  required double vGap,
}) {
  if (node.children.isEmpty) {
    placed.add(PlacedNode(
      node: node,
      offset: Offset(x, y),
      size: nodeSize,
    ));
    return nodeSize.width;
  }

  double childCursor = x;
  final childWidths = <double>[];
  final childYs = y + nodeSize.height + vGap;

  for (final child in node.children) {
    final w = _placeSubtree(
      child,
      x: childCursor,
      y: childYs,
      placed: placed,
      nodeSize: nodeSize,
      hGap: hGap,
      vGap: vGap,
    );
    childWidths.add(w);
    childCursor += w + hGap;
  }
  // childCursor includes the trailing hGap; remove it.
  final totalChildrenWidth = childCursor - x - hGap;

  // The parent goes centered above its children's footprint.
  final parentWidth = nodeSize.width;
  final myFootprint =
      totalChildrenWidth > parentWidth ? totalChildrenWidth : parentWidth;

  final parentX = x + (myFootprint - parentWidth) / 2;
  placed.add(PlacedNode(
    node: node,
    offset: Offset(parentX, y),
    size: nodeSize,
  ));

  return myFootprint;
}
