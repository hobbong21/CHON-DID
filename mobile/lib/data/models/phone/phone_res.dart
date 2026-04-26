class PhoneRes {
  String? phoneNumber;

  PhoneRes({this.phoneNumber});

  factory PhoneRes.fromJson(Map<String, dynamic> json) {
    return PhoneRes(
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
    };
  }
}
