import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/presentations/modules/mutual_auth_offline/cubit/mutual_auth_offline_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockVerifyRepo extends Mock implements VerifyRepo {}

void main() {
  late _MockVerifyRepo verifyRepo;

  setUp(() {
    verifyRepo = _MockVerifyRepo();
  });

  MutualAuthOfflineCubit make() =>
      MutualAuthOfflineCubit(verifyRepo: verifyRepo);

  group('startDisplay', () {
    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'card with qrCode → displaying with that payload',
      build: () => make(),
      act: (c) => c.startDisplay(const CardInfoItem(qrCode: 'abc')),
      expect: () => [
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage',
                MutualAuthOfflineStage.displaying)
            .having((s) => s.displayQr, 'displayQr', 'abc'),
      ],
    );

    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'card with did but no qrCode → falls back to did',
      build: () => make(),
      act: (c) => c.startDisplay(const CardInfoItem(did: 'did:example:1')),
      expect: () => [
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage',
                MutualAuthOfflineStage.displaying)
            .having((s) => s.displayQr, 'displayQr', 'did:example:1'),
      ],
    );

    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'card with neither qrCode nor did → idle with errorMessage',
      build: () => make(),
      act: (c) => c.startDisplay(const CardInfoItem(name: 'no payload')),
      expect: () => [
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage', MutualAuthOfflineStage.idle)
            .having((s) => s.errorMessage, 'errorMessage', contains('QR')),
      ],
    );
  });

  group('scan flow', () {
    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'startScan moves to scanning state',
      build: () => make(),
      act: (c) => c.startScan(),
      expect: () => [
        isA<MutualAuthOfflineState>().having((s) => s.stage, 'stage',
            MutualAuthOfflineStage.scanning),
      ],
    );

    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'onScanned with empty token is a no-op',
      build: () => make(),
      seed: () => MutualAuthOfflineState(
          stage: MutualAuthOfflineStage.scanning),
      act: (c) => c.onScanned(''),
      expect: () => [],
    );

    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'success → verifying then result with scannedCard',
      build: () {
        when(() => verifyRepo.verifyDid(token: any(named: 'token')))
            .thenAnswer((_) async => const CardInfoItem(name: 'Bob'));
        return make();
      },
      seed: () => MutualAuthOfflineState(
          stage: MutualAuthOfflineStage.scanning),
      act: (c) => c.onScanned('token-123'),
      expect: () => [
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage',
                MutualAuthOfflineStage.verifying)
            .having((s) => s.isLoading, 'isLoading', true),
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage', MutualAuthOfflineStage.result)
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.scannedCard?.name, 'scannedCard.name', 'Bob'),
      ],
      verify: (_) {
        verify(() => verifyRepo.verifyDid(token: 'token-123')).called(1);
      },
    );

    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'failure → back to scanning with errorMessage so user can retry',
      build: () {
        when(() => verifyRepo.verifyDid(token: any(named: 'token')))
            .thenThrow(Exception('boom'));
        return make();
      },
      seed: () => MutualAuthOfflineState(
          stage: MutualAuthOfflineStage.scanning),
      act: (c) => c.onScanned('token-123'),
      expect: () => [
        isA<MutualAuthOfflineState>().having((s) => s.stage, 'stage',
            MutualAuthOfflineStage.verifying),
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage',
                MutualAuthOfflineStage.scanning)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });

  group('reset', () {
    blocTest<MutualAuthOfflineCubit, MutualAuthOfflineState>(
      'returns to a fresh idle state',
      build: () => make(),
      seed: () => MutualAuthOfflineState(
        stage: MutualAuthOfflineStage.result,
        scannedCard: const CardInfoItem(name: 'Alice'),
      ),
      act: (c) => c.reset(),
      expect: () => [
        isA<MutualAuthOfflineState>()
            .having((s) => s.stage, 'stage', MutualAuthOfflineStage.idle)
            .having((s) => s.scannedCard, 'scannedCard', isNull),
      ],
    );
  });
}
