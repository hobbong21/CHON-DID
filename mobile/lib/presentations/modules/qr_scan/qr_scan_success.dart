import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScanSuccess extends StatelessWidget {
  const QrScanSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as String?;
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                S.current.qrScanComplete,
                style: theme.textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  data ?? '',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (data != null)
              ElevatedButton(
                  onPressed: () {
                    onTapUrl(data);
                    int? eventId = int.tryParse(data);
                    // AppNavigator.push(
                    //   Routes.selfIdListChoose,
                    //  {
                    //     'type': SelfIdListChooseType.checkInOut,
                    //     'eventId': eventId,
                    //   },
                    // );
                  },
                  child: Text(S.current.connect)),
            SafeAreaBottom(),
          ],
        ),
      ),
    );
  }

  Future<void> onTapUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (true) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {}
  }
}
