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

  // ---------------------------------------------------------------------------
  // Phase 4 cleanup (2026-04-26):
  // The four legacy text-color fields below were removed after every caller
  // migrated to the `chon*` aliases (which return canonical Figma values).
  //
  //   blackText      → ChonColors.textPrimary   (#1E1E1E, was vendor #374151)
  //   primaryText    → ChonColors.textPrimary   (was vendor placeholder #FFA000)
  //   secondaryText  → ChonColors.textSecondary (#5A5A5A, was vendor #4B5563)
  //   greyText       → ChonColors.textTertiary  (#8E8E93, was vendor #9E9E9E)
  //
  // See `docs/figma/appcolors_migration.md` for the full migration log.
  // ---------------------------------------------------------------------------

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
      primary: Color(0xffFFA000),
      primaryGradient1: Color(0xff2563EB),
      primaryGradient2: Color(0xff1D4ED8),
      primaryGradient3: Color(0xff1E40AF),
      appBarGradient1: Color(0xff3B82F6),
      appBarGradient2: Color(0xff9333EA),
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

// `AppColorsChonAlias` extension was removed 2026-04-26 (Phase 5).
//
// All callers now import `ChonColors` directly from `chon_design_tokens.dart`
// and use the canonical names (e.g. `ChonColors.textSecondary` instead of
// `context.theme.colors.chonTextSecondary`). The alias extension served as
// a Phase-1 compatibility shim while we migrated 44 legacy files; with
// migration complete the indirection is now dead code.
//
// See `docs/figma/appcolors_migration.md` for the full migration log.
