import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/data/models/bank/bank_info_model.dart';
import 'package:base_flutter/presentations/modules/bank_create/cubit/bank_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class BankCreatePage extends StatefulWidget {
  const BankCreatePage({super.key});

  @override
  State<BankCreatePage> createState() => _BankCreatePageState();
}

class _BankCreatePageState extends State<BankCreatePage> {
  final cubit = BankCubit();

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    final bank = GoRouterState.of(context).extra as BankInfoModel?;
    if (bank != null) {
      cubit.init(bank.refBank!);
    }

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: BlocConsumer<BankCubit, BankState>(
          listenWhen: (prev, curr) {
            return prev.isLoading && !curr.isLoading;
          },
          listener: (context, state) {
            context.loaderOverlay.hide();

            if (state.errorMessage.isNotEmpty) {
              AppUtils.showSnackBarError(
                context: context,
                title: state.errorMessage,
              );
              return;
            }
            AppNavigator.push(
              Routes.bankCreateSuccess,
              {
                'bank': bank,
                'account': cubit.accountController.text,
                'card': cubit.state.listCards.firstOrNull?.name ?? '',
              },
            );
          },
          builder: (context, state) {
            if (state.isLoading) {
              context.loaderOverlay.show();
            }

            return Padding(
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
                          S.current.pleaseEnterAccount,
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
                            Expanded(child: Text(bank?.name ?? '')),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(S.current.enterAccountNumber),
                        SizedBox(height: 4.h),
                        TextField(
                          controller: cubit.accountController,
                          enabled: !state.isLoading,
                          decoration: InputDecoration(
                            fillColor: colors.background,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.primary),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.primary),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.primary),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.red),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.red),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(S.current.enterWithoutHyphen),
                        if (state.errorMessage.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              state.errorMessage,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            cubit.createBank();
                          },
                    child: Text(S.current.checkAccount),
                  ),
                  SafeAreaBottom(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
