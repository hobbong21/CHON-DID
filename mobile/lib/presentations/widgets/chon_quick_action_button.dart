import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 76×76 quick-action button used on Home (`Frame 177677` group).
///
/// Spec (from Figma `602:45717` / `602:45718` / `602:45720` / `602:45719`):
/// - 76×76 white surface, no border, no radius
/// - Vertical layout, gap 8, padding 12/8
/// - Icon area 28×28 centered at top
/// - Label: Pretendard Bold 14px, line 80–86%, color `#1e1e1e`
/// - Label may wrap to two lines (e.g. "연락하기\n(가계도)")
class ChonQuickActionButton extends StatelessWidget {
  const ChonQuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.semanticLabel,
  });

  /// 28×28 icon. Pass any widget — this is what the design system calls
  /// the "icon slot". The widget will be wrapped in a 28×28 SizedBox.
  final Widget icon;

  /// Two-line label is allowed. Use `\n` to control wrap explicitly.
  final String label;

  final VoidCallback? onTap;

  /// Optional accessibility label (defaults to [label]).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel ?? label.replaceAll('\n', ' '),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: ChonShape.quickActionItem.width,
          height: ChonShape.quickActionItem.height,
          color: ChonColors.bgSurface,
          padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 28.r, height: 28.r, child: Center(child: icon)),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  label,
                  style: ChonTextStyles.actionLabel(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 4-up grid of quick-action buttons matching Home (`Frame 177678`, 328×76).
///
/// The Figma layout is `position: absolute` (no auto-layout) with items at
/// x=0, 84, 168, 252. We approximate with a `Row` + `Spacer` so each button
/// stays exactly 76×76 and the spacing is `(328 - 4*76) / 3 ≈ 8.7px`. If you
/// need pixel-perfect positions, wrap in a 328×76 `SizedBox` and use a
/// `Stack` with `Positioned` instead.
class ChonQuickActionGrid extends StatelessWidget {
  const ChonQuickActionGrid({
    super.key,
    this.label = '입력 정보',
    required this.actions,
  });

  /// Section label rendered above the grid. `null` to hide.
  final String? label;

  /// Exactly four actions (the design always shows four). If you pass
  /// fewer, the Row will simply leave gaps.
  final List<ChonQuickActionButton> actions;

  @override
  Widget build(BuildContext context) {
    assert(actions.length <= 4,
        'Quick action grid in CHON is fixed at 4 columns.');

    return Container(
      color: ChonColors.bgSurface,
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(label!, style: ChonTextStyles.sectionLabel()),
            SizedBox(height: 10.h),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final action in actions) action,
            ],
          ),
        ],
      ),
    );
  }
}

/// Convenience constructors that cover the four built-in CHON quick
/// actions, matching the labels and order shown on the Home screen.
///
/// These are wired up via [iconBuilder] so callers can supply their own
/// icon assets (Material icons, SVGs, custom widgets) without coupling
/// the widget to a specific icon library.
class ChonQuickActions {
  ChonQuickActions._();

  /// Contact entry (gift to family tree).
  static ChonQuickActionButton contact({
    required Widget icon,
    required VoidCallback onTap,
  }) =>
      ChonQuickActionButton(
        icon: icon,
        label: S.current.chon_home_q_contact,
        onTap: onTap,
      );

  /// Edit profile entry.
  static ChonQuickActionButton editProfile({
    required Widget icon,
    required VoidCallback onTap,
  }) =>
      ChonQuickActionButton(
        icon: icon,
        label: S.current.chon_home_q_edit_profile,
        onTap: onTap,
      );

  /// QR code — show / scan.
  static ChonQuickActionButton qrCode({
    required Widget icon,
    required VoidCallback onTap,
  }) =>
      ChonQuickActionButton(
        icon: icon,
        label: S.current.chon_home_q_qr,
        onTap: onTap,
      );

  /// Support / report a problem.
  static ChonQuickActionButton support({
    required Widget icon,
    required VoidCallback onTap,
  }) =>
      ChonQuickActionButton(
        icon: icon,
        label: S.current.chon_home_q_support,
        onTap: onTap,
      );
}
