import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Canonical CHON design tokens, extracted from
/// Figma `CHON 1.1` (file `X44QW3oVr3BWkyW08m9zow`,
/// page `260316 Lastest version (Do NOT touch !)`).
///
/// This file is the source of truth for new screens going forward.
/// The legacy `AppColors` in `app_colors.dart` mixes vendor placeholder
/// values with real ones — keep using it for existing screens only,
/// and use the tokens here for anything new.
class ChonColors {
  ChonColors._();

  // Surfaces
  /// Page background. `#f5f5f5`.
  static const Color bgPage = Color(0xFFF5F5F5);

  /// Card / sheet / nav surface. `#ffffff`.
  static const Color bgSurface = Color(0xFFFFFFFF);

  /// Camera / modal scrim. Black at 60%.
  static Color bgOverlay = const Color(0xFF000000).withValues(alpha: 0.6);

  // Brand
  /// Primary brand orange — used on the FAB / 신분증 button. `#ffa000`.
  static const Color brandPrimary = Color(0xFFFFA000);

  /// Secondary brand accent. `#ff9500`.
  static const Color brandAccent = Color(0xFFFF9500);

  /// Logo dark. `#0c0c16`.
  static const Color brandDark = Color(0xFF0C0C16);

  // Text
  /// Primary text. `#1e1e1e`.
  static const Color textPrimary = Color(0xFF1E1E1E);

  /// Secondary text — also used for *active* nav label. `#5a5a5a`.
  static const Color textSecondary = Color(0xFF5A5A5A);

  /// Tertiary text — *inactive* nav labels. `#8e8e93`.
  static const Color textTertiary = Color(0xFF8E8E93);

  /// Inverse text on dark backgrounds (Tutorial card, FAB). `#ffffff`.
  static const Color textInverse = Color(0xFFFFFFFF);

  // Icons / strokes
  /// Disabled icon stroke. `#bfbfbf`.
  static const Color iconDisabledStrong = Color(0xFFBFBFBF);

  /// System nav icon stroke. `#b4b2b3`.
  static const Color iconDisabledSoft = Color(0xFFB4B2B3);

  /// Strong icon stroke (notification bell). `#404040`.
  static const Color iconStrong = Color(0xFF404040);
}

/// Pretendard text styles. Pretendard is registered in
/// `pubspec.yaml` (`assets/fonts/PretendardVariable.ttf`).
///
/// Sizes use `flutter_screenutil` (`.sp`) so they scale with device.
class ChonTextStyles {
  ChonTextStyles._();

  static const String _family = 'Pretendard';

  /// Pretendard Bold 22px / line 100~105% — card titles.
  static TextStyle cardTitle({Color color = ChonColors.textPrimary}) =>
      TextStyle(
        fontFamily: _family,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -0.33,
        color: color,
      );

  /// Pretendard Bold 14px / line 80~86% — quick action labels.
  static TextStyle actionLabel({Color color = ChonColors.textPrimary}) =>
      TextStyle(
        fontFamily: _family,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 0.86,
        letterSpacing: -0.21,
        color: color,
      );

  /// Pretendard Medium 14px / line 105% — section labels (입력 정보).
  static TextStyle sectionLabel({Color color = ChonColors.textSecondary}) =>
      TextStyle(
        fontFamily: _family,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.05,
        letterSpacing: -0.21,
        color: color,
      );

  /// Pretendard Medium 14~16px / line 90~130% — body copy.
  static TextStyle body({
    double size = 14,
    Color color = ChonColors.textPrimary,
    double height = 1.3,
  }) =>
      TextStyle(
        fontFamily: _family,
        fontSize: size.sp,
        fontWeight: FontWeight.w500,
        height: height,
        letterSpacing: -size * 0.015,
        color: color,
      );

  /// Pretendard Medium 12px / line 100% — bottom nav labels.
  static TextStyle navLabel({Color color = ChonColors.textTertiary}) =>
      TextStyle(
        fontFamily: _family,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 1.0,
        color: color,
      );
}

/// Shape & spacing tokens.
class ChonShape {
  ChonShape._();

  /// Card / banner radius. 20.
  static double get radiusCard => 20.r;

  /// Pill / FAB radius. 50.
  static double get radiusPill => 50.r;

  /// Page horizontal padding. 16.
  static double get pagePaddingX => 16.w;

  /// Standard vertical gap between sections. 8~10.
  static double get gapSection => 8.h;

  /// Quick-action grid item size. 76×76.
  static Size get quickActionItem => Size(76.r, 76.r);

  /// Bottom nav height (excluding system bar). 68.
  static double get bottomNavHeight => 68.h;

  /// Bottom nav FAB size. 68×68 (raised −12px).
  static double get bottomNavFabSize => 68.r;

  /// Bottom nav menu item width. 50×52.
  static Size get bottomNavMenuItem => Size(50.r, 52.r);
}
