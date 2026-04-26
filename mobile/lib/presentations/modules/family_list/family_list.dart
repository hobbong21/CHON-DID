import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/chat_bot/widgets/input_chat.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'cubit/family_list_cubit.dart';

class FamilyList extends StatefulWidget {
  final int cardId;
  const FamilyList({super.key, required this.cardId});

  @override
  State<FamilyList> createState() => _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  final cubit = FamilyListCubit();
  final chatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.init(widget.cardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<FamilyListCubit, FamilyListState>(
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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Header(title: 'Chon ID #${cubit.cardId}'),
                SizedBox(height: 8.h),
                if (state.relations.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 64.h),
                    child: Text(
                      S.current.noContact,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: colors.grey),
                    ),
                  ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: state.relations.length,
                    itemBuilder: (context, index) {
                      return _item(
                        item: state.relations[index],
                        colors: colors,
                        theme: theme,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 4),
                  ),
                ),
                InputChat(
                  controller: chatController,
                  onTapSend: () {
                    AppNavigator.push(Routes.chat, chatController.text);
                    chatController.clear();
                  },
                ),
                SafeAreaBottom(),
              ],
            ),
          ),
        );
      }),
    );
  }

  _item({
    required RelationUserModel item,
    required AppColors colors,
    required ThemeData theme,
  }) {
    return ExpansionTile(
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Text(item.certRelatedName ?? ''),
      showTrailingIcon: false,
      leading: Container(
          width: 44.r,
          height: 44.r,
          padding: EdgeInsets.all(8.r),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: item.spouseId == null ? colors.darkBlue : colors.grey,
              borderRadius: BorderRadius.circular(12.r)),
          child: item.relationType != null
              ? Image.asset(
                  item.relationType!.iconPath(item.gender ?? GenderE.male),
                  width: 30.r)
              : null),
      subtitle: Text(item.certRelatedPhone ?? ''),
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  cubit.makePhoneCall(item.certRelatedPhone ?? '');
                },
                label: Column(
                  children: [
                    Assets.icons.phone.svg(width: 20.r),
                    SizedBox(height: 4.h),
                    Text(
                      S.current.makeCall,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  cubit.sendSms(context, item.certRelatedPhone ?? '');
                },
                label: Column(
                  children: [
                    Assets.icons.message.svg(width: 20.r),
                    SizedBox(height: 4.h),
                    Text(
                      S.current.sendSms,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  cubit.shareContactInfo(context, item.certRelatedPhone ?? '');
                },
                label: Column(
                  children: [
                    Assets.icons.chat.svg(width: 20.r),
                    SizedBox(height: 4.h),
                    Text(
                      S.current.message,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
