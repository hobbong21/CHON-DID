import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/home/home_page.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 24.h),
            Text(S.current.readAndAgree, style: theme.textTheme.titleLarge),
            SizedBox(height: 36.h),
            Text(S.current.guidanceAndAgreement,
                style: theme.textTheme.titleMedium),
            SizedBox(height: 8.h),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: ChonColors.bgSurface,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(S.current.accountRegistrationTerms),
                  ),
                ),
              ),
            ),
            CheckboxListTile(
              value: agreed,
              onChanged: (v) {
                setState(() {
                  agreed = !agreed;
                });
              },
              activeColor: ChonColors.brandPrimary,
              checkColor: Colors.white,
              side: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              contentPadding: EdgeInsets.symmetric(),
              title: Text(S.current.agreeAll),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SizedBox(width: 12.w),
                Assets.icons.tick.svg(),
                SizedBox(width: 24.w),
                Expanded(child: Text(S.current.agreeAccountRealName)),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(width: 12.w),
                Assets.icons.tick.svg(),
                SizedBox(width: 24.w),
                Expanded(child: Text(S.current.agreeFinancialInfoCollection)),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(width: 12.w),
                Assets.icons.tick.svg(),
                SizedBox(width: 24.w),
                Expanded(child: Text(S.current.agreeNotification)),
              ],
            ),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: agreed
                  ? () {
                      AppSP.set(kAgreedTerms, true);
                      AppNavigator.push(Routes.bankList);
                    }
                  : null,
              child: Text(S.current.agreeAndContinue),
            ),
            SafeAreaBottom(),
          ],
        ),
      ),
    );
  }
}
