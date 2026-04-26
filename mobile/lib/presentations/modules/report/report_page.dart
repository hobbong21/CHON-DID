import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/report/cubit/report_cubit.dart';
import 'package:base_flutter/presentations/modules/report/list_report/list_report.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'create_report/create_report_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage>
    with SingleTickerProviderStateMixin {
  final cubit = ReportCubit();
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider<ReportCubit>(
      create: (context) => cubit,
      child: BlocListener<ReportCubit, ReportState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state.messageError.isNotEmpty) {
            AppUtils.showSnackBarError(
              context: context,
              title: state.messageError,
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Header(title: S.current.inquiryTitle),
                SizedBox(height: 12.h),
                ListenableBuilder(
                  listenable: tabController,
                  builder: (context, _) {
                    final isTabOne = tabController.index == 0;
                    final focusStyle = ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    );
                    final unfocusStyle = ElevatedButton.styleFrom(
                      backgroundColor: colors.lightYellow,
                      foregroundColor: colors.black,
                      overlayColor: colors.darkYellow,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    );
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                tabController.animateTo(0);
                              },
                              style: isTabOne ? focusStyle : unfocusStyle,
                              child: Text(S.current.reportProblemTitle),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                tabController.animateTo(1);
                              },
                              style: !isTabOne ? focusStyle : unfocusStyle,
                              child: Text(S.current.myReportHistoryTitle),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      CreateReportPage(),
                      ListReportPage(),
                    ],
                  ),
                ),
                SafeAreaBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
