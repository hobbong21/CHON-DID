import 'dart:ui';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/presentations/modules/verification_finish/widgets/block_loading.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/logo.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/presentations/modules/check_in_out/cubit/check_in_out_cubit.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckInOutPage extends StatefulWidget {
  const CheckInOutPage({super.key});

  @override
  State<CheckInOutPage> createState() => _CheckInOutPageState();
}

class _CheckInOutPageState extends State<CheckInOutPage> {
  final cubit = CheckInOutCubit();
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    final extra = GoRouterState.of(context).extra;
    if (extra is Map) {
      final cardId = extra['cardId'] as int?;
      final eventId = extra['eventId'] as int?;

      if (cardId != null) {
        cubit.init(cardId: cardId, eventId: eventId);
      }
    }
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Expanded(
                    child: BlocConsumer<CheckInOutCubit, CheckInOutState>(
                        listener: (context, state) {
                      if (state.errorMessage.isNotEmpty) {
                        AppUtils.showSnackBarError(
                            context: context, title: state.errorMessage);
                      }
                    }, builder: (context, state) {
                      final card = state.card;

                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        children: [
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              S.current.confirmCheckInOut,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: 320.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.r),
                                    color: Color(0xfffff5e4),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          S.current.familyCertificate,
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        Text(
                                          'Family Tree',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    color: Color(0xffffeecf),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        _deco(460.r),
                                        _deco(340.r),
                                        _deco(220.r),
                                        _deco(100.r),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 24.r),
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
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return SizedBox.shrink();
                                                  },
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(height: 16.h),
                                              Text(
                                                card?.name ?? '',
                                                style:
                                                    theme.textTheme.titleLarge,
                                              ),
                                              SizedBox(height: 4.h),
                                              // if (card?.name != null)
                                              //   Text(
                                              //     'Hong gil soon',
                                              //     style: theme.textTheme.bodyLarge,
                                              //   ),
                                              if (card?.idNumber != null &&
                                                  card!.idNumber!.length > 7)
                                                Text(
                                                  '${card.idNumber!.substring(0, 6)}-${card.idNumber!.substring(6, 7)}******',
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              SizedBox(
                                                height: 88.r,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (card?.status ==
                                                        CardStatusE.verified) {
                                                      AppNavigator.push(
                                                          Routes.imageView, {
                                                        'image':
                                                            card?.shareLink ??
                                                                '',
                                                        'isQr': true,
                                                      });
                                                    }
                                                  },
                                                  child: (card?.status ==
                                                          CardStatusE.verified)
                                                      ? QrImageView(
                                                          data:
                                                              card?.shareLink ??
                                                                  '',
                                                          size: 88.r,
                                                          eyeStyle: QrEyeStyle(
                                                            color: ChonColors.textSecondary,
                                                            eyeShape: QrEyeShape
                                                                .square,
                                                          ),
                                                          dataModuleStyle:
                                                              QrDataModuleStyle(
                                                            color: ChonColors.textSecondary,
                                                            dataModuleShape:
                                                                QrDataModuleShape
                                                                    .square,
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ),
                                              ),
                                              SizedBox(height: 12.r),
                                              Logo(color: ChonColors.textSecondary),
                                              SizedBox(height: 12.r),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.checkIn();
                          },
                          child: Text(S.current.checkIn),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.checkOut();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.lightYellow,
                            foregroundColor: ChonColors.textSecondary,
                            overlayColor: colors.darkYellow,
                          ),
                          child: Text(S.current.checkOut),
                        ),
                      ),
                    ],
                  ),
                  SafeAreaBottom(),
                ],
              ),
            ),
            BlocBuilder<CheckInOutCubit, CheckInOutState>(
              builder: (context, state) {
                if (state.isVisiting) {
                  return BlockLoading();
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  _deco(double size) {
    return Positioned(
      bottom: -size / 2,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white60,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(size),
        ),
      ),
    );
  }
}
