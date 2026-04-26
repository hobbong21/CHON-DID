class VerifierModer   {
  final int? id;
  final int? refTier;
  final int? verifyType;
  final int? refVerifyId;
  final String? name;
  final String? phoneNumber;
  final int? status;
  final String? subLevel;
  final String? displayName;

  const VerifierModer({
    this.id,
    this.refTier = 1,
    this.verifyType,
    this.refVerifyId,
    this.name,
    this.phoneNumber,
    this.status,
    this.subLevel,
    this.displayName,
  });

  factory VerifierModer.fromJson(Map<String, dynamic> json) {
    return VerifierModer(
      id: json['id'] as int?,
      refTier: json['refTier'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      status: json['status'] as int?,
      verifyType: json['verifyType'] as int?,
      refVerifyId: json['refVerifyId'] as int?,
      subLevel: json['subLevel'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refTier': refTier,
      'name': name,
      'phoneNumber': phoneNumber,
      'status': status,
      'verifyType': verifyType,
      'refVerifyId': refVerifyId,
      'subLevel': subLevel,
      'displayName': displayName,
    };
  }

  VerifierModer copyWith({
    int? id,
    int? refTier,
    String? name,
    String? phoneNumber,
    int? status,
    int? verifyType,
    int? refVerifyId,
    String? subLevel,
    String? displayName,
  }) {
    return VerifierModer(
      id: id ?? this.id,
      refTier: refTier ?? this.refTier,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      verifyType: verifyType ?? this.verifyType,
      refVerifyId: refVerifyId ?? this.refVerifyId,
      subLevel: subLevel ?? this.subLevel,
      displayName: displayName ?? this.displayName,
    );
  }
}

enum VerifyTypeE {
  none('none'),
  selfId('Self-ID'),
  cardFamily('Family tree'),
  cardTaekwondo('Taekondo');

  const VerifyTypeE(
    this.name,
  );

  final String name;

  static List<String> get listName => VerifyTypeE.values.sublist(1).map((e) => e.name).toList();

  static VerifyTypeE fromName(String name) {
    return VerifyTypeE.values.firstWhere(
      (e) => e.name == name,
      orElse: () => VerifyTypeE.none,
    );
  }
}

enum VerifyStatueE {
  notConfirmed,
  agree,
  disagree,
}
