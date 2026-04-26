import 'package:base_flutter/data/models/report/report_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/ai_chat_v2/ai_chat_v2_page.dart';
import 'package:base_flutter/presentations/modules/bank_create/bank_create_page.dart';
import 'package:base_flutter/presentations/modules/bank_create/bank_create_success.dart';
import 'package:base_flutter/presentations/modules/bank_list/bank_list_page.dart';
import 'package:base_flutter/presentations/modules/bank_list/terms.dart';
import 'package:base_flutter/presentations/modules/biography/biography_page.dart';
import 'package:base_flutter/presentations/modules/chat_bot/chat_bot_page.dart';
import 'package:base_flutter/presentations/modules/chat_bot/cubit/chat_bot_cubit.dart';
import 'package:base_flutter/presentations/modules/check_in_out/check_in_out_page.dart';
import 'package:base_flutter/presentations/modules/confirm_relationship/confirm_relationship_page.dart';
import 'package:base_flutter/presentations/modules/contact_picker/contact_picker_page.dart';
import 'package:base_flutter/presentations/modules/family_list/family_list.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/cubit/family_tree_cubit.dart';
import 'package:base_flutter/presentations/modules/family_tree_v2/family_tree_v2_page.dart';
import 'package:base_flutter/presentations/modules/guard/guard_page.dart';
import 'package:base_flutter/presentations/modules/home/home_page_v2.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/id_generation_v2_page.dart';
import 'package:base_flutter/presentations/modules/inproc_contact_v2/cubit/inproc_contact_cubit.dart';
import 'package:base_flutter/presentations/modules/inproc_contact_v2/inproc_contact_page.dart';
import 'package:base_flutter/presentations/modules/login/login_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/cubit/mutual_auth_offline_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/mutual_auth_offline_display_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/mutual_auth_offline_entry_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/mutual_auth_offline_scan_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/cubit/mutual_auth_receive_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/mutual_auth_receive_page.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/mutual_auth_request_page.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_korean_data.dart';
import 'package:base_flutter/presentations/modules/ocr_id/ocr_id_page.dart';
import 'package:base_flutter/presentations/modules/policy/widgets/privacy_policy.dart';
import 'package:base_flutter/presentations/modules/policy/widgets/term_service.dart';
import 'package:base_flutter/presentations/modules/profile/profile_page.dart';
import 'package:base_flutter/presentations/modules/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:base_flutter/presentations/modules/profile_edit/profile_edit_page.dart';
import 'package:base_flutter/presentations/modules/profile_edit_v2/profile_edit_v2_page.dart';
import 'package:base_flutter/presentations/modules/qr_scan/qr_scan.dart';
import 'package:base_flutter/presentations/modules/qr_scan/qr_scan_success.dart';
import 'package:base_flutter/presentations/modules/report/detail_report/detail_report.dart';
import 'package:base_flutter/presentations/modules/report/report_page.dart';
import 'package:base_flutter/presentations/modules/report_v2/cubit/report_v2_cubit.dart';
import 'package:base_flutter/presentations/modules/report_v2/report_v2_page.dart';
import 'package:base_flutter/presentations/modules/request_verification/request_verification.dart';
import 'package:base_flutter/presentations/modules/requester_list/requester_list_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/self_id_creater_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/self_id_creater_success.dart';
import 'package:base_flutter/presentations/modules/self_id_creater_option/self_id_creater_option_page.dart';
import 'package:base_flutter/presentations/modules/self_id_creater_option/self_id_ocr_option_page.dart';
import 'package:base_flutter/presentations/modules/self_id_list/self_id_list.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/presentations/modules/splash/splash_page.dart';
import 'package:base_flutter/presentations/modules/tutorial/tutorial_page.dart';
import 'package:base_flutter/presentations/modules/verification_cross/verification_cross.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/presentations/modules/view_image/view_image_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_tab_bar.dart';
import 'guards.dart';

part 'routes.dart';

final class _RouteConfig {
  static final List<RouteBase> routes = [
    GoRoute(path: Routes.splash.path, builder: (c, s) => const SplashPage()),
    GoRoute(path: Routes.tutorial.path, builder: (c, s) => const TutorialPage()),
    GoRoute(path: Routes.login.path, builder: (c, s) => const LoginPage()),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.home.path,
      builder: (c, s) => const HomePageV2(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.profile.path,
      builder: (c, s) => ProfilePage(cardId: s.extra as int?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.profileEdit.path,
      builder: (c, s) => ProfileEditPage(card: s.extra as CardInfoItem?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdOcrOption.path,
      builder: (c, s) => SelfIdOcrOptionPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreaterOption.path,
      builder: (c, s) => SelfIdCreaterOptionPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreater.path,
      builder: (c, s) => SelfIdCreaterPage(card: s.extra as KoreanIdCard?),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdCreaterSuccess.path,
      builder: (c, s) => SelfIdCreaterSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdList.path,
      builder: (c, s) => SelfIdList(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.selfIdListChoose.path,
      builder: (c, s) => SelfIdListChoosePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.requestVerification.path,
      builder: (c, s) => RequestVerification(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.verificationCross.path,
      builder: (c, s) => VerificationCross(cardId: s.extra as int? ?? -1),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.verificationFinish.path,
      builder: (c, s) => VerificationFinishPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.familyList.path,
      builder: (c, s) => FamilyList(cardId: s.extra as int? ?? -1),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.familyTree.path,
      builder: (c, s) => FamilyTreeV2Page(
        cubit: FamilyTreeCubit(relationRepo: Injector.getIt<RelationRepo>())
          ..load(phoneNumber: s.extra as String?),
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.qrScan.path,
      builder: (c, s) => QrScanPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.qrScanSuccess.path,
      builder: (c, s) => QrScanSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.checkInOut.path,
      builder: (c, s) => CheckInOutPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankList.path,
      builder: (c, s) => BankListPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankCreate.path,
      builder: (c, s) => BankCreatePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.bankCreateSuccess.path,
      builder: (c, s) => BankCreateSuccess(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.terms.path,
      builder: (c, s) => Terms(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.ocrId.path,
      builder: (c, s) => OcrIdPage(type: s.extra as OcrType),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.imageView.path,
      builder: (c, s) => ViewImagePage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.chat.path,
      builder: (c, s) => ChatBotPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.biography.path,
      builder: (c, s) => BiographyPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.confirmRelationship.path,
      builder: (c, s) =>
          ConfirmRelationshipPage(requestId: s.extra as String? ?? ''),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.contactPicker.path,
      builder: (c, s) => ContactPickerPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.reportPage.path,
      builder: (c, s) => ReportPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.detailReportPage.path,
      builder: (c, s) {
        final r = s.extra;
        assert(r is ReportModel);
        return DetailReportPage(report: r as ReportModel);
      },
    ),
    GoRoute(
      path: Routes.termService.path,
      builder: (c, s) => TermService(),
    ),
    GoRoute(
      path: Routes.privacyPolicy.path,
      builder: (c, s) => PrivacyPolicy(),
    ),
    GoRoute(
      path: Routes.guardPage.path,
      builder: (c, s) => GuardPage(),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.requesterListPage.path,
      builder: (c, s) =>
          RequesterListPage(phoneNumber: s.extra as String),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.mutualAuthRequest.path,
      builder: (c, s) => MutualAuthRequestPage(
        cubit: MutualAuthRequestCubit(
          relationRepo: Injector.getIt<RelationRepo>(),
        ),
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.mutualAuthReceive.path,
      builder: (c, s) {
        final phone = s.extra as String? ?? '';
        final cubit = MutualAuthReceiveCubit(
          relationRepo: Injector.getIt<RelationRepo>(),
          verifyRepo: Injector.getIt<VerifyRepo>(),
        );
        if (phone.isNotEmpty) cubit.load(phone);
        return MutualAuthReceivePage(cubit: cubit);
      },
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.mutualAuthOffline.path,
      builder: (c, s) => MutualAuthOfflineEntryPage(
        onShowMyQr: () =>
            c.push(Routes.mutualAuthOfflineDisplay.path, extra: s.extra),
        onScanQr: () => c.push(Routes.mutualAuthOfflineScan.path),
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.mutualAuthOfflineDisplay.path,
      builder: (c, s) => MutualAuthOfflineDisplayPage(
        cubit: MutualAuthOfflineCubit(
          verifyRepo: Injector.getIt<VerifyRepo>(),
        ),
        card: s.extra as CardInfoItem? ?? const CardInfoItem(),
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.mutualAuthOfflineScan.path,
      builder: (c, s) => MutualAuthOfflineScanPage(
        cubit: MutualAuthOfflineCubit(
          verifyRepo: Injector.getIt<VerifyRepo>(),
        ),
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.inProcContact.path,
      builder: (c, s) =>
          InProcContactPage(cubit: InProcContactCubit()),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.profileEditV2.path,
      builder: (c, s) => ProfileEditV2Page(
        cubit: ProfileEditCubit(),
        card: s.extra as CardInfoItem?,
      ),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.reportV2.path,
      builder: (c, s) {
        final cubit = ReportV2Cubit(
          reportRepo: Injector.getIt<ReportRepo>(),
        );
        cubit.loadReports();
        return ReportV2Page(cubit: cubit);
      },
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.aiChatV2.path,
      builder: (c, s) => AiChatV2Page(cubit: ChatBotCubit()),
    ),
    GoRoute(
      redirect: AuthGuard.guard,
      path: Routes.idGenerationV2.path,
      builder: (c, s) => IdGenerationV2Page(
        cubit: IdGenerationCubit(
          selfIdRepo: Injector.getIt<SelfIdRepo>(),
          ocrRepo: Injector.getIt<OcrRepo>(),
        ),
      ),
    ),
  ];

  static final homeKey = GlobalKey<TabFocus>();
  static final ValueNotifier<RoutingConfig> config =
      ValueNotifier(RoutingConfig(routes: routes));
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
    _RouteConfig.config.value =
        RoutingConfig(routes: _RouteConfig.routes + routes);
  }

  static void replaceRoutes(List<RouteBase> routes) {
    _RouteConfig.config.value = RoutingConfig(routes: routes);
  }

  static Future pushNamed<T extends Object>(String route, [T? arguments]) async =>
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

  static void popToHead() => popUntil((route) => route.isFirst);

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
      transitionsBuilder: (c, a, sa, ch) =>
          FadeTransition(opacity: a, child: ch),
    );
  }
}
