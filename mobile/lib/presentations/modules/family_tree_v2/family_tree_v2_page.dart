import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_layout.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/widgets/family_tree_connections_painter.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/widgets/family_tree_node_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Family Tree v2 — Figma section 7 (`Family Tree_01` `517:20730`).
///
/// Architecture:
///
/// ```
///                 ┌──────────── Scaffold ─────────────┐
/// AppBar (title) │                                    │
///                │  InteractiveViewer  (zoom + pan)   │
///                │     ┌─────── Stack ──────────────┐ │
///                │     │  CustomPaint (connectors)  │ │
///                │     │  Positioned NodeCards      │ │
///                │     └────────────────────────────┘ │
///                │  Selected node detail sheet (opt)  │
///                └────────────────────────────────────┘
/// ```
///
/// The Cubit owns the data; `layoutForest` produces deterministic
/// positions; `InteractiveViewer` handles gestures.
class FamilyTreeV2Page extends StatelessWidget {
  const FamilyTreeV2Page({
    super.key,
    required this.cubit,
    this.title = '가계도',
  });

  final FamilyTreeCubit cubit;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: ChonColors.bgPage,
        appBar: AppBar(
          backgroundColor: ChonColors.bgPage,
          foregroundColor: ChonColors.textPrimary,
          elevation: 0,
          centerTitle: true,
          title: Text(title, style: ChonTextStyles.cardTitle()),
        ),
        body: BlocBuilder<FamilyTreeCubit, FamilyTreeState>(
          builder: (context, state) {
            if (state.isLoading && state.roots.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                    color: ChonColors.brandPrimary),
              );
            }
            if (state.errorMessage.isNotEmpty && state.roots.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    state.errorMessage,
                    style: ChonTextStyles.body(
                        size: 14, color: ChonColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            if (state.roots.isEmpty) {
              return Center(
                child: Text('가족 정보가 없습니다.',
                    style: ChonTextStyles.body(
                        size: 14, color: ChonColors.textSecondary)),
              );
            }
            return _TreeCanvas(
              key: const Key('familyTree.canvas'),
              state: state,
              cubit: cubit,
            );
          },
        ),
      ),
    );
  }
}

class _TreeCanvas extends StatelessWidget {
  const _TreeCanvas({
    super.key,
    required this.state,
    required this.cubit,
  });

  final FamilyTreeState state;
  final FamilyTreeCubit cubit;

  static const _nodeSize = Size(96, 96);
  static const _hGap = 16.0;
  static const _vGap = 32.0;

  @override
  Widget build(BuildContext context) {
    final layout = layoutForest(
      state.roots,
      nodeSize: _nodeSize,
      hGap: _hGap,
      vGap: _vGap,
    );

    final canvasSize = Size(
      layout.canvas.width.clamp(MediaQuery.of(context).size.width, 8000),
      layout.canvas.height + 40,
    );

    return Stack(
      children: [
        InteractiveViewer(
          minScale: 0.5,
          maxScale: 2.5,
          boundaryMargin: const EdgeInsets.all(200),
          constrained: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: canvasSize.width,
              height: canvasSize.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter:
                          FamilyTreeConnectionsPainter(layout: layout),
                    ),
                  ),
                  for (final placed in layout.placed)
                    Positioned(
                      left: placed.offset.dx,
                      top: placed.offset.dy,
                      width: placed.size.width,
                      height: placed.size.height,
                      child: FamilyTreeNodeCard(
                        node: placed.node,
                        isSelected: state.selectedId == placed.node.id,
                        onTap: () => cubit.selectNode(placed.node.id),
                        size: placed.size,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (state.selectedId != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _SelectedDetailSheet(
              key: const Key('familyTree.detail'),
              state: state,
              onClose: cubit.clearSelection,
            ),
          ),
      ],
    );
  }
}

class _SelectedDetailSheet extends StatelessWidget {
  const _SelectedDetailSheet({
    super.key,
    required this.state,
    required this.onClose,
  });

  final FamilyTreeState state;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final selected = state.roots
        .expand<FamilyTreeNode>(_descend)
        .firstWhere(
          (n) => n.id == state.selectedId,
          orElse: () => state.roots.first,
        );
    return Material(
      color: ChonColors.bgSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    selected.name ?? '?',
                    style: ChonTextStyles.cardTitle()
                        .copyWith(fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close,
                      color: ChonColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              selected.raw.certRelatedPhone ?? '-',
              style: ChonTextStyles.body(
                  size: 14, color: ChonColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<FamilyTreeNode> _descend(FamilyTreeNode n) sync* {
    yield n;
    for (final c in n.children) {
      yield* _descend(c);
    }
  }
}
