class MessageModel {
  String? content;
  String? role;
  String? time;
  String? senderId;
  String? receiverId;
  String? errorMessage;

  MessageModel({
    this.content,
    this.role,
    this.time,
    this.senderId,
    this.receiverId,
    this.errorMessage,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    role = json['role'];
    time = json['time'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['role'] = role;
    data['time'] = time;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['errorMessage'] = errorMessage;
    return data;
  }

  Map<String, dynamic> toJsonChat() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['role'] = role;
    return data;
  }

  MessageModel coppyWith({
    String? content,
    String? type,
    String? time,
    String? senderId,
    String? receiverId,
    String? errorMessage,
  }) {
    return MessageModel(
      content: content ?? this.content,
      role: type ?? role,
      time: time ?? this.time,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum MessageRole {
  system,
  user,
  assistant,
}

enum AiModel {
  gpt3_5Turbo,
  gpt4_1,
  gpt4_1Mini,
  gpt4_1Nano,
  ;

  String get name {
    switch (this) {
      case AiModel.gpt3_5Turbo:
        return 'gpt-3.5-turbo';
      case AiModel.gpt4_1:
        return 'gpt-4.1';
      case AiModel.gpt4_1Mini:
        return 'gpt-4.1-mini';
      case AiModel.gpt4_1Nano:
        return 'gpt-4.1-nano';
    }
  }
}
