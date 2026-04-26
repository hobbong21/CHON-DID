import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfIdCreaterOptionPage extends StatefulWidget {
  const SelfIdCreaterOptionPage({super.key});

  @override
  State<SelfIdCreaterOptionPage> createState() =>
      _SelfIdCreaterOptionPageState();
}

class _SelfIdCreaterOptionPageState extends State<SelfIdCreaterOptionPage> {
  SelfIdInputType? type;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
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
            Item(
              title: S.current.captureIdCard,
              subTitle: S.current.idCardTypes,
              icon: Assets.icons.card.svg(),
              isSelected: type == SelfIdInputType.ocr,
              onPress: () {
                setState(() {
                  type = SelfIdInputType.ocr;
                });
                // AppNavigator.push(Routes.ocrId);
              },
            ),
            SizedBox(height: 8.r),
            Item(
              title: S.current.manualInput,
              icon: Assets.icons.enterInput.svg(),
              isSelected: type == SelfIdInputType.field,
              onPress: () {
                setState(() {
                  type = SelfIdInputType.field;
                });
                // AppNavigator.push(Routes.selfIdCreater);
              },
            ),
            Spacer(),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: ElevatedButton(
                  onPressed: () {
                    switch (type) {
                      case SelfIdInputType.ocr:
                        AppNavigator.push(Routes.selfIdOcrOption);
                        return;
                      case SelfIdInputType.field:
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

enum SelfIdInputType {
  ocr,
  field,
}
