import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_cross/cubit/verification_cross_cubit.dart';
import 'package:base_flutter/presentations/modules/verification_cross/input_conract/input_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../input_conract/input_contact.dart';

class RequestVerificationTab extends StatefulWidget {
  const RequestVerificationTab({super.key});

  @override
  State<RequestVerificationTab> createState() => _RequestVerificationTabState();
}

class _RequestVerificationTabState extends State<RequestVerificationTab> {
  late final VerificationCrossCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read();
    cubit.getRelationUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  S.current.enterNameAndRelationship,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 32.h),
                ...[
                  for (final relation in cubit.state.relations) ...[
                    InputContact(relation: relation),
                    SizedBox(height: 16.h),
                  ]
                ],
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
        ElevatedButton.icon(
          onPressed: () {
            cubit.onTapSend();
          },
          icon: Assets.icons.message.svg(),
          label: Text(S.current.sendTextMessage),
        ),
        SizedBox(height: 8.h),
        ElevatedButton.icon(
          onPressed: () {
            cubit.onTapCopy();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.lightYellow,
            foregroundColor: colors.black,
            overlayColor: colors.darkYellow,
          ),
          icon: Assets.icons.share.svg(),
          label: Text(S.current.copyVerificationLink),
        ),
        SafeArea(top: false, child: SizedBox(height: 4.h)),
      ],
    );
  }
}
