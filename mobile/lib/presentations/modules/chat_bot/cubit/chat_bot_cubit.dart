import 'package:base_flutter/data/models/chatbot/message_model.dart';
import 'package:base_flutter/domain/repositories/chatbot_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bot_state.dart';
part 'chat_bot_cubit.freezed.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final _chatbotRepo = Injector.getIt<ChatbotRepo>();
  ChatBotCubit() : super(ChatBotState());

  final scrollController = ScrollController();
  final inputController = TextEditingController();

  Future<void> sendMessage() async {
    if (inputController.text.trim().isEmpty) return;
    emit(state.copyWith(errorMessage: ''));
    if (inputController.text.length > 2000) {
      emit(state.copyWith(
          errorMessage: S.current.MESSAGE_TOO_LONG));
      return;
    }
    final message = MessageModel(
      content: inputController.text,
      role: MessageRole.user.name,
    );
    emit(state.copyWith(
      messages: [...state.messages, message],
      isLoading: true,
    ));
    inputController.clear();

    try {
      final auth = 'Bearer ${dotenv.env['API_KEY']}';
      final result =
          await _chatbotRepo.chat(authorization: auth, messages: [message]);
      final messageResult = MessageModel(
        content: result.choices?[0].message?.content ?? '',
        role: MessageRole.assistant.name,
      );
      emit(state.copyWith(
        messages: [...state.messages, messageResult],
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void onChange(Change<ChatBotState> change) {
    if (change.nextState.messages != change.currentState.messages) {
      scrollToBottom();
    }
    super.onChange(change);
  }
}
