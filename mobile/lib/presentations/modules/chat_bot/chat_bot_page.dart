import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/data/models/chatbot/message_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'cubit/chat_bot_cubit.dart';
import 'widgets/input_chat.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final cubit = ChatBotCubit();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arg = GoRouterState.of(context).extra as String?;
      if (arg != null && arg.isNotEmpty) {
        cubit.inputController.text = arg;
        cubit.sendMessage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocConsumer<ChatBotCubit, ChatBotState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.errorMessage.isNotEmpty) {
          AppUtils.showSnackBarError(
            context: context,
            title: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.background,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Header(title: S.current.chat),
                Expanded(
                  child: ListView.builder(
                    controller: cubit.scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      if (message.role == MessageRole.system.name) {
                        return const SizedBox.shrink();
                      }
                      final isBot = message.role == MessageRole.assistant.name;
                      return _buildMessageItem(
                        isBot: isBot,
                        message: message.content ?? '',
                        senderName: isBot ? "Bot" : "You",
                        messageError: message.errorMessage ?? '',
                      );
                    },
                  ),
                ),
                InputChat(
                  controller: cubit.inputController,
                  onTapSend: () {
                    cubit.sendMessage();
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessageItem({
    required bool isBot,
    required String message,
    required String senderName,
    String messageError = '',
  }) {
    final theme = context.theme;
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: 12),
      child: Column(
        crossAxisAlignment:
            isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if (messageError.isNotEmpty) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  messageError,
                  style: theme.textTheme.bodySmall?.copyWith(color: colors.red),
                ),
                const SizedBox(width: 4),
                Icon(Icons.error_outline, color: colors.red, size: 16),
              ],
            ),
            const SizedBox(height: 2),
          ],
          Opacity(
            opacity: messageError.isNotEmpty ? 0.5 : 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isBot ? colors.white : colors.lightYellow,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                message,
                style: theme.textTheme.bodyMedium,
                textAlign: isBot ? TextAlign.start : TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
