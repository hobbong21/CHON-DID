class CreateVerifierReq {
  final int cardId;
  final int verifyType;
  final int refTier;
  final String name;
  final String phoneNumber;
  final String? subLevel;
  final String? levelCode;

  const CreateVerifierReq({
    required this.cardId,
    required this.verifyType,
    required this.refTier,
    required this.name,
    required this.phoneNumber,
    this.subLevel,
    this.levelCode,
  });

  factory CreateVerifierReq.fromJson(Map<String, dynamic> json) {
    return CreateVerifierReq(
      cardId: json['cardId'] as int,
      verifyType: json['verifyType'] as int,
      refTier: json['refTier'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      subLevel: json['subLevel'],
      levelCode: json['levelCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'verifyType': verifyType,
      'refTier': refTier,
      'name': name,
      'phoneNumber': phoneNumber,
      'subLevel': subLevel,
      'levelCode': levelCode,
    };
  }

  CreateVerifierReq copyWith({
    int? cardId,
    int? verifyType,
    int? refTier,
    String? name,
    String? phoneNumber,
    String? subLevel,
    String? levelCode,
  }) {
    return CreateVerifierReq(
      cardId: cardId ?? this.cardId,
      verifyType: verifyType ?? this.verifyType,
      refTier: refTier ?? this.refTier,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      subLevel: subLevel ?? this.subLevel,
      levelCode: levelCode ?? this.levelCode,
    );
  }
}
