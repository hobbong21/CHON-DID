class BankModel {
  final int? id;
  final int? userId;
  final int? refBank;
  final String? account;
  final int? status;

  const BankModel({
    this.id,
    this.userId,
    this.refBank,
    this.account,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'refBank': refBank,
      'account': account,
      'status': status,
    };
  }

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      refBank: json['refBank'] as int?,
      account: json['account'] as String?,
      status: json['status'] as int?,
    );
  }

  BankModel copyWith({
    int? id,
    int? userId,
    int? refBank,
    String? account,
    int? status,
  }) {
    return BankModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      refBank: refBank ?? this.refBank,
      account: account ?? this.account,
      status: status ?? this.status,
    );
  }
}

enum BankTypeE {
  kb('국민은행'),
  sol('신한 은행'),
  ibk('IBK'),
  won('우리은행');

  const BankTypeE(this.name);

  final String name;

  int get refBank => BankTypeE.values.firstWhere((e) => e.name == name).index;

  static BankTypeE? getBank(int? refBank) {
    try {
      return BankTypeE.values[refBank!];
    } catch (e) {
      return null;
    }
  }
}
