class CreateSelfIdRes {
  final int? cardId;
  final String? accessToken;
  CreateSelfIdRes({
    this.cardId,
    this.accessToken,
  });

  factory CreateSelfIdRes.fromJson(dynamic json) {
    return CreateSelfIdRes(
      cardId: json['cardId'] as int?,
      accessToken: json['accessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'accessToken': accessToken,
    };
  }
}
