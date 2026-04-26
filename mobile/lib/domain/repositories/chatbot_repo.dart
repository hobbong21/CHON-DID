import 'package:base_flutter/data/models/chatbot/message_model.dart';
import 'package:base_flutter/data/models/chatbot/message_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'chatbot_repo.g.dart';

@RestApi()
abstract class ChatbotRepo {
  factory ChatbotRepo(
    Dio dio, {
    String baseUrl,
  }) = _ChatbotRepo;

  @POST('/completions')
  Future<MessageRes> chat({
    @Header('Authorization') required String authorization,
    @Field() required List<MessageModel> messages,
    @Field() String model = 'gpt-4.1-nano',
    @Field() double temperature = 0.7,
    // @Field() int maxTokens = 2048,
  });
}
