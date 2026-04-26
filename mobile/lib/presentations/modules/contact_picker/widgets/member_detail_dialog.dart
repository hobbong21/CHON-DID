import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/modules/contact_picker/cubit/contact_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberDetailDialog extends StatelessWidget {
  final String name;
  final String relationship;
  final String phoneNumber;
  final String avatar;

  const MemberDetailDialog({
    super.key,
    required this.name,
    required this.relationship,
    required this.phoneNumber,
    required this.avatar,
  });

  static Future<void> show(
    BuildContext context, {
    required ContactPickerCubit cubit,
    required String name,
    required String relationship,
    required String phoneNumber,
    required String avatar,
  }) {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: MemberDetailDialog(
          name: name,
          relationship: relationship,
          phoneNumber: phoneNumber,
          avatar: avatar,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Header(),
            SizedBox(height: 10.h),
            Center(
              child: Container(
                width: 240.h,
                height: 220.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: (avatar.isNotEmpty)
                      ? Image.network(avatar, fit: BoxFit.cover)
                      : Container(
                          color: colors.greyBackground,
                        ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      relationship,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  phoneNumber,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  icon: Assets.icons.phone.svg(),
                  label: S.current.makeCall,
                  onTap: () {
                    context
                        .read<ContactPickerCubit>()
                        .makePhoneCall(phoneNumber);
                  },
                ),
                SizedBox(width: 12.w),
                _buildActionButton(
                  context,
                  icon: Assets.icons.message.svg(),
                  label: S.current.sendSms,
                  onTap: () {
                    context
                        .read<ContactPickerCubit>()
                        .sendSms(context, phoneNumber);
                  },
                ),
                SizedBox(width: 12.w),
                _buildActionButton(
                  context,
                  icon: Assets.icons.chat.svg(),
                  label: S.current.message,
                  onTap: () {
                    context
                        .read<ContactPickerCubit>()
                        .shareContactInfo(context, phoneNumber);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required Widget icon,
      required String label,
      required VoidCallback onTap}) {
    final colors = context.colors;

    return Expanded(
      child: Material(
        color: colors.primary,
        borderRadius: BorderRadius.circular(30.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 24.sp, height: 24.sp, child: icon),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
