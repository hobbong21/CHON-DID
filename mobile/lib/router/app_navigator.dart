import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/presentations/modules/bank_create/bank_create_page.dart';
import 'package:base_flutter/presentations/modules/bank_create/bank_create_success.dart';
import 'package:base_flutter/presentations/modules/bank_list/bank_list_page.dart';
import 'package:base_flutter/presentations/modules/bank_list/terms.dart';
import 'package:base_flutter/presentations/modules/biography/biography_page.dart';
import 'package:base_flutter/presentations/modules/chat_bot/chat_bot_page.dart';
import 'package:base_flutter/presentations/modules/check_in_out/check_in_out_page.dart';
import 'package:base_flutter/presentations/modules/confirm_relationship/confirm_relationship_page.dart';
import 'package:base_flutter/presentations/modules/family_list/family_list.dart';
import 'package:base_flutter/presentations/modules/family_tree/family_tree_page.dart';
import 'package:base_flutter/presentations/modules/contact_picker/contact_picker_page.dart';
import 'package:base_flutter/presentations/modules/guard/guard_page.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_korean_data.dart';
import 'package:base_flutter/presentations/modules/ocr_id/ocr_id_page.dart';
import 'package:base_flutter/presentations/modules/policy/widgets/privacy_policy.dart';
import 'package:base_flutter/presentations/modules/policy/widgets/term_service.dart';
import 'package:base_flutter/presentations/modules/profile/profile_page.dart';
import 'package:base_flutter/presentations/modules/profile_edit/profile_edit_page.dart';
import 'package:base_flutter/presentations/modules/qr_scan/qr_scan.dart';
import 'package:base_flutter/presentations/modules/qr_scan/qr_scan_success.dart';
import 'package:base_flutter/presentations/modules/report/detail_report/detail_report.dart';
import 'package:base_flutter/presentations/modules/report/list_report/list_report.dart';
import 'package:base_flutter/presentations/modules/report/report_page.dart';
import 'package:base_flutter/presentations/modules/request_verification/request_verification.dart';
import 'package:base_flutter/presentations/modules/requester_list/requester_list_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/self_id_creater_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/self_id_creater_success.dart';
import 'package:base_flutter/presentations/modules/self_id_creater_option/self_id_creater_option_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater_option/self_id_ocr_option_page.dart';
import 'package:base_flutter/presentations/modules/self_id_list/self_id_list.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/presentations/modules/verification_cross/verification_cross.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/presentations/modules/view_image/view_image_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentations/modules/home/home_page.dart';
import '../presentations/modules/login/login_page.dart';
import '../presentations/modules/splash/splash_page.dart';
import 'app_tab_bar.dart';
import 'guards.dart';

part 'routes.dart';

final class _RouteConfig {
  static final List<RouteBase> routes = [
    GoRoute(
      path: Routes.splash.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.home.path,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.profile.path,
      builder: (context, state) => ProfilePage(cardId: state.extra as int?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.profileEdit.path,
      builder: (context, state) =>
          ProfileEditPage(card: state.extra as CardInfoItem?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdOcrOption.path,
      builder: (context, state) => SelfIdOcrOptionPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreaterOption.path,
      builder: (context, state) => SelfIdCreaterOptionPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreater.path,
      builder: (context, state) =>
          SelfIdCreaterPage(card: state.extra as KoreanIdCard?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreaterSuccess.path,
      builder: (context, state) => SelfIdCreaterSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdList.path,
      builder: (context, state) => SelfIdList(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdListChoose.path,
      builder: (context, state) => SelfIdListChoosePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.requestVerification.path,
      builder: (context, state) => RequestVerification(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.verificationCross.path,
      builder: (context, state) => VerificationCross(
        cardId: state.extra as int? ?? -1,
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.verificationFinish.path,
      builder: (context, state) => VerificationFinishPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.familyList.path,
      builder: (context, state) =>
          FamilyList(cardId: state.extra as int? ?? -1),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.familyTree.path,
      builder: (context, state) => FamilyTreePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.qrScan.path,
      builder: (context, state) => QrScanPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.qrScanSuccess.path,
      builder: (context, state) => QrScanSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.checkInOut.path,
      builder: (context, state) => CheckInOutPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankList.path,
      builder: (context, state) => BankListPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankCreate.path,
      builder: (context, state) => BankCreatePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankCreateSuccess.path,
      builder: (context, state) => BankCreateSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.terms.path,
      builder: (context, state) => Terms(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.ocrId.path,
      builder: (context, state) => OcrIdPage(type: state.extra as OcrType),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.imageView.path,
      builder: (context, state) => ViewImagePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.chat.path,
      builder: (context, state) => ChatBotPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.biography.path,
      builder: (context, state) => BiographyPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.confirmRelationship.path,
      builder: (context, state) {
        final requestId = state.extra as String? ?? '';
        return ConfirmRelationshipPage(requestId: requestId);
      },
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.contactPicker.path,
      builder: (context, state) => ContactPickerPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.reportPage.path,
      builder: (context, state) => ReportPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.detailReportPage.path,
      builder: (context, state) {
        final report = state.extra;
        assert(
          state.extra is ReportModel,
          'Routes.detailReportPage param is not ReportModel',
        );
        report as ReportModel;
        return DetailReportPage(report: report);
      },
    ),
    GoRoute(
      path: Routes.termService.path,
      builder: (context, state) => TermService(),
    ),
    GoRoute(
      path: Routes.privacyPolicy.path,
      builder: (context, state) => PrivacyPolicy(),
    ),
    GoRoute(
      path: Routes.guardPage.path,
      builder: (context, state) => GuardPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.requesterListPage.path,
      builder: (context, state) =>
          RequesterListPage(phoneNumber: state.extra as String),
    ),
    // tab bar
    // StatefulShellRoute.indexedStack(
    //   redirect: AuthGuard.guard,
    //   builder: (context, state, navigationShell) {
    //     return AppTabBar(
    //       navigationShell: navigationShell,
    //       focusKeys: [homeKey],
    //     );
    //   },
    //   branches: [
    //     StatefulShellBranch(
    //       routes: [
    //         GoRoute(
    //           path: Routes.home.path,
    //           builder: (context, state) => HomePage(key: homeKey),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: [
    //         GoRoute(
    //           path: Routes.setting.path,
    //           builder: (context, state) => const SettingPage(),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // Fade Transition
    // ShellRoute(
    //   pageBuilder: (context, state, child) =>
    //       TransitionPage.fade(state: state, child: child),
    //   routes: [],
    // ),
  ];

  static final homeKey = GlobalKey<TabFocus>();

  static final ValueNotifier<RoutingConfig> config =
      ValueNotifier(RoutingConfig(
    routes: routes,
  ));

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final GoRouter router = GoRouter.routingConfig(
    routingConfig: config,
    observers: [routeObserver],
    initialLocation: Routes.splash.path,
    navigatorKey: AppNavigator.navigatorKey,
  );

  static String of(Routes route) => route.path;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static bool isLoadedSplash = false;

  static final GoRouter router = _RouteConfig.router;

  static final RouteObserver<PageRoute> routeObserver =
      _RouteConfig.routeObserver;

  static String get initialRoute => _RouteConfig.of(Routes.splash);

  static void addRoutes(List<RouteBase> routes) {
    _RouteConfig.config.value = RoutingConfig(
      routes: _RouteConfig.routes + routes,
    );
  }

  static void replaceRoutes(List<RouteBase> routes) {
    _RouteConfig.config.value = RoutingConfig(
      routes: routes,
    );
  }

  static Future pushNamed<T extends Object>(String route,
          [T? arguments]) async =>
      context.push(route, extra: arguments);

  static void replaceNamed<T extends Object>(String route, [T? arguments]) =>
      context.replace(route, extra: arguments);

  static void goNamed<T extends Object>(String route, [T? arguments]) =>
      context.go(route, extra: arguments);

  static Future push<T extends Object>(Routes route, [T? arguments]) async =>
      pushNamed(_RouteConfig.of(route), arguments);

  static void replace<T extends Object>(Routes route, [T? arguments]) =>
      replaceNamed(_RouteConfig.of(route), arguments);

  static void go<T extends Object>(Routes route, [T? arguments]) =>
      goNamed(_RouteConfig.of(route), arguments);

  static void pop<T extends Object>([T? result]) => context.pop(result);

  static void popUntil(bool Function(Route<dynamic>) predicate) =>
      Navigator.of(context).popUntil(predicate);

  static void popToHead() => popUntil((route) {
        return route.isFirst;
        //route.settings.name == null;
      });

  static BuildContext get context {
    if (navigatorKey.currentContext == null) {
      throw Exception('Navigator is not initialized');
    }

    return navigatorKey.currentContext!;
  }
}

class TransitionPage {
  static CustomTransitionPage<T> fade<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static CustomTransitionPage<T> slide<T>({
    required GoRouterState state,
    required Widget child,
    Offset begin = const Offset(1, 0),
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: begin, end: Offset.zero).animate(animation),
          child: child,
        );
      },
    );
  }
}
