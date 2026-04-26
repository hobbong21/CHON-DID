// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RelationUserModel _$RelationUserModelFromJson(Map<String, dynamic> json) =>
    _RelationUserModel(
      id: (json['id'] as num?)?.toInt(),
      gender: $enumDecodeNullable(_$GenderEEnumMap, json['gender']),
      parentId: (json['parentId'] as num?)?.toInt(),
      spouseId: (json['spouseId'] as num?)?.toInt(),
      certOwnerId: (json['certOwnerId'] as num?)?.toInt(),
      certRelatedId: (json['certRelatedId'] as num?)?.toInt(),
      certRelatedName: json['certRelatedName'] as String?,
      certRelatedPhone: json['certRelatedPhone'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$StatusRelationEEnumMap, json['status']) ??
          StatusRelationE.unVerified,
      relationType:
          $enumDecodeNullable(_$RelationTypeEnumMap, json['relationType']),
      isCollapsed: json['isCollapsed'] as bool?,
      imgPath: json['imgPath'] as String?,
      cardName: json['cardName'] as String?,
      certOwnerName: json['certOwnerName'] as String?,
      certOwnerPhone: json['certOwnerPhone'] as String?,
    );

Map<String, dynamic> _$RelationUserModelToJson(_RelationUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'parentId': instance.parentId,
      'spouseId': instance.spouseId,
      'certOwnerId': instance.certOwnerId,
      'certRelatedId': instance.certRelatedId,
      'certRelatedName': instance.certRelatedName,
      'certRelatedPhone': instance.certRelatedPhone,
      'isActive': instance.isActive,
      'status': instance.status,
      'relationType': instance.relationType,
      'isCollapsed': instance.isCollapsed,
      'imgPath': instance.imgPath,
      'cardName': instance.cardName,
      'certOwnerName': instance.certOwnerName,
      'certOwnerPhone': instance.certOwnerPhone,
    };

const _$GenderEEnumMap = {
  GenderE.male: 1,
  GenderE.female: 2,
};

const _$StatusRelationEEnumMap = {
  StatusRelationE.unVerified: 0,
  StatusRelationE.agree: 1,
  StatusRelationE.disagree: 2,
};

const _$RelationTypeEnumMap = {
  RelationType.grandfather: 'grandfather',
  RelationType.grandma: 'grandma',
  RelationType.maternalGrandfather: 'maternal_grandfather',
  RelationType.maternalGrandma: 'maternal_grandma',
  RelationType.father: 'father',
  RelationType.mother: 'mother',
  RelationType.uncle: 'uncle',
  RelationType.auntUncleWife: 'aunt_uncle_wife',
  RelationType.auntFatherSister: 'aunt_father_sister',
  RelationType.uncleAuntHusband: 'uncle_aunt_husband',
  RelationType.owner: 'owner',
  RelationType.husband: 'husband',
  RelationType.wife: 'wife',
  RelationType.brother: 'brother',
  RelationType.littleBrother: 'little_brother',
  RelationType.sister: 'sister',
  RelationType.littleSister: 'little_sister',
  RelationType.brotherInLaw: 'brother_in_law',
  RelationType.sisterInLaw: 'sister_in_law',
  RelationType.cousinBrother: 'cousin_brother',
  RelationType.cousinSister: 'cousin_sister',
  RelationType.cousinSisterInLaw: 'cousin_sister_in_law',
  RelationType.cousinBrotherInLaw: 'cousin_brother_in_law',
  RelationType.son: 'son',
  RelationType.daughter: 'daughter',
  RelationType.nephew: 'nephew',
  RelationType.niece: 'niece',
  RelationType.secondCousin: 'second_cousin',
  RelationType.relatives: 'relatives',
  RelationType.daughterInLaw: 'daughter_in_law',
  RelationType.sonInLaw: 'son_in_law',
  RelationType.nieceInLaw: 'niece_in_law',
  RelationType.nephewInLaw: 'nephew_in_law',
  RelationType.siblingsChild: 'siblings_child',
  RelationType.siblingsGrandChild: 'siblings_grand_child',
  RelationType.secondCousinsChild: 'second_cousins_child',
  RelationType.otherGrand: 'other_grand',
};

_RelationModel _$RelationModelFromJson(Map<String, dynamic> json) =>
    _RelationModel(
      id: (json['id'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$RelationTypeEnumMap, json['type'],
          unknownValue: RelationType.otherGrand),
    );

Map<String, dynamic> _$RelationModelToJson(_RelationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
