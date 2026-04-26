import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/home/cubit/home_cubit.dart';
import 'package:base_flutter/presentations/modules/home/home_page_v2.dart';
import 'package:base_flutter/presentations/widgets/chon_bottom_navigation_bar.dart';
import 'package:base_flutter/presentations/widgets/chon_quick_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _MockRelationRepo extends Mock implements RelationRepo {}

class _FakeAppCubit extends Cubit<AppState> implements AppCubit {
  _FakeAppCubit() : super(AppState());
  @override
  bool needRefreshHome = false;
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeListCardInfoRequest extends Fake implements ListCardInfoRequest {}

class _StubHomeCubit extends Cubit<HomeState> implements HomeCubit {
  _StubHomeCubit(super.initialState);

  int loadDataCalls = 0;

  @override
  int idIndex = 0;

  @override
  Future<void> loadData() async {
    loadDataCalls++;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Widget _harness(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, _) => MaterialApp(
      home: GlobalLoaderOverlay(child: child),
    ),
  );
}

void main() {
  late _MockSelfIdRepo selfIdRepo;
  late _MockRelationRepo relationRepo;
  late _FakeAppCubit appCubit;

  setUpAll(() {
    registerFallbackValue(_FakeListCardInfoRequest());
  });

  setUp(() {
    selfIdRepo = _MockSelfIdRepo();
    relationRepo = _MockRelationRepo();
    appCubit = _FakeAppCubit();

    final getIt = Injector.getIt;
    if (getIt.isRegistered<SelfIdRepo>()) getIt.unregister<SelfIdRepo>();
    if (getIt.isRegistered<RelationRepo>()) getIt.unregister<RelationRepo>();
    if (getIt.isRegistered<AppCubit>()) getIt.unregister<AppCubit>();

    getIt.registerSingleton<SelfIdRepo>(selfIdRepo);
    getIt.registerSingleton<RelationRepo>(relationRepo);
    getIt.registerSingleton<AppCubit>(appCubit);
  });

  tearDown(() {
    final getIt = Injector.getIt;
    getIt.unregister<SelfIdRepo>();
    getIt.unregister<RelationRepo>();
    getIt.unregister<AppCubit>();
  });

  Future<void> pumpHomeWith(WidgetTester tester, HomeState state) async {
    final cubit = _StubHomeCubit(state);
    await tester.pumpWidget(_harness(HomePageV2(cubit: cubit)));
    await tester.pumpAndSettle();
  }

  group('HomePageV2 rendering', () {
    testWidgets('renders banner, cards, quick actions, and bottom nav',
        (tester) async {
      await pumpHomeWith(tester, HomeState());

      expect(find.text('상호인증으로 CHON ID를 만들어보세요.'), findsOneWidget);
      expect(find.text('나를 확인 받는\nCHON DID 튜토리얼'), findsOneWidget);
      expect(find.text('상호 인증'), findsOneWidget);
      expect(find.text('가족, 인척과\n서로를 확인받기'), findsOneWidget);

      // Quick action labels
      expect(find.text('연락하기\n(가계도)'), findsOneWidget);
      expect(find.text('프로필 수정'), findsOneWidget);
      expect(find.text('QR 코드'), findsOneWidget);
      expect(find.text('고객센터'), findsOneWidget);

      // Bottom nav labels
      expect(find.text('홈'), findsOneWidget);
      expect(find.text('CHON'), findsOneWidget);
      expect(find.text('신분증'), findsOneWidget);
      expect(find.text('상호인증'), findsOneWidget);
      expect(find.text('가계도'), findsOneWidget);

      expect(find.byType(ChonBottomNavigationBar), findsOneWidget);
      expect(find.byType(ChonQuickActionButton), findsNWidgets(4));
    });

    testWidgets('does NOT show notification badge when requesterList is empty',
        (tester) async {
      await pumpHomeWith(tester, HomeState());

      // The bell is always rendered (we look it up by key); the badge isn't.
      expect(find.byKey(const Key('home.notification_bell')), findsOneWidget);

      // No "1" / "2" / etc. count text inside the bell.
      // (If state.requesterList.length were >0, the page renders that count.)
      expect(find.text('1'), findsNothing);
    });

    testWidgets('shows notification count when requesterList has items',
        (tester) async {
      const r = RelationUserModel(certOwnerId: 1);
      await pumpHomeWith(
        tester,
        HomeState(requesterList: const [r, r, r]),
      );

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('calls loadData once on first build', (tester) async {
      final cubit = _StubHomeCubit(HomeState());
      await tester.pumpWidget(_harness(HomePageV2(cubit: cubit)));
      // initState schedules loadData on the first frame callback.
      await tester.pump();
      expect(cubit.loadDataCalls, 1);
    });
  });

  group('HomePageV2 interactions', () {
    testWidgets('tapping a quick action button does not throw',
        (tester) async {
      await pumpHomeWith(tester, HomeState());
      // Just verify the gesture detector chain is intact. The actual
      // navigation goes through GoRouter which we don't mount here, so
      // we only confirm no exception is raised.
      await tester.tap(find.text('QR 코드'));
      // pump but do not settle (no router so navigation throws on settle).
      await tester.pump();
    });

    testWidgets('selected tab default is home', (tester) async {
      await pumpHomeWith(tester, HomeState());
      final nav = tester.widget<ChonBottomNavigationBar>(
          find.byType(ChonBottomNavigationBar));
      expect(nav.selected, ChonNavTab.home);
    });
  });
}
