import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/family_tree/widgets/node_tree_cubit/image_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'node_tree_cubit/node_tree_cubit.dart';

class NodeTreeView extends StatefulWidget {
  final NodeTreeCubit controller;
  const NodeTreeView({super.key, required this.controller});

  @override
  State<NodeTreeView> createState() => _NodeTreeViewState();
}

class _NodeTreeViewState extends State<NodeTreeView> {
  final imageStore = AvatarImageStore();

  @override
  void initState() {
    super.initState();
    imageStore.loadAll([
      'assets/images/grandfather.png',
      'assets/images/grandma.png',
      'assets/images/brother.png',
      'assets/images/sister.png',
      'assets/images/grandson.png',
      'assets/images/niece.png',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return BlocBuilder<NodeTreeCubit, NodeTreeState>(
        bloc: widget.controller,
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            final parentWidth = constraints.maxWidth;
            final parentHeight = constraints.maxHeight;
            widget.controller.parentSize = Size(parentWidth, parentHeight);
            return GestureDetector(
              onTapDown: (details) {
                widget.controller.onTapPosition(details.localPosition);
              },
              child: InteractiveViewer(
                transformationController:
                    widget.controller.transformationController,
                boundaryMargin: EdgeInsets.all(3000.r),
                minScale: 0.3,
                maxScale: 3,
                child: widget.controller.state.root != null
                    ? CustomPaint(
                        size: Size(5000.r, 5000.r),
                        painter: FamilyTreePainter(
                          root: widget.controller.state.root!,
                          maternal: widget.controller.state.maternal,
                          selectedNode: widget.controller.state.selectedNode,
                          theme: theme,
                          colors: colors,
                          nodeWidth: widget.controller.nodeWidth,
                          nodeHeight: widget.controller.nodeHeight,
                          imageStore: imageStore,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            );
          });
        });
  }
}

class FamilyTreePainter extends CustomPainter {
  final PersonNode root;
  final PersonNode? maternal;
  final PersonNode? selectedNode;
  final ThemeData theme;
  final AppColors colors;
  final double nodeWidth;
  final double nodeHeight;
  final AvatarImageStore imageStore;

  double get indentedY => nodeHeight * 0.9;
  double get indentedTopY => indentedY * 1.6;
  double get allTextHeight => 44.r;

  FamilyTreePainter({
    required this.root,
    this.maternal,
    this.selectedNode,
    required this.theme,
    required this.colors,
    required this.nodeWidth,
    required this.nodeHeight,
    required this.imageStore,
  }) : super(repaint: imageStore);

  @override
  void paint(Canvas canvas, Size size) {
    _drawConnections(canvas, root);
    _drawNodes(canvas, root);

    if (maternal != null) {
      _drawConnections(canvas, maternal!);
      _drawNodes(canvas, maternal!);
    }
  }

  void _drawConnections(Canvas canvas, PersonNode node) {
    // if (node == selectedNode) return;
    final paint = Paint()
      ..color = colors.primary
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    if (node.spouse != null) {
      canvas.drawLine(
        node.position,
        node.spouse!.position,
        paint,
      );
    }

    for (final child in node.children) {
      if (node.spouse != null) {
        canvas.drawLine(
          node.position + Offset(0, nodeHeight / 2 + allTextHeight),
          Offset(node.position.dx, child.position.dy - indentedTopY),
          paint,
        );
        canvas.drawLine(
          Offset(node.position.dx, child.position.dy - indentedTopY),
          Offset(node.spouse!.position.dx, child.position.dy - indentedTopY),
          paint,
        );
        canvas.drawLine(
          Offset(node.spouse!.position.dx, child.position.dy - indentedTopY),
          node.spouse!.position + Offset(0, nodeHeight / 2 + allTextHeight),
          paint,
        );
        canvas.drawLine(
          Offset(node.coupleposition.dx, child.position.dy - indentedTopY),
          Offset(node.coupleposition.dx, child.position.dy - indentedY),
          paint,
        );
        canvas.drawLine(
          Offset(node.coupleposition.dx, child.position.dy - indentedY),
          Offset(child.position.dx, child.position.dy - indentedY),
          paint,
        );
      } else {
        canvas.drawLine(
          node.position + Offset(0, nodeHeight / 2 + allTextHeight),
          Offset(node.position.dx, child.position.dy - indentedY),
          paint,
        );
        canvas.drawLine(
          Offset(node.position.dx, child.position.dy - indentedY),
          Offset(child.position.dx, child.position.dy - indentedY),
          paint,
        );
      }

      canvas.drawLine(
        Offset(child.position.dx, child.position.dy - indentedY),
        child.position,
        paint,
      );

      _drawConnections(canvas, child);
    }
  }

  void _drawNodes(Canvas canvas, PersonNode node) {
    _drawSingleNode(canvas, node);

    if (node.spouse != null) {
      _drawSingleNode(canvas, node.spouse!);
    }

    for (final child in node.children) {
      _drawNodes(canvas, child);
    }
  }

  void _drawSingleNode(Canvas canvas, PersonNode node) {
    if (node.model.imgPath != null) {
      imageStore.load(F.imageUrl(node.model.imgPath!));
    }
    final isSelected = node.id == selectedNode?.id;

    if (isSelected) {
      _drawSelectedFrame(canvas, node);
    }
    _drawBackground(canvas, node);
    _drawIcon(canvas, node);
    _drawText(
      canvas,
      node.model.certRelatedName?.isNotEmpty == true
          ? node.model.certRelatedName!
          : S.current.name,
      node.position + Offset(0, nodeHeight / 2 + 2.r),
      theme.textTheme.titleMedium,
    );
    _drawText(
      canvas,
      node.model.relationType?.title ?? '',
      node.position + Offset(0, nodeHeight / 2 + 22.r),
    );

    if (node.model.isCollapsed == true) {
      _drawChildrenCollapsed(canvas, node);
    }
  }

  void _drawSelectedFrame(Canvas canvas, PersonNode node) {
    final rect = node.rect!.inflate(4.r);
    final r2rect = RRect.fromRectAndRadius(
      Rect.fromLTRB(
        rect.left,
        rect.top,
        rect.right,
        rect.bottom + allTextHeight - 4.r,
      ),
      Radius.circular(nodeWidth * 0.2),
    );
    canvas.drawRRect(
      r2rect,
      Paint()
        ..color = colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.r,
    );
  }

  void _drawBackground(Canvas canvas, PersonNode node, [Rect? rectOverrided]) {
    final isSpouse = node.model.spouseId != null;
    final rect = rectOverrided ?? node.rect;
    if (rect == null) return;
    final paint = Paint()..color = isSpouse ? colors.grey : colors.darkBlue;
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(rect.width * 0.2),
    );
    canvas.drawRRect(
      rrect,
      paint,
    );
  }

  void _drawIcon(Canvas canvas, PersonNode node, [Rect? rectOverrided]) {
    final rect = rectOverrided ?? node.rect;
    if (rect == null) return;
    final gender = node.model.gender;
    if (gender == null) return;
    final avatar = node.model.imgPath;
    final icon = node.model.relationType?.iconPath(gender);
    final key = avatar != null ? F.imageUrl(avatar) : icon;
    final image = key != null ? imageStore.get(key) : null;
    final sizeFactor = avatar != null
        ? 1.0
        : icon == 'assets/images/niece.png'
            ? 0.7
            : 0.5;

    if (image != null) {
      _drawImageCentered(
        canvas: canvas,
        image: image,
        container: rect,
        sizeFactor: sizeFactor,
        fit: avatar != null ? BoxFit.cover : BoxFit.contain,
      );
    }
  }

  void _drawImageCentered({
    required Canvas canvas,
    required ui.Image image,
    required Rect container,
    double sizeFactor = 0.6,
    BoxFit fit = BoxFit.contain,
  }) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final Size outputSize = container.size * sizeFactor;

    final FittedSizes sizes = applyBoxFit(fit, imageSize, outputSize);

    final Rect src = Alignment.center.inscribe(
      sizes.source,
      Offset.zero & imageSize,
    );

    final Rect dst = Alignment.center.inscribe(
      sizes.destination,
      container,
    );

    final rrect = RRect.fromRectAndRadius(
      container,
      Radius.circular(nodeWidth * 0.2),
    );

    canvas.save();
    canvas.clipRRect(rrect);
    canvas.drawImageRect(image, src, dst, Paint());
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset pos, [TextStyle? style]) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: style ?? theme.textTheme.bodyMedium,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(canvas, pos - Offset(tp.width / 2, 0));
  }

  void _drawChildrenCollapsed(Canvas canvas, PersonNode node) {
    final map = node.fullChildren.asMap();
    map.forEach(
      (index, child) {
        final rectOverrided = _createChildRect(node.rect!, index);
        if (index > 1) {
          _drawDot(canvas, rectOverrided);
          return;
        }
        _drawBackground(canvas, child, rectOverrided);
        _drawIcon(canvas, child, rectOverrided);
      },
    );
  }

  void _drawDot(Canvas canvas, Rect rect) {
    final dotSize = 5.r;
    final rectStartDot = Rect.fromLTWH(
      rect.left + 2.r,
      rect.bottom - dotSize,
      dotSize,
      dotSize,
    );
    final paint = Paint()..color = colors.darkBlue;

    List.generate(
      3,
      (index) {
        final rectDot = Rect.fromLTWH(
          rectStartDot.left + ((dotSize + 2.r) * index),
          rectStartDot.top,
          rectStartDot.width,
          rectStartDot.height,
        );
        final rrect = RRect.fromRectAndRadius(
          rectDot,
          Radius.circular(rectDot.width),
        );
        canvas.drawRRect(
          rrect,
          paint,
        );
      },
    );
  }

  Rect _createChildRect(Rect rect, int index) {
    final scale = 0.25;
    final newWidth = rect.width * scale;
    final newHeight = rect.height * scale;

    final newLeft = rect.left + index * (newWidth + 2.r);
    final newTop = rect.bottom + allTextHeight + 4.r;

    return Rect.fromLTWH(
      newLeft,
      newTop,
      newWidth,
      newHeight,
    );
  }

  @override
  bool shouldRepaint(_) => true;
}
