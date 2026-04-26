import 'package:flutter/material.dart';

class SelfidModel {
  final int? id;
  final String? name;
  final String? englishName;
  final int pointVerify;
  final String? idNumber;
  final String? gender;
  final String? nationality;
  final String? refVisaType;
  final String? issuedDate;
  final String? phoneNumber;
  final String? imgBase64;
  final String? imgPath;
  final String? digitalSignature;
  final int? status;
  final String? blockHeight;
  final String? txId;

  const SelfidModel({
    this.id,
    this.name,
    this.englishName,
    this.idNumber,
    this.gender,
    this.nationality,
    this.refVisaType,
    this.issuedDate,
    this.phoneNumber,
    this.imgBase64,
    this.imgPath,
    this.digitalSignature,
    this.pointVerify = 0,
    this.status,
    this.blockHeight,
    this.txId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'englishName': englishName,
      'idNumber': idNumber,
      'gender': gender,
      'nationality': nationality,
      'refVisaType': refVisaType,
      'issuedDate': issuedDate,
      'phoneNumber': phoneNumber,
      'imgBase64': imgBase64,
      'imgPath': imgPath,
      'digitalSignature': digitalSignature,
      'pointVerify': pointVerify,
      'status': status,
      'blockHeight': blockHeight,
      'txId': txId,
    };
  }

  factory SelfidModel.fromJson(Map<String, dynamic> json) {
    return SelfidModel(
      id: json['id'],
      name: json['name'],
      englishName: json['englishName'],
      idNumber: json['idNumber'],
      gender: json['gender'],
      nationality: json['nationality'],
      refVisaType: json['refVisaType'],
      issuedDate: json['issuedDate'],
      phoneNumber: json['phoneNumber'],
      imgBase64: json['imgBase64'],
      imgPath: json['imgPath'],
      digitalSignature: json['digitalSignature'],
      pointVerify: json['pointVerify'] ?? 0,
      status: json['status'],
      blockHeight: json['blockHeight'],
      txId: json['txId'] ?? json['txID'],
    );
  }

  SelfidModel copyWith({
    int? id,
    String? name,
    String? englishName,
    String? idNumber,
    String? gender,
    String? nationality,
    String? refVisaType,
    String? issuedDate,
    String? phoneNumber,
    String? imgBase64,
    String? imgPath,
    String? digitalSignature,
    int? pointVerify,
    int? status,
    String? blockHeight,
    String? txId,
  }) {
    return SelfidModel(
      id: id ?? this.id,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      idNumber: idNumber ?? this.idNumber,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      refVisaType: refVisaType ?? this.refVisaType,
      issuedDate: issuedDate ?? this.issuedDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imgBase64: imgBase64 ?? this.imgBase64,
      imgPath: imgPath ?? this.imgPath,
      digitalSignature: digitalSignature ?? this.digitalSignature,
      pointVerify: pointVerify ?? this.pointVerify,
      status: status ?? this.status,
      blockHeight: blockHeight ?? this.blockHeight,
      txId: txId ?? this.txId,
    );
  }
}

class GenderT {
  final String type;
  final ValueGetter<String> getName;

  GenderT._(this.type, this.getName);

  static final male = GenderT._(
    'male',
    () {
      return 'male';
    },
  );
  static final female = GenderT._(
    'female',
    () {
      return 'female';
    },
  );

  static final values = [male, female];

  static get valueStrings => [male.getName(), female.getName()];

  static GenderT? getByName(String? name) {
    for (var element in values) {
      if (element.getName() == name) {
        return element;
      }
    }
    return null;
  }

  static GenderT? getByType(String? type) {
    for (var element in values) {
      if (element.type == type) {
        return element;
      }
    }
    return null;
  }
}
