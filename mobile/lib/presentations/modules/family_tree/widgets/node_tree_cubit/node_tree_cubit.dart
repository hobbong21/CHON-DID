import 'dart:math';

import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_tree_state.dart';
part 'node_tree_cubit.freezed.dart';

class NodeTreeCubit extends Cubit<NodeTreeState> {
  NodeTreeCubit() : super(NodeTreeState());

  final TransformationController transformationController =
      TransformationController();

  final nodeWidth = 66.0.r;
  final nodeHeight = 66.0.r;
  double get horizontalGap => nodeWidth * 0.4;
  double get verticalGap => nodeHeight * 2.8;

  Size? parentSize;

  void updateRootFromRelationUser(List<RelationUserModel> relations) {
    final (r, maternal) = _rootFromRelation(relations);
    if (r == null) return;
    updateRoot(r, maternal);
  }

  void updateRoot(PersonNode root, [PersonNode? maternal]) {
    _calculateSubtreeWidth(root);
    _layoutTreeAdvanced(
        root, 0, (ScreenUtil().screenWidth) / 2, maternal != null);
    if (maternal != null) {
      final treeBounds = _calculateTreeBounds(root, null);
      final maxTreeRoot = _getMaxXByDepth(root);
      _calculateSubtreeWidth(maternal);
      _layoutTreeAdvanced(maternal, 0, treeBounds.right);
      final minTreeMaternal = _getMinXByDepth(maternal);
      final minDistance = _getMinDistanceByDepth(
        maxTree1: maxTreeRoot,
        minTree2: minTreeMaternal,
      );
      _layoutTreeAdvanced(
          maternal, 0, treeBounds.right + horizontalGap - minDistance);
      // _layoutTreeMaternal(maternal, 0);
    }
    emit(state.copyWith(root: root, maternal: maternal, count: 1));
  }

  double nodeDisplayWidth(PersonNode node) {
    if (node.spouse == null) return nodeWidth;
    return nodeWidth * 2 + horizontalGap;
  }

  double _calculateSubtreeWidth(PersonNode node) {
    final selfWidth = nodeDisplayWidth(node);

    if (node.children.isEmpty) {
      node.subtreeWidth = selfWidth;
      return node.subtreeWidth;
    }

    double total = 0;
    for (final child in node.children) {
      total += _calculateSubtreeWidth(child);
    }

    total += horizontalGap * (node.children.length - 1);

    node.subtreeWidth = total < selfWidth ? selfWidth : total;
    if (total < selfWidth && node.children.length == 1) {
      updateSubtreeWidthChildMatchParent(node);
    }
    return node.subtreeWidth;
  }

  void _layoutTreeAdvanced(
    PersonNode node,
    int depth,
    double startX, [
    bool isMaternal = false,
  ]) {
    final centerX = isMaternal
        ? startX + node.subtreeWidth / 2 - (nodeWidth + horizontalGap)
        : startX + node.subtreeWidth / 2;
    final centerY = depth * verticalGap + nodeHeight;

    node.coupleposition = Offset(centerX, centerY);

    final coupleSpacing =
        node.spouse == null ? 0 : (nodeWidth + horizontalGap) / 2;
    if (node.model.relationType == RelationType.father) {
      node.position = Offset(
        centerX - coupleSpacing * 2,
        centerY,
      );
    } else {
      node.position = Offset(
        centerX - coupleSpacing,
        centerY,
      );
    }

    node.rect = Rect.fromCenter(
      center: node.position,
      width: nodeWidth,
      height: nodeHeight,
    );

    if (node.spouse != null) {
      node.spouse!.position = Offset(
        centerX + coupleSpacing,
        centerY,
      );

      node.spouse!.rect = Rect.fromCenter(
        center: node.spouse!.position,
        width: nodeWidth,
        height: nodeHeight,
      );
    }

    double childStartX = startX;
    for (final child in node.children) {
      _layoutTreeAdvanced(child, depth + 1, childStartX);
      childStartX += child.subtreeWidth + horizontalGap;
    }
  }

  Map<int, double> _getMaxXByDepth(PersonNode root) {
    final Map<int, double> result = {};

    void dfs(PersonNode node, int depth) {
      double right = node.rect?.right ?? (node.position.dx + node.subtreeWidth);

      result[depth] = max(result[depth] ?? double.negativeInfinity, right);

      if (node.spouse != null &&
          node.spouse?.model.relationType != RelationType.mother) {
        double spouseRight = node.spouse!.rect?.right ?? node.coupleposition.dx;

        result[depth] = max(result[depth]!, spouseRight);
      }

      for (final child in node.children) {
        dfs(child, depth + 1);
      }
    }

    dfs(root, 0);
    return result;
  }

  Map<int, double> _getMinXByDepth(PersonNode root) {
    final Map<int, double> result = {};

    void dfs(PersonNode node, int depth) {
      double left = node.rect?.left ?? node.position.dx;

      result[depth] = min(
        result[depth] ?? double.infinity,
        left,
      );

      if (node.spouse != null) {
        double spouseLeft = node.spouse!.rect?.left ?? node.coupleposition.dx;

        result[depth] = min(result[depth]!, spouseLeft);
      }

      for (final child in node.children) {
        dfs(child, depth + 1);
      }
    }

    dfs(root, 0);
    return result;
  }

  double _getMinDistanceByDepth({
    required Map<int, double> maxTree1,
    required Map<int, double> minTree2,
  }) {
    double minDistance = double.infinity;

    for (final depth in maxTree1.keys) {
      if (!minTree2.containsKey(depth)) continue;

      final distance = minTree2[depth]! - maxTree1[depth]!;

      minDistance = min(minDistance, distance);
    }

    return minDistance;
  }

  void updateSubtreeWidthChildMatchParent(PersonNode parent) {
    if (parent.children.length == 1 &&
        parent.children.first.subtreeWidth < parent.subtreeWidth) {
      parent.children.first.subtreeWidth = parent.subtreeWidth;
      updateSubtreeWidthChildMatchParent(parent.children.first);
    }
  }

  PersonNode? onTapPosition(Offset localPosition) {
    final tree = [state.root, state.maternal];
    for (final node in tree) {
      if (node == null) return null;
      final scenePos = _toScene(localPosition);
      final nodeSelected = _hitTest(node, scenePos);
      if (nodeSelected != null) {
        debugPrint(node.id.toString());
        emit(state.copyWith(selectedNode: nodeSelected));
        return nodeSelected;
      }
    }
    return null;
  }

  PersonNode? _hitTest(PersonNode node, Offset point) {
    if (node.rect != null) {
      final frameRect = Rect.fromLTRB(
        node.rect!.left,
        node.rect!.top,
        node.rect!.right,
        node.rect!.bottom + 40.r,
      );
      if (frameRect.contains(point)) {
        return node;
      }
    }

    if (node.spouse != null) {
      final result = _hitTest(node.spouse!, point);
      if (result != null) return result;
    }

    for (final child in node.children) {
      final result = _hitTest(child, point);
      if (result != null) return result;
    }

    return null;
  }

  Offset _toScene(Offset localPos) {
    final matrix = transformationController.value;
    final inverse = Matrix4.inverted(matrix);
    return MatrixUtils.transformPoint(inverse, localPos);
  }

  Rect _calculateTreeBounds(PersonNode node, Rect? bounds) {
    if (node.rect != null) {
      bounds = bounds == null ? node.rect! : bounds.expandToInclude(node.rect!);
    }

    if (node.spouse?.rect != null) {
      bounds = bounds == null
          ? node.spouse!.rect!
          : bounds.expandToInclude(node.spouse!.rect!);
    }

    for (final child in node.children) {
      bounds = _calculateTreeBounds(child, bounds);
    }

    return bounds!;
  }

  void fitToScreen() {
    if (state.root == null) return;
    if (parentSize == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        fitToScreen();
      });
      return;
    }
    final treeBounds = _calculateTreeBounds(state.root!, null);

    final padding = 20.0.r;

    final scaleX = (parentSize!.width - padding * 2) / treeBounds.width;
    final scaleY = (parentSize!.height - padding * 2) / treeBounds.height;

    final scale = min(scaleX, scaleY).clamp(0.7, 1.0);

    final Offset treeCenter = treeBounds.center;
    final Offset viewportCenter = parentSize!.center(Offset.zero);

    final Matrix4 matrix = Matrix4.identity()
      ..translate(viewportCenter.dx, viewportCenter.dy)
      ..scale(scale)
      ..translate(-treeCenter.dx, -treeCenter.dy - nodeHeight * scale);

    transformationController.value = matrix;
  }

  (PersonNode?, PersonNode?) _rootFromRelation(
      List<RelationUserModel> relations) {
    if (relations.isEmpty) return (null, null);
    Map<int, PersonNode> map = {};
    PersonNode? selectedNodeUpdated;
    for (final p in relations) {
      if (p.id == null) continue;
      map[p.id!] = PersonNode(id: p.id!, model: p);
      if (state.selectedNode?.id == p.id) {
        selectedNodeUpdated = map[p.id];
      }
    }
    for (final p in relations) {
      final node = map[p.id];
      if (node == null) continue;

      final parentId = p.parentId;
      if (parentId != null && map.containsKey(parentId)) {
        if (!(map[parentId]?.model.isCollapsed == true)) {
          // đẩy father xuống cuối cùng để vẽ maternal
          if (map[parentId]!.children.lastOrNull?.model.relationType ==
              RelationType.father) {
            map[parentId]!
                .children
                .insert(map[parentId]!.children.length - 1, node);
          } else {
            map[parentId]!.children.add(node);
          }
        }
        map[parentId]!.fullChildren.add(node);
      }
      final spouseId = p.spouseId;
      if (spouseId != null && map.containsKey(spouseId)) {
        if (!(map[spouseId]?.model.isCollapsed == true)) {
          map[spouseId]!.spouse = node;
        }
        map[spouseId]!.fullSpouse = node;
      }
    }
    final roots = map.values.where((node) {
      final parentId = node.model.parentId;
      return parentId == null || !map.containsKey(parentId);
    }).toList();

    if (roots.isEmpty) {
      return (null, null);
    }

    if (roots.length > 1) {
      debugPrint('Multiple roots found, using first');
    }

    emit(state.copyWith(selectedNode: selectedNodeUpdated));

    return (
      roots.first,
      roots
          .where(
              (e) => e.model.relationType == RelationType.maternalGrandfather)
          .firstOrNull
    );
  }

  void selectNode(PersonNode? node) {
    emit(state.copyWith(selectedNode: node));
  }
}
