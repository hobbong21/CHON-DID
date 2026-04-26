import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'relation_model.g.dart';
part 'relation_model.freezed.dart';

@freezed
abstract class RelationUserModel with _$RelationUserModel {
  const factory RelationUserModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'gender') GenderE? gender,
    @JsonKey(name: 'parentId') int? parentId,
    @JsonKey(name: 'spouseId') int? spouseId,
    @JsonKey(name: 'certOwnerId') int? certOwnerId,
    @JsonKey(name: 'certRelatedId') int? certRelatedId,
    @JsonKey(name: 'certRelatedName') String? certRelatedName,
    @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
    @JsonKey(name: 'isActive') int? isActive,
    @JsonKey(name: 'status')
    @Default(StatusRelationE.unVerified)
    StatusRelationE status,
    @JsonKey(name: 'relationType') RelationType? relationType,
    @JsonKey(name: 'isCollapsed') bool? isCollapsed,
    @JsonKey(name: 'imgPath') String? imgPath,
    @JsonKey(name: 'cardName') String? cardName,
    @JsonKey(name: 'certOwnerName') String? certOwnerName,
    @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone,
  }) = _RelationUserModel;

  factory RelationUserModel.fromJson(Map<String, dynamic> json) =>
      _$RelationUserModelFromJson(json);
}

@freezed
abstract class RelationModel with _$RelationModel {
  const factory RelationModel({
    @JsonKey(name: 'id') int? id,
    // @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
    RelationType? type,
  }) = _RelationModel;

  factory RelationModel.fromJson(Map<String, dynamic> json) =>
      _$RelationModelFromJson(json);
}

enum RelationType {
  /// ông
  @JsonValue('grandfather')
  grandfather,

  /// bà
  @JsonValue('grandma')
  grandma,

  /// ông ngoại
  @JsonValue('maternal_grandfather')
  maternalGrandfather,

  /// bà ngoại
  @JsonValue('maternal_grandma')
  maternalGrandma,

  /// bố
  @JsonValue('father')
  father,

  /// mẹ
  @JsonValue('mother')
  mother,

  /// chú (anh em của bố)
  @JsonValue('uncle')
  uncle,

  /// vợ chú
  @JsonValue('aunt_uncle_wife')
  auntUncleWife,

  /// bác gái (chị em của bố)
  @JsonValue('aunt_father_sister')
  auntFatherSister,

  /// chồng bác gái
  @JsonValue('uncle_aunt_husband')
  uncleAuntHusband,

  /// bản thân
  @JsonValue('owner')
  owner,

  /// chồng
  @JsonValue('husband')
  husband,

  /// vợ
  @JsonValue('wife')
  wife,

  /// anh trai
  @JsonValue('brother')
  brother,

  /// em trai
  @JsonValue('little_brother')
  littleBrother,

  /// chị gái
  @JsonValue('sister')
  sister,

  /// em gái
  @JsonValue('little_sister')
  littleSister,

  /// anh rể
  @JsonValue('brother_in_law')
  brotherInLaw,

  /// chị dâu
  @JsonValue('sister_in_law')
  sisterInLaw,

  /// anh em họ
  @JsonValue('cousin_brother')
  cousinBrother,

  /// chị em họ
  @JsonValue('cousin_sister')
  cousinSister,

  /// anh rể họ
  @JsonValue('cousin_sister_in_law')
  cousinSisterInLaw,

  /// chị dâu họ
  @JsonValue('cousin_brother_in_law')
  cousinBrotherInLaw,

  /// con trai
  @JsonValue('son')
  son,

  /// con gái
  @JsonValue('daughter')
  daughter,

  /// cháu trai
  @JsonValue('nephew')
  nephew,

  /// cháu gái
  @JsonValue('niece')
  niece,

  /// cháu họ (con của anh chị em họ)
  @JsonValue('second_cousin')
  secondCousin,

  /// họ hàng
  @JsonValue('relatives')
  relatives,

  /// con dâu
  @JsonValue('daughter_in_law')
  daughterInLaw,

  /// con rể
  @JsonValue('son_in_law')
  sonInLaw,

  /// cháu dâu
  @JsonValue('niece_in_law')
  nieceInLaw,

  /// cháu rể
  @JsonValue('nephew_in_law')
  nephewInLaw,

  /// cháu họ (con của anh chị em ruột)
  @JsonValue('siblings_child')
  siblingsChild,

  /// cháu chắt (con của con anh chị em ruột)
  @JsonValue('siblings_grand_child')
  siblingsGrandChild,

  /// cháu chắt (con của con anh chị em họ)
  @JsonValue('second_cousins_child')
  secondCousinsChild,

  /// cháu còn lại
  @JsonValue('other_grand')
  otherGrand,
  ;

  String? toJson() {
    return _$RelationTypeEnumMap[this];
  }
}

extension RelationTypeExt on RelationType {
  String get title => switch (this) {
        RelationType.grandfather => S.current.grandfather,
        RelationType.grandma => S.current.grandmother,
        RelationType.maternalGrandfather => S.current.maternalGrandfather,
        RelationType.maternalGrandma => S.current.maternalGrandmother,
        RelationType.father => S.current.father,
        RelationType.mother => S.current.mother,
        RelationType.uncle => S.current.uncle_father_older,
        RelationType.auntUncleWife => S.current.aunt_uncle_wife,
        RelationType.auntFatherSister => S.current.aunt_father_sister,
        RelationType.uncleAuntHusband => S.current.uncle_aunt_husband,
        RelationType.owner => S.current.self,
        RelationType.husband => S.current.husband,
        RelationType.wife => S.current.wife,
        RelationType.brother => S.current.elder_brother,
        RelationType.littleBrother => S.current.little_brother,
        RelationType.sister => S.current.elder_sister,
        RelationType.littleSister => S.current.little_sister,
        RelationType.brotherInLaw => S.current.brother_in_law,
        RelationType.sisterInLaw => S.current.sister_in_law,
        RelationType.cousinBrother => S.current.cousin_brother,
        RelationType.cousinSister => S.current.cousin_sister,
        RelationType.cousinSisterInLaw => S.current.cousin_sister_in_law,
        RelationType.cousinBrotherInLaw => S.current.cousin_brother_in_law,
        RelationType.son => S.current.son,
        RelationType.daughter => S.current.daughter,
        RelationType.nephew => S.current.nephew,
        RelationType.niece => S.current.niece,
        RelationType.secondCousin => S.current.cousins_child,
        RelationType.relatives => S.current.relatives,
        RelationType.daughterInLaw => S.current.daughterInLaw,
        RelationType.sonInLaw => S.current.sonInLaw,
        RelationType.nieceInLaw => S.current.nieceInLaw,
        RelationType.nephewInLaw => S.current.nephewInLaw,
        RelationType.siblingsChild => S.current.siblings_child,
        RelationType.siblingsGrandChild => S.current.siblings_grand_child,
        RelationType.secondCousinsChild => S.current.cousins_childs_child,
        RelationType.otherGrand => S.current.other_grand,
      };

  String iconPath(GenderE gender) => switch (this) {
        RelationType.grandfather => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandfather.png',
        RelationType.grandma => gender == GenderE.male
            ? 'assets/images/grandma.png'
            : 'assets/images/grandma.png',
        RelationType.maternalGrandfather => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandfather.png',
        RelationType.maternalGrandma => gender == GenderE.male
            ? 'assets/images/grandma.png'
            : 'assets/images/grandma.png',
        RelationType.father => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandfather.png',
        RelationType.mother => gender == GenderE.male
            ? 'assets/images/grandma.png'
            : 'assets/images/grandma.png',
        RelationType.uncle => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandma.png',
        RelationType.auntUncleWife => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandma.png',
        RelationType.auntFatherSister => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandma.png',
        RelationType.uncleAuntHusband => gender == GenderE.male
            ? 'assets/images/grandfather.png'
            : 'assets/images/grandma.png',
        RelationType.owner => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.husband => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.wife => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.brother => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.littleBrother => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.sister => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.littleSister => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.brotherInLaw => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.sisterInLaw => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.cousinBrother => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.cousinSister => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.cousinSisterInLaw => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.cousinBrotherInLaw => gender == GenderE.male
            ? 'assets/images/brother.png'
            : 'assets/images/sister.png',
        RelationType.son => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.daughter => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.nephew => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.niece => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.secondCousin => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.relatives => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.daughterInLaw => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.sonInLaw => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.nieceInLaw => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.nephewInLaw => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.siblingsChild => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.siblingsGrandChild => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.secondCousinsChild => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
        RelationType.otherGrand => gender == GenderE.male
            ? 'assets/images/grandson.png'
            : 'assets/images/niece.png',
      };

  RelationType spouse(GenderE gender) => switch (this) {
        RelationType.grandfather => RelationType.grandma,
        RelationType.grandma => RelationType.grandfather,
        RelationType.maternalGrandfather => RelationType.maternalGrandma,
        RelationType.maternalGrandma => RelationType.maternalGrandfather,
        RelationType.father => RelationType.mother,
        RelationType.mother => RelationType.father,
        RelationType.uncle => RelationType.auntUncleWife,
        RelationType.auntUncleWife => RelationType.uncle,
        RelationType.auntFatherSister => RelationType.uncleAuntHusband,
        RelationType.uncleAuntHusband => RelationType.auntFatherSister,
        RelationType.owner =>
          gender == GenderE.male ? RelationType.husband : RelationType.wife,
        RelationType.husband => RelationType.wife,
        RelationType.wife => RelationType.husband,
        RelationType.brother => RelationType.sisterInLaw,
        RelationType.littleBrother => RelationType.sisterInLaw,
        RelationType.sister => RelationType.brotherInLaw,
        RelationType.littleSister => RelationType.brotherInLaw,
        RelationType.brotherInLaw => RelationType.sister,
        RelationType.sisterInLaw => RelationType.brother,
        RelationType.cousinBrother => RelationType.cousinSisterInLaw,
        RelationType.cousinSister => RelationType.cousinBrotherInLaw,
        RelationType.cousinSisterInLaw => RelationType.cousinBrother,
        RelationType.cousinBrotherInLaw => RelationType.cousinSister,
        RelationType.son => RelationType.daughterInLaw,
        RelationType.daughter => RelationType.sonInLaw,
        RelationType.nephew => RelationType.nieceInLaw,
        RelationType.niece => RelationType.nephewInLaw,
        RelationType.secondCousin => gender == GenderE.male
            ? RelationType.nephewInLaw
            : RelationType.nieceInLaw,
        RelationType.siblingsChild => gender == GenderE.male
            ? RelationType.nephewInLaw
            : RelationType.nieceInLaw,
        RelationType.siblingsGrandChild => gender == GenderE.male
            ? RelationType.otherGrand
            : RelationType.otherGrand,
        _ => this,
      };
  RelationType child(GenderE gender) => switch (this) {
        RelationType.grandfather => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.grandma => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.maternalGrandfather => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.maternalGrandma => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.father =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.mother =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.uncle => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.auntUncleWife => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.auntFatherSister => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.uncleAuntHusband => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.owner =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.husband =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.wife =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.brother => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.littleBrother => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.sisterInLaw => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.sister => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.littleSister => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.brotherInLaw => gender == GenderE.male
            ? RelationType.siblingsChild
            : RelationType.siblingsChild,
        RelationType.cousinBrother => RelationType.secondCousin,
        RelationType.cousinSisterInLaw => RelationType.secondCousin,
        RelationType.cousinSister => RelationType.secondCousin,
        RelationType.cousinBrotherInLaw => RelationType.secondCousin,
        RelationType.son =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.daughterInLaw =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.daughter =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.sonInLaw =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.secondCousin => RelationType.secondCousinsChild,
        RelationType.nephewInLaw => RelationType.secondCousinsChild,
        RelationType.siblingsChild => RelationType.siblingsGrandChild,
        RelationType.nieceInLaw => RelationType.siblingsGrandChild,
        _ => RelationType.otherGrand,
      };

  RelationType elderSibling(GenderE gender) => switch (this) {
        RelationType.father => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.mother => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.uncle => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.auntFatherSister => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.owner =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.brother =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.littleBrother =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.sister =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.littleSister =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.cousinBrother => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.cousinSister => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.son =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.daughter =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.nephew =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.niece =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        _ => this,
      };

  RelationType littleSibling(GenderE gender) => switch (this) {
        RelationType.father => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.mother => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.uncle => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.auntFatherSister => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.owner => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.brother => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.littleBrother => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.sister => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.littleSister => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.cousinBrother => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.cousinSister => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.son =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.daughter =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.nephew =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.niece =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        _ => this,
      };

  RelationType reversed(GenderE gender) => switch (this) {
        RelationType.grandfather =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.grandma =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.maternalGrandfather =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.maternalGrandma =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.father =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.mother =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.uncle =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.auntUncleWife =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.auntFatherSister =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.uncleAuntHusband =>
          gender == GenderE.male ? RelationType.nephew : RelationType.niece,
        RelationType.husband => RelationType.wife,
        RelationType.wife => RelationType.husband,
        RelationType.brother => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.littleBrother =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.sister => gender == GenderE.male
            ? RelationType.littleBrother
            : RelationType.littleSister,
        RelationType.littleSister =>
          gender == GenderE.male ? RelationType.brother : RelationType.sister,
        RelationType.brotherInLaw => gender == GenderE.male
            ? RelationType.brotherInLaw
            : RelationType.sisterInLaw,
        RelationType.sisterInLaw => gender == GenderE.male
            ? RelationType.brotherInLaw
            : RelationType.sisterInLaw,
        RelationType.son =>
          gender == GenderE.male ? RelationType.father : RelationType.mother,
        RelationType.daughter =>
          gender == GenderE.male ? RelationType.father : RelationType.mother,
        RelationType.nephew => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.niece => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.cousinBrother => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.cousinSister => gender == GenderE.male
            ? RelationType.cousinBrother
            : RelationType.cousinSister,
        RelationType.cousinBrotherInLaw => gender == GenderE.male
            ? RelationType.cousinBrotherInLaw
            : RelationType.cousinSisterInLaw,
        RelationType.cousinSisterInLaw => gender == GenderE.male
            ? RelationType.cousinBrotherInLaw
            : RelationType.cousinSisterInLaw,
        RelationType.secondCousin => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.owner =>
          gender == GenderE.male ? RelationType.son : RelationType.daughter,
        RelationType.relatives => RelationType.relatives,
        RelationType.daughterInLaw =>
          gender == GenderE.male ? RelationType.father : RelationType.mother,
        RelationType.sonInLaw =>
          gender == GenderE.male ? RelationType.father : RelationType.mother,
        RelationType.nieceInLaw => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.nephewInLaw => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.siblingsChild => gender == GenderE.male
            ? RelationType.uncle
            : RelationType.auntFatherSister,
        RelationType.siblingsGrandChild => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.secondCousinsChild => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
        RelationType.otherGrand => gender == GenderE.male
            ? RelationType.grandfather
            : RelationType.grandma,
      };
}

enum GenderE {
  @JsonValue(1)
  male,
  @JsonValue(2)
  female,
  ;

  int? toJson() {
    return _$GenderEEnumMap[this];
  }
}

extension GenderEExt on GenderE {
  String get title => switch (this) {
        GenderE.male => S.current.male,
        GenderE.female => S.current.female,
      };
}

enum StatusRelationE {
  @JsonValue(0)
  unVerified,
  @JsonValue(1)
  agree,
  @JsonValue(2)
  disagree;

  int? toJson() {
    return _$StatusRelationEEnumMap[this];
  }
}
