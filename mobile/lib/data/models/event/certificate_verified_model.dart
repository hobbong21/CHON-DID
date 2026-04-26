class CertificateVerifiedModel {
  final String? certificateName;
  final int? certificateType;
  final String? certificateDate;

  CertificateVerifiedModel({
    this.certificateName,
    this.certificateType,
    this.certificateDate,
  });

  factory CertificateVerifiedModel.fromJson(Map<String, dynamic> json) {
    return CertificateVerifiedModel(
      certificateName: json['certificateName'],
      certificateType: json['certificateType'],
      certificateDate: json['certificateDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificateName': certificateName,
      'certificateType': certificateType,
      'certificateDate': certificateDate,
    };
  }

  CertificateVerifiedModel copyWith({
    String? certificateName,
    int? certificateType,
    String? certificateDate,
  }) {
    return CertificateVerifiedModel(
      certificateName: certificateName ?? this.certificateName,
      certificateType: certificateType ?? this.certificateType,
      certificateDate: certificateDate ?? this.certificateDate,
    );
  }
}
