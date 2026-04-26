import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/id_generation_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}
class _MockOcrRepo extends Mock implements OcrRepo {}

class _FakeCreateCardRequest extends Fake implements CreateCardRequest {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(_FakeCreateCardRequest());
  });

  testWidgets(
      'ID generation — happy path through 10-stage state machine '
      '(driven via cubit, render assertions on key stages)',
      (tester) async {
    final selfRepo = _MockSelfIdRepo();
    final ocrRepo = _MockOcrRepo();

    when(() => selfRepo.createCard(body: any(named: 'body')))
        .thenAnswer((_) async => const CreateCardData());

    final cubit = IdGenerationCubit(selfIdRepo: selfRepo, ocrRepo: ocrRepo);

    await tester.pumpWidget(MaterialApp(
      home: IdGenerationV2Page(cubit: cubit),
    ));
    await tester.pumpAndSettle();

    // 1) start stage rendered.
    expect(cubit.state.stage, IdGenStage.start);

    // 2) advance through linear stages programmatically up to review.
    cubit.next(); // → personalInfo
    cubit.onPersonalInfoChanged(fullName: '홍길동', idNumber: '900101-1234567');
    cubit.next(); // → verificationOk
    cubit.markVerification(ok: true);
    cubit.next(); // → selectIdType
    cubit.setIdType(IdGenType.selfId);
    cubit.next(); // → capturePrep
    cubit.next(); // → captureFront
    cubit.setFrontImage('mock-base64');
    cubit.next(); // → captureBack
    cubit.setBackImage('mock-base64');
    cubit.next(); // → ocrConfirm
    cubit.next(); // → review
    await tester.pumpAndSettle();
    expect(cubit.state.stage, IdGenStage.review);
    expect(find.text('홍길동'), findsOneWidget);

    // 3) submit → done.
    await cubit.submit();
    await tester.pumpAndSettle();
    expect(cubit.state.stage, IdGenStage.done);
    verify(() => selfRepo.createCard(body: any(named: 'body'))).called(1);
  });
}
