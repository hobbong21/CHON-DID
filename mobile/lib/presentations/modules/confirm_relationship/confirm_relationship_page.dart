import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/confirm_relationship/cubit/confirm_relationship_cubit.dart';
import 'package:base_flutter/presentations/modules/verification_finish/widgets/block_loading.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ConfirmRelationshipPage extends StatefulWidget {
  final String requestId;

  const ConfirmRelationshipPage({super.key, required this.requestId});

  @override
  State<ConfirmRelationshipPage> createState() =>
      _ConfirmRelationshipPageState();
}

class _ConfirmRelationshipPageState extends State<ConfirmRelationshipPage> {
  final cubit = ConfirmRelationshipCubit();

  @override
  void initState() {
    super.initState();
    cubit.load(widget.requestId);
  }

  CardInfoItem? get info => cubit.state.info;
  CardInfoItem? get owner => cubit.state.owner;
  RelationUserModel? get relation => cubit.state.relation;
  GenderE get ownerGender =>
      owner?.gender == GenderCardE.female ? GenderE.female : GenderE.male;
  String? get relationReversed =>
      relation?.relationType?.reversed(ownerGender).title;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ConfirmRelationshipCubit, ConfirmRelationshipState>(
        listener: (context, state) {
          if (state.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }

          if (state.messageError.isNotEmpty) {
            AppUtils.showSnackBarError(
              context: context,
              title: state.messageError,
            );
          }
        },
        bloc: cubit,
        builder: (context, state) {
          final haveDatas = info != null && owner != null && relation != null;

          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(height: 40.h),
                      if (state.isLoading)
                        SizedBox.shrink()
                      else if (!haveDatas)
                        Center(child: Text(S.current.phoneNotMatch))
                      else ...[
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 28.sp,
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: info?.name,
                                style: theme.textTheme.headlineLarge
                                    ?.copyWith(color: colors.primary),
                              ),
                              TextSpan(
                                text: S.current.verificationRequestedBy,
                                style: theme.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(S.current.registerToFamilyTreeGuide,
                            style: theme.textTheme.titleMedium),
                        const Spacer(flex: 2),
                        Center(
                          child: Column(
                            children: [
                              _buildSpeechBubble(context),
                              SizedBox(height: 20.h),
                              Container(
                                width: 110.r,
                                height: 146.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.grey.shade200,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.network(
                                    info?.imgPath ?? '',
                                    errorBuilder: (context, error, stackTrace) {
                                      return SizedBox.shrink();
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                info?.name ?? '',
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                relationReversed ?? '',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 3),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56.h,
                                child: ElevatedButton(
                                  onPressed: () => cubit.onTapRefusal(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.lightYellow,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                  child: Text(
                                    S.current.refusal,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: SizedBox(
                                height: 56.h,
                                child: ElevatedButton(
                                  onPressed: () => cubit.onTapApproval(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                  child: Text(
                                    S.current.approval,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SafeAreaBottom(),
                    ],
                  ),
                ),
                if (state.isLoadingBlock) BlockLoading(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpeechBubble(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: colors.lightYellow,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black87,
                height: 1.4,
                fontSize: 14.sp,
              ),
              children: [
                TextSpan(
                    text: S.current.ownerName(owner?.name ?? ''),
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: info?.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: colors.primary),
                ),
                TextSpan(
                    text: S.current.confirmRelationSuffix(relationReversed!),
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -9.h),
          child: Transform.rotate(
            angle: 3.14 / 4,
            child: Container(
              width: 20.w,
              height: 20.w,
              color: colors.lightYellow,
            ),
          ),
        ),
      ],
    );
  }
}
