import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/chat_bot/widgets/input_chat.dart';
import 'package:base_flutter/presentations/modules/home/cubit/home_cubit.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/presentations/modules/uni_links/uni_app.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/router/route_aware_mixin.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

const kAgreedTerms = 'kAgreedTerms';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RouteAware, RouteAwareMixin<HomePage> {
  final cubit = HomeCubit();
  final appCubit = Injector.getIt<AppCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.loadData();
    });
    super.initState();
  }

  @override
  onFocus() {
    if (appCubit.needRefreshHome) {
      cubit.loadData();
      appCubit.needRefreshHome = false;
    }
  }

  onRedirectRequesterList() {
    final phone = cubit.state.listCards.firstOrNull?.phoneNumber;
    if (phone?.isNotEmpty == true) {
      AppNavigator.push(Routes.requesterListPage, phone);
    } else {
      AppNavigator.push(Routes.guardPage);
    }
  }

  onRedirectProfile() {
    AppNavigator.push(
      Routes.profile,
      cubit.state.listCards.elementAtOrNull(cubit.idIndex)?.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;
    return UniApp(
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<HomeCubit, HomeState>(
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
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        SizedBox(height: 16.h),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => cubit.loadData(),
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (state.requesterList.isNotEmpty)
                                    GestureDetector(
                                      onTap: onRedirectRequesterList,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Assets.icons.required.svg(
                                                width: 20.r,
                                                height: 20.r,
                                              ),
                                            ),
                                            WidgetSpan(
                                                child: SizedBox(width: 8.w)),
                                            TextSpan(
                                              text: S.current.verifyRequest,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                color: colors.primary,
                                              ),
                                            ),
                                            TextSpan(
                                              text: S.current.issueNumber,
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    S.current.howCanIhelpYou,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 16.h),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (state.listCards.isEmpty) {
                                                AppNavigator.push(
                                                    Routes.selfIdCreaterOption);
                                              } else {
                                                onRedirectProfile();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(16.r),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 54.r,
                                                  height: 54.r,
                                                  decoration: BoxDecoration(
                                                    color: colors.lightYellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.r),
                                                  ),
                                                  padding: EdgeInsets.all(12.r),
                                                  child: state
                                                          .listCards.isNotEmpty
                                                      ? Assets.icons.card.svg()
                                                      : Assets.icons.selfid
                                                          .svg(),
                                                ),
                                                SizedBox(
                                                  height: 16.h,
                                                  width: double.infinity,
                                                ),
                                                Spacer(),
                                                if (state.listCards.isNotEmpty)
                                                  _ids(state, theme, colors)
                                                else ...[
                                                  Text(
                                                    S.current.createSelfIdTitle,
                                                    style: theme
                                                        .textTheme.titleLarge
                                                        ?.copyWith(
                                                      color: colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    S.current.firstTimeChon,
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      color: colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.h),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              AppNavigator.push(
                                                  Routes.selfIdListChoose);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  colors.darkYellow,
                                              padding: EdgeInsets.all(16.r),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    minHeight: 150.r,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 54.r,
                                                        height: 54.r,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: colors
                                                              .lightYellow,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.r),
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            16.r),
                                                        child: Assets
                                                            .icons.userGroup
                                                            .svg(),
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                        width: double.infinity,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        S.current
                                                            .mutualAuthTitle,
                                                        style: theme.textTheme
                                                            .titleLarge,
                                                      ),
                                                      if (state.requesterList
                                                          .isEmpty)
                                                        Text(
                                                          S.current
                                                              .mutualAuthDesc,
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                if (state
                                                    .requesterList.isNotEmpty)
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200.r),
                                                      onTap:
                                                          onRedirectRequesterList,
                                                      child: Container(
                                                        width: 32.r,
                                                        height: 32.r,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            100.r,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          '${state.requesterList.length}',
                                                          style: theme.textTheme
                                                              .bodyMedium
                                                              ?.copyWith(
                                                            color: colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 32.h),
                                  Text(
                                    S.current.inputInfoTitle,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 16.h),
                                  Item(
                                    title: S.current.contactAction,
                                    icon: Assets.icons.call.svg(),
                                    onPress: () {
                                      AppNavigator.push(
                                        Routes.selfIdListChoose,
                                        SelfIdListChooseType.contact,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 12.h),
                                  Item(
                                    title: S.current.qrCheckInOut,
                                    icon: Assets.icons.qr.svg(),
                                    onPress: () {
                                      AppNavigator.push(Routes.qrScan);
                                    },
                                  ),
                                  SizedBox(height: 12.h),
                                  Item(
                                    title: S.current.bankInfo,
                                    icon: Assets.icons.bank.svg(),
                                    onPress: () {
                                      final agreed =
                                          AppSP.get(kAgreedTerms) as bool?;
                                      if (agreed ?? false) {
                                        AppNavigator.push(Routes.bankList);
                                      } else {
                                        AppNavigator.push(Routes.terms);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InputChat(
                          controller: cubit.chatController,
                          onTapSend: () {
                            AppNavigator.push(
                                Routes.chat, cubit.chatController.text);
                            cubit.chatController.clear();
                          },
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: onRedirectProfile,
          icon: Assets.icons.option.svg(),
        ),
      ],
    );
  }

  _ids(HomeState state, ThemeData theme, AppColors colors) {
    return CarouselSlider.builder(
      itemCount: state.listCards.length,
      itemBuilder: (c, i, rI) {
        final card = state.listCards[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: double.infinity),
            Text(
              '${card.name ?? 'Self ID'} #${card.id}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (card.issuedDate != null)
              Text(
                '(${S.current.info_issued_date(card.issuedDate!.replaceAll('-', '.'))})',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: state.listCards.length > 1,
        autoPlayInterval: const Duration(seconds: 3),
        height: 54.r,
        onPageChanged: (index, reason) {
          cubit.changeIdIndex(index);
        },
      ),
    );
  }
}
