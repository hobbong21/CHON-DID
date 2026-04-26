class CategoryModel {
  final int? id;
  final String? code;
  final String? displayName;
  final String? displayValue;
  final String? levelCode;
  final int? isActive;
  final int? displayOrder;

  const CategoryModel({
    this.displayName,
    this.displayValue,
    this.levelCode,
    this.id,
    this.code,
    this.isActive,
    this.displayOrder,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      displayName: json['displayName'],
      displayValue: json['displayValue'],
      levelCode: json['levelCode'],
      code: json['code'],
      isActive: json['isActive'],
      displayOrder: json['displayOrder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'displayValue': displayValue,
      'levelCode': levelCode,
      'code': code,
      'isActive': isActive,
      'displayOrder': displayOrder,
    };
  }

  CategoryModel copyWith({
    int? id,
    String? displayName,
    String? displayValue,
    String? levelCode,
    String? code,
    int? isActive,
    int? displayOrder,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      displayValue: displayValue ?? this.displayValue,
      levelCode: levelCode ?? this.levelCode,
      code: code ?? this.code,
      isActive: isActive ?? this.isActive,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
