import 'package:base_flutter/presentations/modules/inproc_contact_v2/cubit/inproc_contact_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InProcContactCubit', () {
    blocTest<InProcContactCubit, InProcContactState>(
      'start sets stage=inProgress with contact info and a startedAt',
      build: () => InProcContactCubit(),
      act: (c) => c.start(contactName: 'Alice', contactPhone: '01000000000'),
      expect: () => [
        isA<InProcContactState>()
            .having((s) => s.stage, 'stage', InProcContactStage.inProgress)
            .having((s) => s.contactName, 'contactName', 'Alice')
            .having((s) => s.contactPhone, 'contactPhone', '01000000000')
            .having((s) => s.startedAt, 'startedAt', isNotNull),
      ],
    );

    blocTest<InProcContactCubit, InProcContactState>(
      'markCompleted moves stage to completed without losing contact data',
      build: () => InProcContactCubit(),
      seed: () => InProcContactState(
        stage: InProcContactStage.inProgress,
        contactName: 'Alice',
        contactPhone: '01000000000',
      ),
      act: (c) => c.markCompleted(),
      expect: () => [
        isA<InProcContactState>()
            .having((s) => s.stage, 'stage', InProcContactStage.completed)
            .having((s) => s.contactName, 'contactName', 'Alice'),
      ],
    );

    blocTest<InProcContactCubit, InProcContactState>(
      'markFailed moves stage to failed with errorMessage',
      build: () => InProcContactCubit(),
      seed: () => InProcContactState(stage: InProcContactStage.inProgress),
      act: (c) => c.markFailed('No signal'),
      expect: () => [
        isA<InProcContactState>()
            .having((s) => s.stage, 'stage', InProcContactStage.failed)
            .having((s) => s.errorMessage, 'errorMessage', 'No signal'),
      ],
    );

    blocTest<InProcContactCubit, InProcContactState>(
      'reset returns to fresh idle state',
      build: () => InProcContactCubit(),
      seed: () => InProcContactState(
        stage: InProcContactStage.completed,
        contactName: 'Alice',
        startedAt: DateTime.now(),
      ),
      act: (c) => c.reset(),
      expect: () => [
        isA<InProcContactState>()
            .having((s) => s.stage, 'stage', InProcContactStage.idle)
            .having((s) => s.contactName, 'contactName', '')
            .having((s) => s.startedAt, 'startedAt', isNull),
      ],
    );
  });
}
