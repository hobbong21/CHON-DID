import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/bank_create/cubit/bank_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_flutter/data/models/bank/bank_info_model.dart';

class BankListPage extends StatefulWidget {
  const BankListPage({super.key});

  @override
  State<BankListPage> createState() => _BankListPageState();
}

class _BankListPageState extends State<BankListPage> {
  BankInfoModel? bankSelected;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => BankCubit()..getList(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 24.h),
              Text(
                S.current.pleaseSelectBank,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: BlocBuilder<BankCubit, BankState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.errorMessage.isNotEmpty) {
                      return Center(child: Text(state.errorMessage));
                    }

                    final banks = state.bankInfo;

                    return GridView.builder(
                      padding: EdgeInsets.all(12.r),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120.r,
                        mainAxisSpacing: 12.r,
                        crossAxisSpacing: 12.r,
                        childAspectRatio: 1,
                      ),
                      itemCount: banks.length,
                      itemBuilder: (context, index) {
                        final item = banks[index];
                        final isSelected = bankSelected == item;

                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              bankSelected = item as BankInfoModel?;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? colors.darkYellow
                                  : colors.lightYellow,
                              foregroundColor: ChonColors.textSecondary,
                              overlayColor: colors.darkYellow,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (item.iconUrl != null)
                                Image.network(
                                  item.iconUrl ?? '',
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox.shrink();
                                  },
                                ),
                              SizedBox(height: 8.h),
                              Text(
                                item.name ?? '',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: bankSelected != null
                      ? () {
                          AppNavigator.push(Routes.bankCreate, bankSelected);
                        }
                      : null,
                  child: Text(S.current.confirm)),
              SafeAreaBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
