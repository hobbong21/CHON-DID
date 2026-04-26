import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/cubit/id_generation_cubit.dart';
import 'package:base_flutter/presentations/modules/id_generation_v2/id_generation_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _MockOcrRepo extends Mock implements OcrRepo {}

Widget _harness(Widget child) => MaterialApp(home: child);

IdGenerationCubit _makeCubit() => IdGenerationCubit(
      selfIdRepo: _MockSelfIdRepo(),
      ocrRepo: _MockOcrRepo(),
    );

void main() {
  group('IdGenerationV2Page', () {
    testWidgets('start stage shows the entry copy', (tester) async {
      final cubit = _makeCubit();
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('CHON ID 발급을 시작할게요'), findsOneWidget);
      expect(find.text('시작하기'), findsOneWidget);
    });

    testWidgets('verificationOk failure variant shows 다시 입력 button',
        (tester) async {
      final cubit = _makeCubit();
      cubit.emit(IdGenerationState(
        stage: IdGenStage.verificationOk,
        verificationFailed: true,
      ));
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('확인할 수 없어요'), findsOneWidget);
      expect(find.text('다시 입력'), findsOneWidget);
    });

    testWidgets('selectIdType stage renders all 3 type cards',
        (tester) async {
      final cubit = _makeCubit();
      cubit.emit(IdGenerationState(stage: IdGenStage.selectIdType));
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('주민/외국인등록증'), findsOneWidget);
      expect(find.text('가족관계증명서'), findsOneWidget);
      expect(find.text('태권도 단증'), findsOneWidget);
    });

    testWidgets('capturePrep stage shows the 3 photo tips', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(IdGenerationState(stage: IdGenStage.capturePrep));
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('어두운 배경에서 촬영해주세요.'), findsOneWidget);
      expect(find.text('빛이 반사되지 않도록 방향을 조정하세요.'), findsOneWidget);
      expect(find.text('신분증 모서리가 가이드 안에 들어오게 해주세요.'), findsOneWidget);
    });

    testWidgets('review stage shows entered info and 발급하기 button',
        (tester) async {
      final cubit = _makeCubit();
      cubit.emit(IdGenerationState(
        stage: IdGenStage.review,
        fullName: '홍길동',
        idNumber: '900101-1234567',
        address: '서울특별시 강남구',
      ));
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('홍길동'), findsOneWidget);
      expect(find.text('900101-1234567'), findsOneWidget);
      expect(find.text('발급하기'), findsOneWidget);
    });

    testWidgets('done stage shows celebration copy', (tester) async {
      final cubit = _makeCubit();
      cubit.emit(IdGenerationState(stage: IdGenStage.done));
      await tester.pumpWidget(_harness(IdGenerationV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('CHON ID가 발급되었어요'), findsOneWidget);
    });
  });
}
