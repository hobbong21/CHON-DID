class ClanModel {
  final int? id;
  final int pointVerify;
  final String? clanName;
  final String? origin;
  final String? pa;
  final String? se;
  final String? birth;
  final String? phoneNumber;
  final int? relationship;
  final String? personalName;
  final String? englishName;
  final String? personalGivenName;
  final String? personalNickname;
  final String? address;
  final String? gps;
  final String? otherInfo;
  final String? familyOccupation;
  final String? imgBase64;
  final String? imgPath;
  final int? status;
  final String? blockHeight;
  final String? txId;
  final String? idNumber;

  ClanModel({
    this.id,
    this.pointVerify = 0,
    this.clanName,
    this.origin,
    this.pa,
    this.se,
    this.birth,
    this.phoneNumber,
    this.relationship,
    this.personalName,
    this.englishName,
    this.personalGivenName,
    this.personalNickname,
    this.address,
    this.gps,
    this.otherInfo,
    this.familyOccupation,
    this.imgBase64,
    this.imgPath,
    this.status,
    this.blockHeight,
    this.txId,
    this.idNumber,
  });

  factory ClanModel.fromJson(Map<String, dynamic> json) {
    return ClanModel(
      id: json['id'],
      pointVerify: json['pointVerify'] ?? 0,
      clanName: json['clanName'],
      origin: json['origin'],
      pa: json['pa'],
      se: json['se'],
      birth: json['birth'],
      phoneNumber: json['phoneNumber'],
      relationship: json['relationship'],
      personalName: json['personalName'],
      englishName: json['englishName'],
      personalGivenName: json['personalGivenName'],
      personalNickname: json['personalNickname'],
      address: json['address'],
      gps: json['gps'],
      otherInfo: json['otherInfo'],
      familyOccupation: json['familyOccupation'],
      imgBase64: json['imgBase64'],
      imgPath: json['imgPath'],
      status: json['status'],
      blockHeight: json['blockHeight'],
      txId: json['txId'] ?? json['txID'],
      idNumber: json['idNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointVerify': pointVerify,
      'clanName': clanName,
      'origin': origin,
      'pa': pa,
      'se': se,
      'birth': birth,
      'phoneNumber': phoneNumber,
      'relationship': relationship,
      'personalName': personalName,
      'englishName': englishName,
      'personalGivenName': personalGivenName,
      'personalNickname': personalNickname,
      'address': address,
      'gps': gps,
      'otherInfo': otherInfo,
      'familyOccupation': familyOccupation,
      'imgBase64': imgBase64,
      'imgPath': imgPath,
      'status': status,
      'blockHeight': blockHeight,
      'txId': txId,
      'idNumber': idNumber,
    };
  }

  ClanModel copyWith({
    int? id,
    int? pointVerify,
    String? clanName,
    String? origin,
    String? pa,
    String? se,
    String? birth,
    String? phoneNumber,
    int? relationship,
    String? personalName,
    String? englishName,
    String? personalGivenName,
    String? personalNickname,
    String? address,
    String? gps,
    String? otherInfo,
    String? familyOccupation,
    String? imgBase64,
    String? imgPath,
    int? status,
    String? blockHeight,
    String? txId,
    String? idNumber,
  }) {
    return ClanModel(
      id: id ?? this.id,
      pointVerify: pointVerify ?? this.pointVerify,
      clanName: clanName ?? this.clanName,
      origin: origin ?? this.origin,
      pa: pa ?? this.pa,
      se: se ?? this.se,
      birth: birth ?? this.birth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      relationship: relationship ?? this.relationship,
      personalName: personalName ?? this.personalName,
      englishName: englishName ?? this.englishName,
      personalGivenName: personalGivenName ?? this.personalGivenName,
      personalNickname: personalNickname ?? this.personalNickname,
      address: address ?? this.address,
      gps: gps ?? this.gps,
      otherInfo: otherInfo ?? this.otherInfo,
      familyOccupation: familyOccupation ?? this.familyOccupation,
      imgBase64: imgBase64 ?? this.imgBase64,
      imgPath: imgPath ?? this.imgPath,
      status: status ?? this.status,
      blockHeight: blockHeight ?? this.blockHeight,
      txId: txId ?? this.txId,
      idNumber: idNumber ?? this.idNumber,
    );
  }
}
