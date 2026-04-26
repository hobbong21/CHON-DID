import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuardPage extends StatefulWidget {
  const GuardPage({super.key});

  @override
  State<GuardPage> createState() => _GuardPageState();
}

class _GuardPageState extends State<GuardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 24.h),
              Text(
                S.current.noCard,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 4.h),
              Text(
                S.current.redirectIdCreation,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 20.sp),
              ),
              Expanded(
                child: Center(
                    child:
                        Assets.icons.folder.svg(width: 245.r, height: 245.r)),
              ),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.replace(Routes.selfIdCreaterOption);
                },
                child: Text(S.current.confirm),
              ),
              SafeAreaBottom(),
            ],
          )),
    );
  }
}
