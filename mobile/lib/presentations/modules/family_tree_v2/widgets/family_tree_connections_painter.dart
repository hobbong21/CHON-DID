import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_layout.dart';
import 'package:flutter/widgets.dart';

/// Draws elbow-style connectors between each parent and its children
/// using the positions in [layout].
///
/// Cheap and deterministic — every paint call recomputes from `layout`,
/// so panning or zooming works inside an `InteractiveViewer` without
/// any cache invalidation logic.
class FamilyTreeConnectionsPainter extends CustomPainter {
  FamilyTreeConnectionsPainter({required this.layout});

  final FamilyTreeLayout layout;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ChonColors.iconDisabledStrong
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (final parent in layout.placed) {
      for (final child in parent.node.children) {
        final placedChild = layout.findById(child.id);
        if (placedChild == null) continue;
        _drawElbow(canvas, parent.bottomCenter, placedChild.topCenter, paint);
      }
    }
  }

  void _drawElbow(Canvas canvas, Offset from, Offset to, Paint paint) {
    final midY = (from.dy + to.dy) / 2;
    final path = Path()
      ..moveTo(from.dx, from.dy)
      ..lineTo(from.dx, midY)
      ..lineTo(to.dx, midY)
      ..lineTo(to.dx, to.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant FamilyTreeConnectionsPainter oldDelegate) {
    return oldDelegate.layout != layout;
  }
}
