import 'package:base_flutter/presentations/modules/inproc_contact_v2/cubit/inproc_contact_cubit.dart';
import 'package:base_flutter/presentations/modules/inproc_contact_v2/inproc_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _harness(Widget child) => MaterialApp(home: child);

void main() {
  group('InProcContactPage', () {
    testWidgets('idle stage renders the prompt', (tester) async {
      final cubit = InProcContactCubit();
      await tester.pumpWidget(_harness(InProcContactPage(cubit: cubit)));
      await tester.pump();
      expect(find.text('연락할 가족을 선택해주세요.'), findsOneWidget);
    });

    testWidgets('inProgress stage shows the connecting copy and contact card',
        (tester) async {
      final cubit = InProcContactCubit();
      cubit.start(contactName: 'Alice', contactPhone: '01000000000');
      await tester.pumpWidget(_harness(InProcContactPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('연결 중…'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('01000000000'), findsOneWidget);
    });

    testWidgets('completed stage shows success copy', (tester) async {
      final cubit = InProcContactCubit();
      cubit.start(contactName: 'Alice', contactPhone: '01000000000');
      cubit.markCompleted();
      await tester.pumpWidget(_harness(InProcContactPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('통화가 끝났어요.'), findsOneWidget);
    });

    testWidgets('failed stage shows error and a retry button', (tester) async {
      final cubit = InProcContactCubit();
      cubit.start(contactName: 'Alice', contactPhone: '01000000000');
      cubit.markFailed('Network unavailable');
      await tester.pumpWidget(_harness(InProcContactPage(cubit: cubit)));
      await tester.pump();

      expect(find.text('연결할 수 없어요.'), findsOneWidget);
      expect(find.text('Network unavailable'), findsOneWidget);
      expect(find.text('다시 시도'), findsOneWidget);
    });
  });
}
