import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfIdOcrOptionPage extends StatefulWidget {
  const SelfIdOcrOptionPage({super.key});

  @override
  State<SelfIdOcrOptionPage> createState() => _SelfIdOcrOptionPageState();
}

class _SelfIdOcrOptionPageState extends State<SelfIdOcrOptionPage> {
  OcrType? type;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 16.r),
            Text(
              S.current.howToCreateSelfId,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 16.r),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: OcrType.values.map((e) {
                final isSelected = type == e;
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      type = e;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isSelected ? colors.darkYellow : colors.lightYellow,
                    minimumSize:
                        Size((ScreenUtil().screenWidth - 44.w) / 2, 100.h),
                    maximumSize:
                        Size((ScreenUtil().screenWidth - 44.w) / 2, 100.h),
                  ),
                  child: Text(
                    e.displayName,
                    style: theme.textTheme.titleMedium,
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: ElevatedButton(
                  onPressed: () {
                    switch (type) {
                      case OcrType.identityCard:
                      case OcrType.driverLicense:
                      case OcrType.passport:
                        AppNavigator.push(Routes.ocrId, type);
                        return;
                      case OcrType.other:
                        AppNavigator.push(Routes.selfIdCreater);
                        return;
                      default:
                        return;
                    }
                  },
                  child: Text(S.current.confirm),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
