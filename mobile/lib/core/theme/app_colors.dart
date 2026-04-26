import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color white;
  final Color black;
  final Color primary;
  final Color primaryGradient1;
  final Color primaryGradient2;
  final Color primaryGradient3;
  final Color appBarGradient1;
  final Color appBarGradient2;
  final Color grey;
  final Color red;
  final Color green;
  final Color lightBlue;
  final Color darkBlue;
  final Color lightYellow;
  final Color darkYellow;
  final Color lightGreen;
  final Color darkGreen;
  final Color lightOrange;
  final Color darkOrange;
  final Color lightRed;
  final Color darkRed;
  final Color lightPurple;
  final Color darkPurple;
  final Color greyBackground;
  final Color greyBackground2;
  final Color inputBackground;
  final Color blueBackground;
  final Color alertBackground;
  final Color hintText;
  final Color brown;
  final Color pink;
  final Color greenEnable;

  /// Text ---
  final Color whiteText;
  final Color blackText;
  final Color primaryText;
  final Color secondaryText;
  final Color greyText;
  final Color blueText;
  final Color greenText;
  final Color labelText;
  final Color errorText;

  /// ---

  /// Border ---
  final Color border;

  ///  ---
  ///  Divider ---
  final Color divider;

  ///  ---
  const AppColors({
    required this.background,
    required this.white,
    required this.black,
    required this.whiteText,
    required this.blackText,
    required this.primaryText,
    required this.secondaryText,
    required this.greyText,
    required this.labelText,
    required this.errorText,
    required this.primary,
    required this.primaryGradient1,
    required this.primaryGradient2,
    required this.primaryGradient3,
    required this.appBarGradient1,
    required this.appBarGradient2,
    required this.border,
    required this.divider,
    required this.grey,
    required this.greyBackground,
    required this.greyBackground2,
    required this.inputBackground,
    required this.blueText,
    required this.red,
    required this.green,
    required this.lightBlue,
    required this.darkBlue,
    required this.lightYellow,
    required this.darkYellow,
    required this.lightGreen,
    required this.darkGreen,
    required this.lightOrange,
    required this.darkOrange,
    required this.lightRed,
    required this.darkRed,
    required this.lightPurple,
    required this.darkPurple,
    required this.greenText,
    required this.blueBackground,
    required this.alertBackground,
    required this.hintText,
    required this.brown,
    required this.pink,
    required this.greenEnable,
  });

  factory AppColors.light() {
    return const AppColors(
      background: Color(0xffFFFDF7),
      white: Color(0xffffffff),
      black: Colors.black,
      green: Colors.green,
      greenText: Colors.green,
      whiteText: Color(0xffffffff),
      blackText: Color(0xff374151),
      primary: Color(0xffFFA000),
      primaryGradient1: Color(0xff2563EB),
      primaryGradient2: Color(0xff1D4ED8),
      primaryGradient3: Color(0xff1E40AF),
      appBarGradient1: Color(0xff3B82F6),
      appBarGradient2: Color(0xff9333EA),
      primaryText: Color(0xffFFA000),
      secondaryText: Color(0xff4B5563),
      greyText: Color(0xff9E9E9E),
      border: Color(0xffF3F4F6),
      divider: Color(0xffF1F1F1),
      grey: Colors.grey,
      greyBackground: Color(0xffF8F8F8),
      greyBackground2: Color(0xffD9D9D9),
      inputBackground: Color(0xffF5F5F5),
      blueText: Color(0xffBFDBFE),
      labelText: Colors.black,
      errorText: Color(0xffF84646),
      red: Color(0xffF84646),
      lightBlue: Color(0xffEFF6FF),
      darkBlue: Color(0xff2563EB),
      lightGreen: Color(0xffF0FDF4),
      darkGreen: Color(0xff16A34A),
      lightYellow: Color(0xffFFF2CA),
      darkYellow: Color(0xffFFD740),
      lightOrange: Color(0x33F48734),
      darkOrange: Color(0xffDF861F),
      lightRed: Color(0xffFFF7ED),
      darkRed: Color(0xffEA580C),
      lightPurple: Color(0xffFAF5FF),
      darkPurple: Color(0xffA855F7),
      blueBackground: Color(0xffDEF2FF),
      alertBackground: Color(0xff424242),
      hintText: Color(0xff888888),
      brown: Color(0xffB7A1A1),
      pink: Color(0xffFEE2E2),
      greenEnable: Color(0xff0CE39D),
    );
  }
}

/// Chon design-token aliases — use these getters from existing screens
/// that are migrating off the legacy [AppColors] palette and onto the
/// canonical [ChonColors] (in `chon_design_tokens.dart`).
///
/// New screens should import [ChonColors] directly. These aliases exist
/// only so legacy screens can switch values without changing the
/// `context.colors.<field>` access pattern overnight.
///
/// See `docs/figma/appcolors_migration.md` for the full plan.
extension AppColorsChonAlias on AppColors {
  /// `#F5F5F5` — page background.
  Color get chonBgPage => const Color(0xFFF5F5F5);

  /// `#FFFFFF` — card / sheet surface.
  Color get chonBgSurface => const Color(0xFFFFFFFF);

  /// `#FFA000` — primary brand orange.
  Color get chonBrandPrimary => const Color(0xFFFFA000);

  /// `#FF9500` — brand accent.
  Color get chonBrandAccent => const Color(0xFFFF9500);

  /// `#0C0C16` — logo dark.
  Color get chonBrandDark => const Color(0xFF0C0C16);

  /// `#1E1E1E` — primary text.
  Color get chonTextPrimary => const Color(0xFF1E1E1E);

  /// `#5A5A5A` — secondary text / active nav label.
  Color get chonTextSecondary => const Color(0xFF5A5A5A);

  /// `#8E8E93` — tertiary / inactive nav label.
  Color get chonTextTertiary => const Color(0xFF8E8E93);

  /// `#FFFFFF` — text on dark backgrounds.
  Color get chonTextInverse => const Color(0xFFFFFFFF);

  /// `#404040` — strong icon stroke (notification bell).
  Color get chonIconStrong => const Color(0xFF404040);

  /// `#BFBFBF` — disabled icon stroke (strong).
  Color get chonIconDisabledStrong => const Color(0xFFBFBFBF);

  /// `#B4B2B3` — disabled icon stroke (soft / system nav).
  Color get chonIconDisabledSoft => const Color(0xFFB4B2B3);

  /// `#E24B4A` — semantic danger / error.
  Color get chonSemanticDanger => const Color(0xFFE24B4A);

  /// `#1D9E75` — semantic success.
  Color get chonSemanticSuccess => const Color(0xFF1D9E75);
}
