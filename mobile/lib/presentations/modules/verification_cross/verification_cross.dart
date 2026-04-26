import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_cross/cubit/verification_cross_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/services/contract_service.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'input_conract/input_contact.dart';
import 'request_verification_tab/request_verification_tab.dart';

class VerificationCross extends StatefulWidget {
  final int cardId;
  const VerificationCross({super.key, required this.cardId});

  @override
  State<VerificationCross> createState() => _VerificationCrossState();
}

class _VerificationCrossState extends State<VerificationCross>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final cubit = VerificationCrossCubit();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
    cubit.init(widget.cardId);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider<VerificationCrossCubit>(
      create: (context) => cubit,
      child: BlocConsumer<VerificationCrossCubit, VerificationCrossState>(
          listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.errorMessage.isNotEmpty) {
          AppUtils.showSnackBarError(
              context: context, title: state.errorMessage);
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                Header(title: S.current.mutualAuthentication),
                SizedBox(height: 12.h),
                // ListenableBuilder(
                //     listenable: tabController,
                //     builder: (context, _) {
                //       final isTabOne = tabController.index == 0;
                //       final focusStyle = ElevatedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(100.r),
                //         ),
                //         elevation: 0,
                //         shadowColor: Colors.transparent,
                //       );
                //       final unfocusStyle = ElevatedButton.styleFrom(
                //         backgroundColor: colors.lightYellow,
                //         foregroundColor: colors.black,
                //         overlayColor: colors.darkYellow,
                //         elevation: 0,
                //         shadowColor: Colors.transparent,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(100.r),
                //         ),
                //       );
                //       final focusColorFilter =
                //           ColorFilter.mode(colors.white, BlendMode.srcIn);
                //       final unFocusColorFilter = ColorFilter.mode(
                //           ChonColors.textSecondary, BlendMode.srcIn);
                //       return IntrinsicHeight(
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.stretch,
                //           children: [
                //             Expanded(
                //               child: ElevatedButton.icon(
                //                 onPressed: () {
                //                   tabController.animateTo(0);
                //                 },
                //                 icon: Assets.icons.treeNode.svg(
                //                     colorFilter: isTabOne
                //                         ? focusColorFilter
                //                         : unFocusColorFilter),
                //                 label: Text(S.current.copyVerificationLink),
                //                 style: isTabOne ? focusStyle : unfocusStyle,
                //               ),
                //             ),
                //             SizedBox(width: 8.w),
                //             Expanded(
                //               child: ElevatedButton.icon(
                //                 onPressed: () {
                //                   tabController.animateTo(1);
                //                 },
                //                 style: !isTabOne ? focusStyle : unfocusStyle,
                //                 icon: Assets.icons.userAdd.svg(
                //                     colorFilter: !isTabOne
                //                         ? focusColorFilter
                //                         : unFocusColorFilter),
                //                 label: Text(S.current.personToVerify),
                //               ),
                //             )
                //           ],
                //         ),
                //       );
                //     }),
                SizedBox(height: 16.h),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      RequestVerificationTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
