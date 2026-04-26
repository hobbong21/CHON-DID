import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_receive/cubit/mutual_auth_receive_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

class _MockVerifyRepo extends Mock implements VerifyRepo {}

void main() {
  late _MockRelationRepo relationRepo;
  late _MockVerifyRepo verifyRepo;

  setUp(() {
    relationRepo = _MockRelationRepo();
    verifyRepo = _MockVerifyRepo();
  });

  MutualAuthReceiveCubit make() => MutualAuthReceiveCubit(
        relationRepo: relationRepo,
        verifyRepo: verifyRepo,
      );

  group('load', () {
    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'success → only unVerified rows are kept',
      build: () {
        when(() => relationRepo.getListRequester(
              phoneNumber: any(named: 'phoneNumber'),
            )).thenAnswer((_) async => const [
          RelationUserModel(id: 1, status: StatusRelationE.unVerified),
          RelationUserModel(id: 2, status: StatusRelationE.agree),
          RelationUserModel(id: 3, status: StatusRelationE.unVerified),
        ]);
        return make();
      },
      act: (c) => c.load('01000000000'),
      expect: () => [
        isA<MutualAuthReceiveState>()
            .having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthReceiveState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.requests.length, 'requests.length', 2)
            .having((s) => s.requests.map((r) => r.id).toList(),
                'requests.ids', [1, 3]),
      ],
    );

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'failure → error message',
      build: () {
        when(() => relationRepo.getListRequester(
              phoneNumber: any(named: 'phoneNumber'),
            )).thenThrow(Exception('boom'));
        return make();
      },
      act: (c) => c.load('01000000000'),
      expect: () => [
        isA<MutualAuthReceiveState>()
            .having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthReceiveState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });

  group('approve', () {
    const target = RelationUserModel(id: 1, certRelatedId: 99);

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'success → approved stage, request removed from list',
      build: () {
        when(() => verifyRepo.confirmVerify(
              verifyType: any(named: 'verifyType'),
              refVerifyId: any(named: 'refVerifyId'),
            )).thenAnswer((_) async {});
        return make();
      },
      seed: () => MutualAuthReceiveState(
        selected: target,
        requests: const [target, RelationUserModel(id: 2, certRelatedId: 88)],
      ),
      act: (c) => c.approve(),
      expect: () => [
        isA<MutualAuthReceiveState>()
            .having((s) => s.stage, 'stage',
                MutualAuthReceiveStage.approving)
            .having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthReceiveState>()
            .having((s) => s.stage, 'stage',
                MutualAuthReceiveStage.approved)
            .having((s) => s.requests.length, 'requests', 1)
            .having((s) => s.requests.first.id, 'remaining.id', 2),
      ],
      verify: (_) {
        verify(() => verifyRepo.confirmVerify(
              verifyType: any(named: 'verifyType'),
              refVerifyId: 99,
            )).called(1);
      },
    );

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'no-op when nothing is selected',
      build: () => make(),
      act: (c) => c.approve(),
      expect: () => [],
    );

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'failure → returns to idle with errorMessage',
      build: () {
        when(() => verifyRepo.confirmVerify(
              verifyType: any(named: 'verifyType'),
              refVerifyId: any(named: 'refVerifyId'),
            )).thenThrow(Exception('network'));
        return make();
      },
      seed: () => MutualAuthReceiveState(selected: target),
      act: (c) => c.approve(),
      expect: () => [
        isA<MutualAuthReceiveState>().having((s) => s.stage, 'stage',
            MutualAuthReceiveStage.approving),
        isA<MutualAuthReceiveState>()
            .having((s) => s.stage, 'stage', MutualAuthReceiveStage.idle)
            .having(
                (s) => s.errorMessage, 'errorMessage', contains('network')),
      ],
    );
  });

  group('reject', () {
    const target = RelationUserModel(id: 1, certRelatedId: 77);

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'success → rejected stage, request removed from list',
      build: () {
        when(() => verifyRepo.rejectVerify(
              verifyType: any(named: 'verifyType'),
              refVerifyId: any(named: 'refVerifyId'),
            )).thenAnswer((_) async {});
        return make();
      },
      seed: () => MutualAuthReceiveState(
        selected: target,
        requests: const [target],
      ),
      act: (c) => c.reject(),
      expect: () => [
        isA<MutualAuthReceiveState>().having((s) => s.stage, 'stage',
            MutualAuthReceiveStage.rejecting),
        isA<MutualAuthReceiveState>()
            .having((s) => s.stage, 'stage',
                MutualAuthReceiveStage.rejected)
            .having((s) => s.requests, 'requests', isEmpty),
      ],
      verify: (_) {
        verify(() => verifyRepo.rejectVerify(
              verifyType: any(named: 'verifyType'),
              refVerifyId: 77,
            )).called(1);
      },
    );
  });

  group('select / dismiss', () {
    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'selectRequest sets selected and resets stage',
      build: () => make(),
      seed: () => MutualAuthReceiveState(stage: MutualAuthReceiveStage.approved),
      act: (c) => c.selectRequest(const RelationUserModel(id: 1)),
      expect: () => [
        isA<MutualAuthReceiveState>()
            .having((s) => s.selected?.id, 'selected.id', 1)
            .having((s) => s.stage, 'stage', MutualAuthReceiveStage.idle),
      ],
    );

    blocTest<MutualAuthReceiveCubit, MutualAuthReceiveState>(
      'dismiss clears selected, stage, error',
      build: () => make(),
      seed: () => MutualAuthReceiveState(
        selected: const RelationUserModel(id: 1),
        stage: MutualAuthReceiveStage.approved,
        errorMessage: 'old',
      ),
      act: (c) => c.dismiss(),
      expect: () => [
        isA<MutualAuthReceiveState>()
            .having((s) => s.selected, 'selected', isNull)
            .having((s) => s.stage, 'stage', MutualAuthReceiveStage.idle)
            .having((s) => s.errorMessage, 'errorMessage', ''),
      ],
    );
  });
}
