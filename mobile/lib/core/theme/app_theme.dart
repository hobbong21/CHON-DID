import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class BaseThemes {
  late ThemeData _light;
  late ThemeData _dark;
  late AppColors _lightColors;
  late AppColors _darkColors;
  BaseThemes() {
    _lightColors = createLightColors();
    _darkColors = createDarkColors();
    _light = createLightTheme();
    _dark = createDarkTheme();
  }
  ThemeData get light => _light;
  ThemeData get dark => _dark;
  AppColors get lightColors => _lightColors;
  AppColors get darkColors => _darkColors;

  @protected
  AppColors createLightColors();
  @protected
  AppColors createDarkColors();

  @protected
  @mustCallSuper
  ThemeData createLightTheme() {
    return _createBaseThemeData(_lightColors);
  }

  @protected
  @mustCallSuper
  ThemeData createDarkTheme() {
    return _createBaseThemeData(_darkColors);
  }

  AppColors currentColor(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;
    return isDark ? darkColors : lightColors;
  }

  ThemeData _createBaseThemeData(AppColors color) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: color.background,
        titleTextStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: color.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: color.white, size: 24.sp),
        toolbarHeight: kTextTabBarHeight.h,
      ),
      fontFamily: 'Pretendard',
      fontFamilyFallback: const [
        'NotoSansKR',
        'NotoSansCJK',
        'Roboto',
      ],
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: color.primary,
      scaffoldBackgroundColor: color.background,
      dialogTheme: DialogTheme(
        elevation: 8,
        titleTextStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w600,
            color: color.black),
        contentTextStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
            color: color.secondaryText),
        backgroundColor: color.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      // primaryColor: color.primary,
      textTheme: GoogleFonts.beVietnamProTextTheme(TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'Pretendard', color: color.black, fontSize: 57.sp),
        displayMedium: TextStyle(
            fontFamily: 'Pretendard', color: color.black, fontSize: 45.sp),
        displaySmall: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 36.sp),
        headlineLarge: TextStyle(
            fontFamily: 'Pretendard',
            color: color.black,
            fontWeight: FontWeight.w600,
            fontSize: 32.sp),
        headlineMedium: TextStyle(
            fontFamily: 'Pretendard',
            color: color.black,
            fontWeight: FontWeight.w600,
            fontSize: 28.sp),
        headlineSmall: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp),
        titleLarge: TextStyle(
            fontFamily: 'Pretendard',
            color: color.black,
            fontWeight: FontWeight.w700,
            fontSize: 22.sp),
        titleMedium: TextStyle(
            fontFamily: 'Pretendard',
            color: color.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp),
        titleSmall: TextStyle(
            fontFamily: 'Pretendard',
            color: color.blackText,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp),
        bodyLarge: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 16.sp),
        bodyMedium: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 14.sp),
        bodySmall: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 12.sp),
        labelLarge: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 14.sp),
        labelMedium: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 12.sp),
        labelSmall: TextStyle(
            fontFamily: 'Pretendard',
            color: color.secondaryText,
            fontSize: 11.sp),
      )),
      hintColor: color.hintText,
      dividerColor: color.divider,
      buttonTheme: ButtonThemeData(
        buttonColor: color.primary,
      ),
      cardColor: color.white,
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        color: color.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        clipBehavior: Clip.hardEdge,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.withValues(alpha: 0.3)),
      canvasColor: color.white,
      disabledColor: color.greyBackground2,
      dividerTheme: DividerThemeData(
        thickness: 1.0,
        endIndent: 0,
        indent: 0,
        color: color.divider,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: color.white,
        surfaceTintColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: color.primary,
              );
            }
            return TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: color.grey,
            );
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: color.primary, size: 26.sp);
            }
            return IconThemeData(color: color.grey, size: 24.sp);
          },
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(color.blueText),
        side: BorderSide(
          color: color.blueText,
          width: 2.r,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: color.white,
          backgroundColor: color.primary,
          minimumSize: Size(double.infinity, 44.r),
          textStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 18.sp,
              color: color.white,
              fontWeight: FontWeight.w500),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: color.white,
          minimumSize: Size(double.infinity, 44.r),
          textStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 18.sp,
              color: color.secondaryText,
              fontWeight: FontWeight.w500),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          side: BorderSide(
            width: 2.r,
            color: color.lightYellow,
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: color.inputBackground,
        hintStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
            color: color.hintText),
        errorStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 13.0.sp,
            fontWeight: FontWeight.w400,
            color: color.errorText),
        labelStyle: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            color: color.labelText),
        // focusColor: const Color(0xFFFB6D3B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: color.greyBackground2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: color.greyBackground2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: color.greyBackground2),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: color.greyBackground2)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: color.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
              width: 1.r, color: color.errorText, style: BorderStyle.solid),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        errorMaxLines: 3,
        isDense: true,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        clipBehavior: Clip.antiAlias,
        backgroundColor: color.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        headerBackgroundColor: color.primary,
        headerForegroundColor: color.white,
        dayStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          color: color.primary,
        ),
        todayBackgroundColor: WidgetStateProperty.all(Colors.teal.shade100),
        todayForegroundColor: WidgetStateProperty.all(Colors.teal.shade700),
        rangePickerHeaderForegroundColor: Colors.teal,
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return color.primary;
          }
          return null;
        }),
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return color.white;
          }
          return null;
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: const CircleBorder(),
      ),
    );
  }
}

class AppThemes extends BaseThemes {
  @override
  AppColors createDarkColors() {
    return AppColors.light();
  }

  @override
  AppColors createLightColors() {
    return AppColors.light();
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}
