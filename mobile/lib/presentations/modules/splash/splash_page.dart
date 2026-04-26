import 'package:base_flutter/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      AppNavigator.go(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 146.dg,
              width: 140.dg,
              child: Assets.icons.logo.svg(width: 140.dg, height: 146.dg),
            ),
            const SizedBox(height: 28),
            // const LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
