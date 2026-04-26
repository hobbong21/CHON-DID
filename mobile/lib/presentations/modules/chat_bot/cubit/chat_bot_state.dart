part of 'chat_bot_cubit.dart';

@freezed
abstract class ChatBotState with _$ChatBotState {
  factory ChatBotState({
    @Default([]) List<MessageModel> messages,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ChatBotState;
}
