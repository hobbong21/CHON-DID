import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/biography/cubit/biography_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BioIntro extends StatelessWidget {
  final BioProfile profile;

  const BioIntro({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: Container(
                    width: 260.r,
                    height: 240.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.push(Routes.confirmRelationship, 'requestId123');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Assets.icons.bank.svg(fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  profile.name,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text('${profile.birthYear}${S.current.birthYearSuffix} · ${profile.location}',
                    style: theme.textTheme.headlineSmall),
                SizedBox(height: 24.h),
                Text(profile.bio,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium),
                const Spacer(),
                SizedBox(height: 32.h),
                Center(
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    alignment: WrapAlignment.center,
                    children: profile.tags.map((tag) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: colors.primary),
                          color: Colors.white,
                        ),
                        child: Text(
                          tag,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.black.withOpacity(0.87),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
