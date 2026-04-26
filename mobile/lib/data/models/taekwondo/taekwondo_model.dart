class TaekwondoModel {
  final int? id;
  final int pointVerify;
  final String? name;
  final String? englishName;
  final String? idNumber;
  final String? nationality;
  final int? level;
  final String? levelNumber;
  final String? issuedDate;
  final String? imgBase64;
  final String? imgPath;
  final int? status;
  final String? phoneNumber;
  final String? blockHeight;
  final String? txId;

  TaekwondoModel({
    this.id,
    this.pointVerify = 0,
    this.name,
    this.englishName,
    this.idNumber,
    this.nationality,
    this.level,
    this.levelNumber,
    this.issuedDate,
    this.imgBase64,
    this.imgPath,
    this.status,
    this.phoneNumber,
    this.blockHeight,
    this.txId,
  });

  factory TaekwondoModel.fromJson(Map<String, dynamic> json) {
    return TaekwondoModel(
      id: json['id'],
      pointVerify: json['pointVerify'] ?? 0,
      name: json['name'],
      englishName: json['englishName'],
      idNumber: json['idNumber'],
      nationality: json['nationality'],
      level: json['level'],
      levelNumber: json['levelNumber'],
      issuedDate: json['issuedDate'],
      imgBase64: json['imgBase64'],
      imgPath: json['imgPath'],
      status: json['status'],
      phoneNumber: json['phoneNumber'],
      blockHeight: json['blockHeight'],
      txId: json['txId'] ?? json['txID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointVerify': pointVerify,
      'name': name,
      'englishName': englishName,
      'idNumber': idNumber,
      'nationality': nationality,
      'level': level,
      'levelNumber': levelNumber,
      'issuedDate': issuedDate,
      'imgBase64': imgBase64,
      'imgPath': imgPath,
      'status': status,
      'phoneNumber': phoneNumber,
      'blockHeight': blockHeight,
      'txId': txId,
    };
  }

  TaekwondoModel copyWith({
    int? id,
    int? pointVerify,
    String? name,
    String? englishName,
    String? idNumber,
    String? nationality,
    int? level,
    String? levelNumber,
    String? issuedDate,
    String? imgBase64,
    String? imgPath,
    int? status,
    String? phoneNumber,
    String? blockHeight,
    String? txId,
  }) {
    return TaekwondoModel(
      id: id ?? this.id,
      pointVerify: pointVerify ?? this.pointVerify,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      idNumber: idNumber ?? this.idNumber,
      nationality: nationality ?? this.nationality,
      level: level ?? this.level,
      levelNumber: levelNumber ?? this.levelNumber,
      issuedDate: issuedDate ?? this.issuedDate,
      imgBase64: imgBase64 ?? this.imgBase64,
      imgPath: imgPath ?? this.imgPath,
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      blockHeight: blockHeight ?? this.blockHeight,
      txId: txId ?? this.txId,
    );
  }
}
