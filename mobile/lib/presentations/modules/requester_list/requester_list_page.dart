import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/requester_list/cubit/requester_list_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/router/route_aware_mixin.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RequesterListPage extends StatefulWidget {
  final String phoneNumber;
  const RequesterListPage({super.key, required this.phoneNumber});

  @override
  State<RequesterListPage> createState() => _RequesterListPageState();
}

class _RequesterListPageState extends State<RequesterListPage>
    with RouteAware, RouteAwareMixin<RequesterListPage> {
  final cubit = RequesterListCubit();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        cubit.getRequesterList(widget.phoneNumber);
      },
    );
  }

  @override
  onFocus() {
    cubit.getRequesterList(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return Scaffold(
      body: BlocProvider<RequesterListCubit>(
        create: (context) => cubit,
        child: BlocConsumer<RequesterListCubit, RequesterListState>(
            listener: (context, state) {
          if (state.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state.messageError.isNotEmpty) {
            AppUtils.showSnackBarError(
                context: context, title: state.messageError);
          }
        }, builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(title: S.current.idList),
                SizedBox(height: 24.h),
                Text(
                  S.current.authenticationRequest,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 24.h),
                if (state.requesterList.isEmpty)
                  Center(
                    child: Text(
                      S.current.noRequest,
                    ),
                  ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: state.requesterList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemBuilder: (context, index) {
                      final item = state.requesterList[index];

                      return buidItem(item, theme, colors);
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  buidItem(RelationUserModel item, ThemeData theme, AppColors colors) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: ChonColors.bgPage,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.r),
        ),
      ),
      onPressed: () {
        if (item.certOwnerId == null) return;
        cubit.getLinkAndRedirect(item.certOwnerId!);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.r),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.certOwnerName ?? '',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
              decoration: BoxDecoration(
                color: colors.lightYellow,
                borderRadius: BorderRadius.circular(200.r),
              ),
              child: Text(
                item.certOwnerPhone ?? '',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xffEF710F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
