import 'package:base_flutter/data/models/chatbot/message_model.dart';
import 'package:base_flutter/domain/repositories/chatbot_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/ai_chat_v2/ai_chat_v2_page.dart';
import 'package:base_flutter/presentations/modules/chat_bot/cubit/chat_bot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatbotRepo extends Mock implements ChatbotRepo {}

Widget _harness(Widget child) => MaterialApp(home: child);

class _StubChatBotCubit extends ChatBotCubit {
  _StubChatBotCubit();

  void seedMessages(List<MessageModel> msgs) {
    emit(state.copyWith(messages: msgs));
  }

  void seedLoading(bool v) {
    emit(state.copyWith(isLoading: v));
  }

  void seedError(String v) {
    emit(state.copyWith(errorMessage: v));
  }
}

void main() {
  setUp(() {
    final getIt = Injector.getIt;
    if (getIt.isRegistered<ChatbotRepo>()) {
      getIt.unregister<ChatbotRepo>();
    }
    getIt.registerSingleton<ChatbotRepo>(_MockChatbotRepo());
  });

  tearDown(() {
    Injector.getIt.unregister<ChatbotRepo>();
  });

  group('AiChatV2Page', () {
    testWidgets('empty state is rendered when no messages', (tester) async {
      final cubit = _StubChatBotCubit();
      await tester.pumpWidget(_harness(AiChatV2Page(cubit: cubit)));
      await tester.pump();

      expect(find.text('CHON AI에 무엇이든 물어보세요'), findsOneWidget);
      expect(find.byKey(const Key('aiChat.input')), findsOneWidget);
      expect(find.byKey(const Key('aiChat.send')), findsOneWidget);
    });

    testWidgets('renders user and assistant bubbles', (tester) async {
      final cubit = _StubChatBotCubit()
        ..seedMessages([
          MessageModel(content: 'Hello', role: MessageRole.user.name),
          MessageModel(content: 'Hi there!', role: MessageRole.assistant.name),
        ]);
      await tester.pumpWidget(_harness(AiChatV2Page(cubit: cubit)));
      await tester.pump();

      expect(find.text('Hello'), findsOneWidget);
      expect(find.text('Hi there!'), findsOneWidget);
      // Empty state should NOT be visible.
      expect(find.text('CHON AI에 무엇이든 물어보세요'), findsNothing);
    });

    testWidgets('typing indicator appears while loading', (tester) async {
      final cubit = _StubChatBotCubit()
        ..seedMessages([
          MessageModel(content: 'Hello', role: MessageRole.user.name),
        ])
        ..seedLoading(true);
      await tester.pumpWidget(_harness(AiChatV2Page(cubit: cubit)));
      await tester.pump();

      // The list should show messages.length + 1 items (1 message + typing).
      final list = tester.widget<ListView>(find.byKey(const Key('aiChat.list')));
      expect(list.semanticChildCount, 2);
    });

    testWidgets('error banner shows the message', (tester) async {
      final cubit = _StubChatBotCubit()..seedError('Network down');
      await tester.pumpWidget(_harness(AiChatV2Page(cubit: cubit)));
      await tester.pump();
      expect(find.text('Network down'), findsOneWidget);
    });

    testWidgets('Send button is disabled while loading', (tester) async {
      final cubit = _StubChatBotCubit()..seedLoading(true);
      await tester.pumpWidget(_harness(AiChatV2Page(cubit: cubit)));
      await tester.pump();

      final btn = tester.widget<ElevatedButton>(
          find.byKey(const Key('aiChat.send')));
      expect(btn.onPressed, isNull);
    });
  });
}
