import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_request/cubit/mutual_auth_request_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRelationRepo extends Mock implements RelationRepo {}

void main() {
  late _MockRelationRepo repo;

  setUp(() {
    repo = _MockRelationRepo();
  });

  group('onPhoneChanged', () {
    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'updates phoneInput and clears error',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      seed: () => MutualAuthRequestState(errorMessage: 'old'),
      act: (c) => c.onPhoneChanged('010-1234-5678'),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.phoneInput, 'phoneInput', '010-1234-5678')
            .having((s) => s.errorMessage, 'errorMessage', ''),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'no-op when value is unchanged',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      seed: () => MutualAuthRequestState(phoneInput: '01000000000'),
      act: (c) => c.onPhoneChanged('01000000000'),
      expect: () => [],
    );
  });

  group('search', () {
    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'empty input → error message, no remote call',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      act: (c) => c.search(),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.errorMessage, 'errorMessage',
                contains('전화번호')),
      ],
      verify: (_) =>
          verifyNever(() => repo.getListRequester(phoneNumber: any(named: 'phoneNumber'))),
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'no match → loading then error',
      build: () {
        when(() => repo.getListRequester(phoneNumber: any(named: 'phoneNumber')))
            .thenAnswer((_) async => const []);
        return MutualAuthRequestCubit(relationRepo: repo);
      },
      seed: () => MutualAuthRequestState(phoneInput: '01000000000'),
      act: (c) => c.search(),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.errorMessage, 'errorMessage', ''),
        isA<MutualAuthRequestState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage',
                contains('찾지 못했습니다')),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'success → moves to confirm with target populated',
      build: () {
        when(() => repo.getListRequester(phoneNumber: any(named: 'phoneNumber')))
            .thenAnswer((_) async => const [
                  RelationUserModel(
                    id: 1,
                    certRelatedId: 99,
                    certRelatedName: 'Bob',
                    certRelatedPhone: '01000000000',
                  ),
                ]);
        return MutualAuthRequestCubit(relationRepo: repo);
      },
      seed: () => MutualAuthRequestState(phoneInput: '01000000000'),
      act: (c) => c.search(),
      expect: () => [
        isA<MutualAuthRequestState>().having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthRequestState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.stage, 'stage',
                MutualAuthRequestStage.confirm)
            .having((s) => s.target?.certRelatedName, 'target.name', 'Bob'),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'remote throws → error message',
      build: () {
        when(() => repo.getListRequester(phoneNumber: any(named: 'phoneNumber')))
            .thenThrow(Exception('network'));
        return MutualAuthRequestCubit(relationRepo: repo);
      },
      seed: () => MutualAuthRequestState(phoneInput: '01000000000'),
      act: (c) => c.search(),
      expect: () => [
        isA<MutualAuthRequestState>().having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthRequestState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', contains('network')),
      ],
    );
  });

  group('sendRequest', () {
    const target = RelationUserModel(certRelatedId: 99, certOwnerId: 7);

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'no-op when target is null',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      act: (c) => c.sendRequest(gender: GenderE.male, certOwnerId: 1),
      expect: () => [],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'success → sending then awaiting',
      build: () {
        when(() => repo.createRelation(
              gender: any(named: 'gender'),
              certOwnerId: any(named: 'certOwnerId'),
              certRelatedId: any(named: 'certRelatedId'),
              parentId: any(named: 'parentId'),
              spouseId: any(named: 'spouseId'),
            )).thenAnswer((_) async => target);
        return MutualAuthRequestCubit(relationRepo: repo);
      },
      seed: () => MutualAuthRequestState(
        target: target,
        stage: MutualAuthRequestStage.confirm,
      ),
      act: (c) => c.sendRequest(gender: GenderE.male, certOwnerId: 7),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage', MutualAuthRequestStage.sending)
            .having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage', MutualAuthRequestStage.awaiting)
            .having((s) => s.isLoading, 'isLoading', false),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'failure → back to confirm with errorMessage',
      build: () {
        when(() => repo.createRelation(
              gender: any(named: 'gender'),
              certOwnerId: any(named: 'certOwnerId'),
              certRelatedId: any(named: 'certRelatedId'),
              parentId: any(named: 'parentId'),
              spouseId: any(named: 'spouseId'),
            )).thenThrow(Exception('boom'));
        return MutualAuthRequestCubit(relationRepo: repo);
      },
      seed: () => MutualAuthRequestState(
        target: target,
        stage: MutualAuthRequestStage.confirm,
      ),
      act: (c) => c.sendRequest(gender: GenderE.male, certOwnerId: 7),
      expect: () => [
        isA<MutualAuthRequestState>().having((s) => s.stage, 'stage',
            MutualAuthRequestStage.sending),
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage', MutualAuthRequestStage.confirm)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });

  group('onCounterpartyResponded / finish / reset', () {
    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'approved → responded with wasApproved=true',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      seed: () => MutualAuthRequestState(stage: MutualAuthRequestStage.awaiting),
      act: (c) => c.onCounterpartyResponded(approved: true),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage',
                MutualAuthRequestStage.responded)
            .having((s) => s.wasApproved, 'wasApproved', true),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'finish → done',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      seed: () => MutualAuthRequestState(stage: MutualAuthRequestStage.responded),
      act: (c) => c.finish(),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage', MutualAuthRequestStage.done),
      ],
    );

    blocTest<MutualAuthRequestCubit, MutualAuthRequestState>(
      'reset → fresh state but keeps phoneInput',
      build: () => MutualAuthRequestCubit(relationRepo: repo),
      seed: () => MutualAuthRequestState(
        phoneInput: '01099999999',
        stage: MutualAuthRequestStage.confirm,
      ),
      act: (c) => c.reset(),
      expect: () => [
        isA<MutualAuthRequestState>()
            .having((s) => s.stage, 'stage', MutualAuthRequestStage.search)
            .having((s) => s.phoneInput, 'phoneInput', '01099999999')
            .having((s) => s.target, 'target', isNull),
      ],
    );
  });
}
