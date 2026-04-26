import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/presentations/modules/report/cubit/report_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListReportPage extends StatefulWidget {
  const ListReportPage({super.key});

  @override
  State<ListReportPage> createState() => _ListReportPageState();
}

class _ListReportPageState extends State<ListReportPage> {
  late final ReportCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read();
    cubit.getList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocBuilder<ReportCubit, ReportState>(
      bloc: cubit,
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          itemBuilder: (context, index) {
            final report = state.reports[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AppNavigator.push(Routes.detailReportPage, report);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          report.title ?? '',
                          style: theme.textTheme.titleMedium,
                        )),
                        SizedBox(width: 12.w),
                        Text(
                          report.createdTime ?? '',
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      report.content ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: state.reports.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 4.h, child: Divider(height: 1));
          },
        );
      },
    );
  }
}
