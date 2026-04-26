import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/event/visit_event_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_finish/widgets/block_loading.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerificationFinishPage extends StatefulWidget {
  const VerificationFinishPage({super.key});

  @override
  State<VerificationFinishPage> createState() => _VerificationFinishPageState();
}

class _VerificationFinishPageState extends State<VerificationFinishPage> {
  // bool isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   load();
  // }

  // load() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final extraData = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final type = extraData?['type'] as VerificationFinishType? ??
        VerificationFinishType.verify;
    final txId = extraData?['txId'] as String?;
    final action = extraData?['action'] as VisitEventActionT?;
    final onConfirm = extraData?['onConfirm'] as Function?;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 24.h),
            Text(
              type == VerificationFinishType.auth
                  ? S.current.verifyFinish
                  : type == VerificationFinishType.verify
                      ? S.current.idCheckCompleted
                      : action == VisitEventActionT.checkIn
                          ? S.current.checkInConfirmed
                          : S.current.checkOutConfirmed,
              style: theme.textTheme.titleLarge,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.block4.svg(width: 220.r),
                      SizedBox(height: 32.h),
                      Text(
                        S.current.blockHash,
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        txId ?? '',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (type == VerificationFinishType.auth) {
                  onConfirm?.call();
                  return;
                }
                AppNavigator.pop();
              },
              child: Text(S.current.confirm),
            ),
            SafeAreaBottom(),
          ],
        ),
      ),
    );
  }
}

enum VerificationFinishType {
  auth,
  verify,
  checkInOut,
}
