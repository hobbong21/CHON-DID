import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _FakeCreateCardRequest extends Fake implements CreateCardRequest {}

void main() {
  late _MockSelfIdRepo repo;

  setUpAll(() {
    registerFallbackValue(_FakeCreateCardRequest());
  });

  setUp(() {
    repo = _MockSelfIdRepo();
  });

  IdGenerationCubit make() => IdGenerationCubit(selfIdRepo: repo);

  group('navigation', () {
    blocTest<IdGenerationCubit, IdGenerationState>(
      'next moves through linear stages in order',
      build: () => make(),
      act: (c) {
        c.next(); // start → personalInfo
        c.next(); // personalInfo → verificationOk
      },
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.personalInfo),
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.verificationOk),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'verificationFailed prevents advancing past verificationOk',
      build: () => make(),
      seed: () => IdGenerationState(
        stage: IdGenStage.verificationOk,
        verificationFailed: true,
      ),
      act: (c) => c.next(),
      expect: () => [],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'back moves to previous stage',
      build: () => make(),
      seed: () => IdGenerationState(stage: IdGenStage.review),
      act: (c) => c.back(),
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.ocrConfirm),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'goTo jumps to a specific stage',
      build: () => make(),
      act: (c) => c.goTo(IdGenStage.review),
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.review),
      ],
    );
  });

  group('phase mutations', () {
    blocTest<IdGenerationCubit, IdGenerationState>(
      'onPersonalInfoChanged keeps unchanged fields',
      build: () => make(),
      seed: () => IdGenerationState(
        fullName: 'Alice',
        idNumber: '123',
      ),
      act: (c) => c.onPersonalInfoChanged(address: 'Seoul'),
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.fullName, 'fullName', 'Alice')
            .having((s) => s.idNumber, 'idNumber', '123')
            .having((s) => s.address, 'address', 'Seoul'),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'markVerification ok=false flags failure',
      build: () => make(),
      act: (c) => c.markVerification(ok: false),
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.verificationOk)
            .having((s) => s.verificationFailed, 'verificationFailed', true),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'setFrontImage / setBackImage populate base64',
      build: () => make(),
      act: (c) {
        c.setFrontImage('front-data');
        c.setBackImage('back-data');
      },
      expect: () => [
        isA<IdGenerationState>()
            .having((s) => s.frontImageBase64, 'front', 'front-data'),
        isA<IdGenerationState>()
            .having((s) => s.backImageBase64, 'back', 'back-data'),
      ],
    );
  });

  group('submit', () {
    blocTest<IdGenerationCubit, IdGenerationState>(
      'rejects when required fields are missing',
      build: () => make(),
      act: (c) => c.submit(),
      expect: () => [
        isA<IdGenerationState>().having(
            (s) => s.errorMessage, 'errorMessage', contains('필수')),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'success → moves to done',
      build: () {
        when(() => repo.createCard(body: any(named: 'body')))
            .thenAnswer((_) async => const CreateCardData());
        return make();
      },
      seed: () => IdGenerationState(
        stage: IdGenStage.review,
        fullName: '홍길동',
        idNumber: '900101-1234567',
      ),
      act: (c) => c.submit(),
      expect: () => [
        isA<IdGenerationState>().having((s) => s.isLoading, 'loading', true),
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.done)
            .having((s) => s.isLoading, 'loading', false),
      ],
    );

    blocTest<IdGenerationCubit, IdGenerationState>(
      'failure → keeps stage with errorMessage',
      build: () {
        when(() => repo.createCard(body: any(named: 'body')))
            .thenThrow(Exception('boom'));
        return make();
      },
      seed: () => IdGenerationState(
        stage: IdGenStage.review,
        fullName: '홍길동',
        idNumber: '900101-1234567',
      ),
      act: (c) => c.submit(),
      expect: () => [
        isA<IdGenerationState>().having((s) => s.isLoading, 'loading', true),
        isA<IdGenerationState>()
            .having((s) => s.stage, 'stage', IdGenStage.review)
            .having((s) => s.isLoading, 'loading', false)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });
}
