import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailReportPage extends StatefulWidget {
  final ReportModel report;
  const DetailReportPage({super.key, required this.report});

  @override
  State<DetailReportPage> createState() => _DetailReportPageState();
}

class _DetailReportPageState extends State<DetailReportPage> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Header(title: S.current.inquiryTitle),
            SizedBox(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.report.title ?? '',
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(widget.report.email ?? '')),
                              SizedBox(width: 12.w),
                              Text(widget.report.createdTime ?? ''),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(widget.report.content ?? '',
                              style: theme.textTheme.titleMedium),
                          if (widget.report.filePath != null) ...[
                            SizedBox(height: 12.h),
                            Text(S.current.attachmentLabel, style: theme.textTheme.titleMedium),
                            SizedBox(height: 4.h),
                            Image.network(
                              F.imageUrl(widget.report.filePath!),
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox.shrink();
                              },
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
