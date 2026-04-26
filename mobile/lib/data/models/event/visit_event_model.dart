class VisitEventModel {
  final String? checkInTime;
  final String? checkOutTime;
  final String? txID;
  final String? blockHeight;

  VisitEventModel({
    this.checkInTime,
    this.checkOutTime,
    this.txID,
    this.blockHeight,
  });

  factory VisitEventModel.fromJson(Map<String, dynamic> json) {
    return VisitEventModel(
      checkInTime: json['checkInTime'],
      checkOutTime: json['checkOutTime'],
      txID: json['txID'],
      blockHeight: json['blockHeight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'txID': txID,
      'blockHeight': blockHeight,
    };
  }

  VisitEventModel copyWith({
    String? checkInTime,
    String? checkOutTime,
    String? txID,
    String? blockHeight,
  }) {
    return VisitEventModel(
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      txID: txID ?? this.txID,
      blockHeight: blockHeight ?? this.blockHeight,
    );
  }
}

enum VisitEventActionT {
  none('none'),
  checkIn('Check In'),
  checkOut('Check Out'),
  ;

  const VisitEventActionT(this.name);
  final String name;

  static final listNames = [
    checkIn.name,
    checkOut.name,
  ];

  static VisitEventActionT fromName(String name) {
    return VisitEventActionT.values.firstWhere(
      (e) => e.name == name,
      orElse: () => VisitEventActionT.none,
    );
  }

  int toJson() => index;
}
