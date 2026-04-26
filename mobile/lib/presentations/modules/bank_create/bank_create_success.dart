import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/bank/bank_info_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BankCreateSuccess extends StatefulWidget {
  const BankCreateSuccess({super.key});

  @override
  State<BankCreateSuccess> createState() => _BankCreateSuccessState();
}

class _BankCreateSuccessState extends State<BankCreateSuccess> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    final extra = GoRouterState.of(context).extra as Map?;

    final bank = extra?['bank'] as BankInfoModel?;
    final account = extra?['account'] as String?;
    final card = extra?['card'] as String?;

    assert(bank != null && account != null);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 24.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.accountVerificationCompleted,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      if (bank?.iconUrl != null)
                        Image.network(
                          bank!.iconUrl ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox.shrink();
                          },
                        ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bank?.name ?? '',
                              style: theme.textTheme.titleMedium,
                            ),
                            Text('$account ${card ?? ''}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();
                },
                child: Text(S.current.confirm)),
            SafeAreaBottom(),
          ],
        ),
      ),
    );
  }
}
