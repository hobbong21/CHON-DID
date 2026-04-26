import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:base_flutter/presentations/modules/profile_edit_v2/profile_edit_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSelfIdRepo extends Mock implements SelfIdRepo {}

class _FakeCreateCardRequest extends Fake implements CreateCardRequest {}

Widget _harness(Widget child) => MaterialApp(home: child);

void main() {
  late _MockSelfIdRepo selfIdRepo;

  setUpAll(() {
    registerFallbackValue(_FakeCreateCardRequest());
  });

  setUp(() {
    selfIdRepo = _MockSelfIdRepo();
    final getIt = Injector.getIt;
    if (getIt.isRegistered<SelfIdRepo>()) getIt.unregister<SelfIdRepo>();
    getIt.registerSingleton<SelfIdRepo>(selfIdRepo);
  });

  tearDown(() {
    Injector.getIt.unregister<SelfIdRepo>();
  });

  group('ProfileEditV2Page', () {
    testWidgets('renders Save button and field labels', (tester) async {
      final cubit = ProfileEditCubit();
      await tester.pumpWidget(_harness(ProfileEditV2Page(
        cubit: cubit,
        card: const CardInfoItem(id: 1, name: '홍 길동'),
      )));
      await tester.pump();

      expect(find.text('성'), findsOneWidget);
      expect(find.text('이름'), findsOneWidget);
      expect(find.text('저장하기'), findsOneWidget);
    });

    testWidgets('seeds the form fields from the card name', (tester) async {
      final cubit = ProfileEditCubit();
      await tester.pumpWidget(_harness(ProfileEditV2Page(
        cubit: cubit,
        card: const CardInfoItem(id: 1, name: '홍 길동'),
      )));
      await tester.pump();

      expect(find.widgetWithText(TextFormField, '홍'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, '길동'), findsOneWidget);
    });

    testWidgets('Save button shows a spinner while loading', (tester) async {
      final cubit = ProfileEditCubit();
      await tester.pumpWidget(_harness(ProfileEditV2Page(
        cubit: cubit,
        card: const CardInfoItem(id: 1, name: '홍 길동'),
      )));
      await tester.pump();

      // Drive the cubit into the loading state directly.
      // ProfileEditState only has isLoading + messageError, both nullable
      // — easiest path is to call update() with no card mock setup, but
      // since update() bails when validation fails, we set up a successful
      // path:
      when(() => selfIdRepo.updateSelfId(
            selfidModel: any(named: 'selfidModel'),
          )).thenAnswer((_) async => const CardInfoItem());

      // Ensure validators pass.
      cubit.surnameController.text = '홍';
      cubit.nameController.text = '길동';

      // Tap save and re-render the spinner frame.
      await tester.tap(find.byKey(const Key('profileEdit.save')));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
