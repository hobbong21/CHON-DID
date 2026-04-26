// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageRes _$MessageResFromJson(Map<String, dynamic> json) => _MessageRes(
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageResToJson(_MessageRes instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };

_ChoiceModel _$ChoiceModelFromJson(Map<String, dynamic> json) => _ChoiceModel(
      message: json['message'] == null
          ? null
          : MsgModel.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceModelToJson(_ChoiceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_MsgModel _$MsgModelFromJson(Map<String, dynamic> json) => _MsgModel(
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MsgModelToJson(_MsgModel instance) => <String, dynamic>{
      'content': instance.content,
    };
