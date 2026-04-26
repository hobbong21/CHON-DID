import 'dart:ui';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_finish/widgets/block_loading.dart';
import 'package:base_flutter/presentations/widgets/background.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/logo.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/presentations/modules/request_verification/cubit/request_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RequestVerification extends StatefulWidget {
  const RequestVerification({super.key});

  @override
  State<RequestVerification> createState() => _RequestVerificationState();
}

class _RequestVerificationState extends State<RequestVerification> {
  final cubit = RequestVerificationCubit();
  bool _isInit = false;
  bool _isVerify = false;

  bool get isAdd => cubit.state.card?.status != CardStatusE.verified;
  int? cardId;
  bool isNewCreated = false;
  bool isViewFamily = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    final extra = GoRouterState.of(context).extra as Map?;

    cardId = extra?['cardId'] as int?;
    final token = extra?['token'] as String?;
    isNewCreated = extra?['isNewCreated'] as bool? ?? false;
    isViewFamily = extra?['isViewFamily'] as bool? ?? false;

    if (cardId != null) {
      cubit.init(cardId!);
    } else {
      cubit.initByToken(token);
      _isVerify = true;
    }
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Background(
          child:
              BlocBuilder<RequestVerificationCubit, RequestVerificationState>(
            builder: (context, state) {
              final card = state.card;

              return PopScope(
                canPop: !isNewCreated,
                onPopInvokedWithResult: (didPop, result) {
                  if (didPop) return;
                  AppNavigator.popToHead();
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(
                              onBack:
                                  isNewCreated ? AppNavigator.popToHead : null),
                          SizedBox(
                              height: isAdd && !isViewFamily ? 20.h : 40.h),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: isViewFamily
                                        ? null
                                        : Text(
                                            isAdd
                                                ? S.current
                                                    .requestVerificationGuide
                                                : S.current.copyIdLink,
                                            style:
                                                textTheme.titleLarge?.copyWith(
                                              color: colors.white,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height:
                                        isAdd && !isViewFamily ? 12.h : 44.h,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 320.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: colors.white),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 8, sigmaY: 8),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: isViewFamily
                                                      ? 16.r
                                                      : 28.r),
                                              color: Color(0xffffca6c)
                                                  .withAlpha(160),
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    isViewFamily
                                                        ? S.current
                                                            .familyCertificate
                                                        : isAdd
                                                            ? 'Self ID'
                                                            : 'Chon ID',
                                                    style: textTheme.titleLarge
                                                        ?.copyWith(
                                                      color: colors.white,
                                                      fontSize: 28.sp,
                                                    ),
                                                  ),
                                                  if (isViewFamily)
                                                    Text(
                                                      'Family Tree',
                                                      style: textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                        color: colors.white,
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 24.r,
                                                horizontal: 12.r,
                                              ),
                                              color: Color(0xffffd7a4)
                                                  .withAlpha(180),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 170.r,
                                                    width: 130.r,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white24,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r),
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Image.network(
                                                      card?.imgPath ?? '',
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return SizedBox
                                                            .shrink();
                                                      },
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(height: 16.h),
                                                  Text(
                                                    card?.name ?? '',
                                                    style: textTheme.titleLarge
                                                        ?.copyWith(
                                                            color:
                                                                colors.white),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  // if (card?.name != null)
                                                  //   Text(
                                                  //     'Hong gil soon',
                                                  //     style: textTheme.bodyLarge
                                                  //         ?.copyWith(
                                                  //             color:
                                                  //                 colors.white),
                                                  //   ),
                                                  Text(
                                                    card?.idNumber
                                                                ?.isNotEmpty ==
                                                            true
                                                        ? '${card?.idNumber?.substring(0, 6)}-${card?.idNumber?.substring(6, 7)}******'
                                                        : '',
                                                    style: textTheme.bodyLarge
                                                        ?.copyWith(
                                                            color:
                                                                colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 88.r,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (card?.status ==
                                                            CardStatusE
                                                                .verified) {
                                                          AppNavigator.push(
                                                              Routes.imageView,
                                                              {
                                                                'image':
                                                                    card?.shareLink ??
                                                                        '',
                                                                'isQr': true,
                                                              });
                                                        }
                                                      },
                                                      child: card?.status ==
                                                              CardStatusE
                                                                  .verified
                                                          ? QrImageView(
                                                              data:
                                                                  card?.shareLink ??
                                                                      '',
                                                              size: 88.r,
                                                              eyeStyle:
                                                                  QrEyeStyle(
                                                                color: colors
                                                                    .white,
                                                                eyeShape:
                                                                    QrEyeShape
                                                                        .square,
                                                              ),
                                                              dataModuleStyle:
                                                                  QrDataModuleStyle(
                                                                color: colors
                                                                    .white,
                                                                dataModuleShape:
                                                                    QrDataModuleShape
                                                                        .square,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                                  Logo(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  if (isAdd || isViewFamily)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: colors.lightYellow,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                      padding: EdgeInsets.all(8.r),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: colors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                            ),
                                            padding: EdgeInsets.all(8.r),
                                            width: 40.r,
                                            height: 40.r,
                                            child: Assets.icons.redo.svg(),
                                          ),
                                          SizedBox(width: 12.r),
                                          Text(
                                            '${S.current.verificationPoint}  ${card?.pointVerify ?? 0}',
                                            style:
                                                textTheme.titleMedium?.copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ),
                          ),
                          SafeArea(
                            top: false,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (isViewFamily &&
                                          state.card?.id != null) {
                                        AppNavigator.push(
                                          Routes.contactPicker,
                                          state.card!.id,
                                        );
                                      } else if (isAdd) {
                                        AppNavigator.push(
                                          Routes.verificationCross,
                                          cardId,
                                        );
                                      } else if (_isVerify) {
                                        cubit.verify();
                                      } else {
                                        cubit.onTapCopy();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colors.lightYellow,
                                      minimumSize: Size(
                                          ScreenUtil().screenWidth * .7, 44.r),
                                    ),
                                    child: Text(
                                      isViewFamily
                                          ? S.current.viewFamilyTree
                                          : isAdd
                                              ? S.current.mutualAuthentication
                                              : _isVerify
                                                  ? S.current.checkOriginal
                                                  : S.current.copyLink,
                                      style: textTheme.titleMedium?.copyWith(
                                          color: ChonColors.textSecondary),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.isLoadingBlock) BlockLoading(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
