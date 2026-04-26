import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/home/cubit/home_cubit.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/presentations/widgets/chon_bottom_navigation_bar.dart';
import 'package:base_flutter/presentations/widgets/chon_quick_action_button.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/router/route_aware_mixin.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

/// Figma-faithful version of the Home screen.
///
/// Matches `Home` (`473:27963`) on the CHON 1.1 page. Uses
/// [ChonColors], [ChonBottomNavigationBar], [ChonQuickActionGrid].
///
/// The legacy [HomePage] is preserved for now — swap in
/// `app_navigator.dart` once this page reaches feature parity.
class HomePageV2 extends StatefulWidget {
  const HomePageV2({super.key, this.cubit});

  /// Inject a cubit for testing. Production callers should leave this
  /// `null` and let the page create its own.
  final HomeCubit? cubit;

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2>
    with RouteAware, RouteAwareMixin<HomePageV2> {
  late final HomeCubit cubit = widget.cubit ?? HomeCubit();
  AppCubit? get _appCubit {
    try {
      return Injector.getIt<AppCubit>();
    } catch (_) {
      return null;
    }
  }

  ChonNavTab _selectedTab = ChonNavTab.home;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.loadData();
    });
    super.initState();
  }

  @override
  void onFocus() {
    final app = _appCubit;
    if (app != null && app.needRefreshHome) {
      cubit.loadData();
      app.needRefreshHome = false;
    }
  }

  // ---- Navigation handlers --------------------------------------------------

  void _onTapNotifications() {
    if (cubit.state.requesterList.isNotEmpty) {
      _onRedirectRequesterList();
    }
  }

  void _onRedirectRequesterList() {
    final phone = cubit.state.listCards.firstOrNull?.phoneNumber;
    if (phone != null && phone.isNotEmpty) {
      AppNavigator.push(Routes.requesterListPage, phone);
    } else {
      AppNavigator.push(Routes.guardPage);
    }
  }

  void _onTapTutorial() {
    // Tutorial flow re-entry; for now route to splash which kicks off the
    // onboarding stepper. Replace with a dedicated tutorial route if added.
    AppNavigator.push(Routes.splash);
  }

  void _onTapMutualAuth() {
    AppNavigator.push(Routes.selfIdListChoose);
  }

  void _onTapContact() {
    AppNavigator.push(Routes.selfIdListChoose, SelfIdListChooseType.contact);
  }

  void _onTapEditProfile() {
    final card = cubit.state.listCards.elementAtOrNull(cubit.idIndex);
    AppNavigator.push(Routes.profileEdit, card);
  }

  void _onTapQrCode() {
    AppNavigator.push(Routes.qrScan);
  }

  void _onTapSupport() {
    AppNavigator.push(Routes.reportPage);
  }

  void _onTabSelected(ChonNavTab tab) {
    setState(() => _selectedTab = tab);
    switch (tab) {
      case ChonNavTab.home:
        // Already on home — no-op.
        break;
      case ChonNavTab.chon:
        // CHON tab — route TBD. For now treat as AI chat entry.
        AppNavigator.push(Routes.chat, '');
        break;
      case ChonNavTab.idCard:
        if (cubit.state.listCards.isEmpty) {
          AppNavigator.push(Routes.selfIdCreaterOption);
        } else {
          AppNavigator.push(Routes.selfIdList);
        }
        break;
      case ChonNavTab.mutualAuth:
        AppNavigator.push(Routes.selfIdListChoose);
        break;
      case ChonNavTab.familyTree:
        AppNavigator.push(Routes.familyTree);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        bloc: cubit,
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
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ChonColors.bgPage,
            body: SafeArea(
              bottom: false,
              child: RefreshIndicator(
                onRefresh: () => cubit.loadData(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _Header(
                        notificationCount: state.requesterList.length,
                        onTapNotifications: _onTapNotifications,
                      ),
                      _Banner(onTap: _onTapMutualAuth),
                      SizedBox(height: 8.h),
                      _MainCards(
                        onTapTutorial: _onTapTutorial,
                        onTapMutualAuth: _onTapMutualAuth,
                      ),
                      SizedBox(height: 16.h),
                      ChonQuickActionGrid(
                        actions: [
                          ChonQuickActions.contact(
                            icon: const Icon(
                              Icons.call_outlined,
                              color: ChonColors.textPrimary,
                            ),
                            onTap: _onTapContact,
                          ),
                          ChonQuickActions.editProfile(
                            icon: const Icon(
                              Icons.person_outline,
                              color: ChonColors.textPrimary,
                            ),
                            onTap: _onTapEditProfile,
                          ),
                          ChonQuickActions.qrCode(
                            icon: const Icon(
                              Icons.qr_code,
                              color: ChonColors.textPrimary,
                            ),
                            onTap: _onTapQrCode,
                          ),
                          ChonQuickActions.support(
                            icon: const Icon(
                              Icons.help_outline,
                              color: ChonColors.textPrimary,
                            ),
                            onTap: _onTapSupport,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: ChonBottomNavigationBar(
                selected: _selectedTab,
                onTap: _onTabSelected,
                iconBuilder: (tab, isSelected) {
                  if (tab == ChonNavTab.idCard) {
                    return const Icon(
                      Icons.badge_outlined,
                      color: ChonColors.textInverse,
                      size: 22,
                    );
                  }
                  final color = isSelected
                      ? ChonColors.textSecondary
                      : ChonColors.iconDisabledStrong;
                  switch (tab) {
                    case ChonNavTab.home:
                      return Icon(Icons.home_outlined,
                          color: color, size: 22);
                    case ChonNavTab.chon:
                      return Icon(Icons.bubble_chart_outlined,
                          color: color, size: 22);
                    case ChonNavTab.mutualAuth:
                      return Icon(Icons.shield_outlined,
                          color: color, size: 22);
                    case ChonNavTab.familyTree:
                      return Icon(Icons.account_tree_outlined,
                          color: color, size: 22);
                    case ChonNavTab.idCard:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Top header with logo placeholder and notification bell.
class _Header extends StatelessWidget {
  const _Header({
    required this.notificationCount,
    required this.onTapNotifications,
  });

  final int notificationCount;
  final VoidCallback onTapNotifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
      child: Row(
        children: [
          // Logo placeholder. Replace with `Assets.icons.chonLogo.svg(...)`
          // once the SVG is exported from Figma.
          SizedBox(
            width: 97.w,
            height: 24.h,
            child: Row(
              children: [
                Container(
                  width: 22.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: ChonColors.brandDark,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'CHON',
                  style: ChonTextStyles.cardTitle()
                      .copyWith(fontSize: 16.sp, height: 1.2),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTapNotifications,
            child: SizedBox(
              key: const Key('home.notification_bell'),
              width: 42.r,
              height: 42.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: ChonColors.iconStrong,
                    size: 24,
                  ),
                  if (notificationCount > 0)
                    Positioned(
                      right: 6.r,
                      top: 6.r,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: ChonColors.brandPrimary,
                          borderRadius:
                              BorderRadius.circular(ChonShape.radiusPill),
                        ),
                        constraints: BoxConstraints(minWidth: 16.r),
                        child: Text(
                          '$notificationCount',
                          style: ChonTextStyles.navLabel(
                              color: ChonColors.textInverse),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "상호인증으로 CHON ID를 만들어보세요." banner card.
class _Banner extends StatelessWidget {
  const _Banner({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ChonShape.pagePaddingX, 8.h, ChonShape.pagePaddingX, 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: ChonColors.bgSurface,
            borderRadius: BorderRadius.circular(ChonShape.radiusCard),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.verified_user_outlined,
                size: 24,
                color: ChonColors.textPrimary,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '상호인증으로 CHON ID를 만들어보세요.',
                  style: ChonTextStyles.body(size: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tutorial card + 상호 인증 card stacked vertically.
class _MainCards extends StatelessWidget {
  const _MainCards({
    required this.onTapTutorial,
    required this.onTapMutualAuth,
  });

  final VoidCallback onTapTutorial;
  final VoidCallback onTapMutualAuth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ChonShape.pagePaddingX, 8.h, ChonShape.pagePaddingX, 16.h),
      child: Column(
        children: [
          _TutorialCard(onTap: onTapTutorial),
          SizedBox(height: 8.h),
          _MutualAuthCard(onTap: onTapMutualAuth),
        ],
      ),
    );
  }
}

class _TutorialCard extends StatelessWidget {
  const _TutorialCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 144.h,
        padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2540),
          borderRadius: BorderRadius.circular(ChonShape.radiusCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '나를 확인 받는\nCHON DID 튜토리얼',
              style: ChonTextStyles.cardTitle(color: ChonColors.textInverse),
            ),
            Container(
              width: 70.w,
              height: 26.h,
              decoration: BoxDecoration(
                border: Border.all(color: ChonColors.textInverse, width: 2),
                borderRadius: BorderRadius.circular(ChonShape.radiusPill),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 8.w),
              child: const Icon(
                Icons.arrow_forward,
                color: ChonColors.textInverse,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MutualAuthCard extends StatelessWidget {
  const _MutualAuthCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.h,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: ChonColors.bgSurface,
          borderRadius: BorderRadius.circular(ChonShape.radiusCard),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('상호 인증', style: ChonTextStyles.cardTitle()),
                  Text(
                    '가족, 인척과\n서로를 확인받기',
                    style: ChonTextStyles.body(
                        size: 14, color: ChonColors.textSecondary, height: 1.1),
                  ),
                ],
              ),
            ),
            // Decorative illustration placeholder. Replace with the
            // actual Figma export (`assets/images/mutual_auth.png` or
            // SVG) once exported.
            SizedBox(
              width: 110.w,
              height: 120.h,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 6.h,
                    child: Container(
                      width: 90.r,
                      height: 90.r,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFE7B8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    top: 24.h,
                    child: Container(
                      width: 60.r,
                      height: 60.r,
                      decoration: const BoxDecoration(
                        color: ChonColors.brandPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
