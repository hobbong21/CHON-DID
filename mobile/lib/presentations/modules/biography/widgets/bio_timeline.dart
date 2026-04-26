import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/presentations/modules/biography/cubit/biography_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BioTimeline extends StatelessWidget {
  final List<BioEvent> events;

  const BioTimeline({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return _buildTimelineItem(context, events[index]);
      },
    );
  }

  Widget _buildTimelineItem(BuildContext context, BioEvent event) {
    final theme = context.theme;
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Container(
              width: 10.r,
              height: 10.r,
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: colors.labelText),
                ),
                SizedBox(height: 4.h),
                Text(
                  '(${event.year})',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  event.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                    height: 1.4,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
