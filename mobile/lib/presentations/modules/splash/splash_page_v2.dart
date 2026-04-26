import 'dart:async';

import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Figma-faithful Splash screen — `Splash Screen` (`754:12524`).
///
/// 360×800. Logo centered on the page background. After [redirectAfter]
/// the page replaces itself with the home route via [onRedirect] (default
/// `AppNavigator.go(Routes.home)`).
///
/// The original [SplashPage] is preserved in `splash_page.dart`. Switch
/// to this one in `app_navigator.dart` when ready.
class SplashPageV2 extends StatefulWidget {
  const SplashPageV2({
    super.key,
    this.redirectAfter = const Duration(seconds: 1),
    this.onRedirect,
  });

  /// How long to keep the splash on screen before navigating away.
  final Duration redirectAfter;

  /// Override the default redirect (`AppNavigator.go(Routes.home)`).
  /// Useful in tests to avoid mounting the real router.
  final VoidCallback? onRedirect;

  @override
  State<SplashPageV2> createState() => _SplashPageV2State();
}

class _SplashPageV2State extends State<SplashPageV2> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.redirectAfter, () {
      if (!mounted) return;
      if (widget.onRedirect != null) {
        widget.onRedirect!();
      } else {
        AppNavigator.go(Routes.home);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChonColors.bgPage,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              key: const Key('splash.logo'),
              width: 140.dg,
              height: 146.dg,
              child: Assets.icons.logo.svg(width: 140.dg, height: 146.dg),
            ),
            SizedBox(height: 28.h),
            Text(
              'CHON',
              style: ChonTextStyles.cardTitle().copyWith(letterSpacing: 4),
            ),
          ],
        ),
      ),
    );
  }
}
