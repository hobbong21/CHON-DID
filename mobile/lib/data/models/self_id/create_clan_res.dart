class CreateCertificateRes {
  final int? id;
  final String? accessToken;
  CreateCertificateRes({
    this.id,
    this.accessToken,
  });

  factory CreateCertificateRes.fromJson(dynamic json) {
    return CreateCertificateRes(
      id: json['id'] as int?,
      accessToken: json['accessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accessToken': accessToken,
    };
  }
}
