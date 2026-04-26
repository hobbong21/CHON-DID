class HomeInfoModel {
  final int? id;
  final int pointVerify;
  final String? imgPath;
  final int? status;
  final String? idNumber;
  final String? digitalSignature;
  final int? verifyType;
  final String? shareLink;
  final String? qrCode;
  final String? blockHeight;
  final String? txId;

  const HomeInfoModel({
    this.id,
    this.pointVerify = 0,
    this.imgPath,
    this.status,
    this.idNumber,
    this.digitalSignature,
    this.verifyType,
    this.shareLink,
    this.qrCode,
    this.blockHeight,
    this.txId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointVerify': pointVerify,
      'imgPath': imgPath,
      'status': status,
      'idNumber': idNumber,
      'digitalSignature': digitalSignature,
      'verifyType': verifyType,
      'shareLink': shareLink,
      'qrCode': qrCode,
      'blockHeight': blockHeight,
      'txId': txId,
    };
  }

  factory HomeInfoModel.fromJson(Map<String, dynamic> json) {
    return HomeInfoModel(
      id: json['id'] as int?,
      pointVerify: json['pointVerify'] ?? 0,
      imgPath: json['imgPath'] as String?,
      status: json['status'] as int?,
      idNumber: json['idNumber'] as String?,
      digitalSignature: json['digitalSignature'] as String?,
      verifyType: json['verifyType'] as int?,
      shareLink: json['shareLink'] as String?,
      qrCode: json['qrCode'] as String?,
      blockHeight: json['blockHeight'] as String?,
      txId: json['txId'] as String?,
    );
  }

  HomeInfoModel copyWith({
    int? id,
    int? pointVerify,
    String? imgPath,
    int? status,
    String? idNumber,
    String? digitalSignature,
    int? verifyType,
    String? shareLink,
    String? qrCode,
    String? blockHeight,
    String? txId,
  }) {
    return HomeInfoModel(
      id: id ?? this.id,
      pointVerify: pointVerify ?? this.pointVerify,
      imgPath: imgPath ?? this.imgPath,
      status: status ?? this.status,
      idNumber: idNumber ?? this.idNumber,
      digitalSignature: digitalSignature ?? this.digitalSignature,
      verifyType: verifyType ?? this.verifyType,
      shareLink: shareLink ?? this.shareLink,
      qrCode: qrCode ?? this.qrCode,
      blockHeight: blockHeight ?? this.blockHeight,
      txId: txId ?? this.txId,
    );
  }
}

enum SignatureStatusE {
  unverified,
  verified,
}
