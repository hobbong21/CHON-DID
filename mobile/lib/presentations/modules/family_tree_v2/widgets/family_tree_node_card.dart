import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_node.dart';
import 'package:flutter/material.dart';

/// 96×96 card representing one [FamilyTreeNode] on the canvas.
///
/// - Avatar circle (initials) on top
/// - Name below
/// - Selected state: orange border + shadow
class FamilyTreeNodeCard extends StatelessWidget {
  const FamilyTreeNodeCard({
    super.key,
    required this.node,
    required this.isSelected,
    required this.onTap,
    this.size = const Size(96, 96),
  });

  final FamilyTreeNode node;
  final bool isSelected;
  final VoidCallback onTap;
  final Size size;

  String get _initials {
    final n = node.name?.trim() ?? '';
    if (n.isEmpty) return '?';
    final parts = n.split(RegExp(r'\s+'));
    if (parts.length == 1) return parts.first.characters.first;
    return parts.first.characters.first + parts[1].characters.first;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ChonColors.bgSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? ChonColors.brandPrimary
                : const Color(0x14000000),
            width: isSelected ? 2 : 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: isSelected
                  ? ChonColors.brandPrimary
                  : const Color(0xFFFFE7B8),
              child: Text(
                _initials,
                style: TextStyle(
                  color: isSelected
                      ? ChonColors.textInverse
                      : ChonColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              node.name ?? '?',
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ChonColors.textPrimary,
                height: 1.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
