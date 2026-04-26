import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/auth/login_model.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/home/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _MockRelationRepo extends Mock implements RelationRepo {}

class _FakeAppCubit extends Cubit<AppState> implements AppCubit {
  _FakeAppCubit(super.initialState);

  @override
  bool needRefreshHome = false;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeListCardInfoRequest extends Fake implements ListCardInfoRequest {}

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
    appCubit = _FakeAppCubit(AppState());

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

  group('HomeCubit.loadData', () {
    blocTest<HomeCubit, HomeState>(
      'with no token, emits empty list and skips remote calls',
      build: () => HomeCubit(),
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<HomeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.listCards, 'listCards', isEmpty),
      ],
      verify: (_) {
        verifyNever(() => selfIdRepo.getListCardInfo(body: any(named: 'body')));
        verifyNever(
            () => relationRepo.getRelationList(phoneNumber: any(named: 'phoneNumber')));
      },
    );

    blocTest<HomeCubit, HomeState>(
      'with a token but empty card list, emits loading then empty success',
      build: () {
        appCubit.emit(AppState(
          loginModel: const LoginModel(accessToken: 'token'),
        ));
        when(() => selfIdRepo.getListCardInfo(body: any(named: 'body')))
            .thenAnswer((_) async => const ListCardInfoData(list: [], count: 0));
        return HomeCubit();
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<HomeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<HomeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.listCards, 'listCards', isEmpty),
      ],
      verify: (_) {
        verifyNever(() =>
            relationRepo.getRelationList(phoneNumber: any(named: 'phoneNumber')));
      },
    );

    blocTest<HomeCubit, HomeState>(
      'with cards that have a phone, also fetches relations',
      build: () {
        appCubit.emit(AppState(
          loginModel: const LoginModel(accessToken: 'token'),
        ));
        const card = CardInfoItem(id: 1, name: 'Alice', phoneNumber: '01000000000');
        when(() => selfIdRepo.getListCardInfo(body: any(named: 'body')))
            .thenAnswer((_) async => const ListCardInfoData(list: [card], count: 1));
        when(() => relationRepo.getRelationList(
              phoneNumber: any(named: 'phoneNumber'),
            )).thenAnswer((_) async => const [
              RelationUserModel(certOwnerId: 1, status: StatusRelationE.unVerified),
              RelationUserModel(certOwnerId: 2, status: StatusRelationE.agree),
            ]);
        return HomeCubit();
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<HomeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<HomeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.listCards.length, 'listCards.length', 1),
        // getRelationList kicks off a second loading cycle.
        isA<HomeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<HomeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.requesterList.length, 'requesterList.length', 1)
            .having(
              (s) => s.requesterList.first.status,
              'requesterList.first.status',
              StatusRelationE.unVerified,
            ),
      ],
      verify: (_) {
        verify(() => relationRepo.getRelationList(phoneNumber: '01000000000'))
            .called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'when getListCardInfo throws, emits error state with empty list',
      build: () {
        appCubit.emit(AppState(
          loginModel: const LoginModel(accessToken: 'token'),
        ));
        when(() => selfIdRepo.getListCardInfo(body: any(named: 'body')))
            .thenThrow(Exception('boom'));
        return HomeCubit();
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<HomeState>().having((s) => s.isLoading, 'isLoading', true),
        isA<HomeState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.listCards, 'listCards', isEmpty)
            .having((s) => s.messageError, 'messageError', contains('boom')),
      ],
    );
  });

  group('HomeCubit.changeIdIndex', () {
    test('updates idIndex synchronously without emitting', () {
      final cubit = HomeCubit();
      expect(cubit.idIndex, 0);
      cubit.changeIdIndex(3);
      expect(cubit.idIndex, 3);
    });
  });
}
