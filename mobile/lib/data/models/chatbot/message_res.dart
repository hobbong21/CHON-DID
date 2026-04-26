import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_res.freezed.dart';
part 'message_res.g.dart';

@freezed
abstract class MessageRes with _$MessageRes {
  const factory MessageRes({
    List<ChoiceModel>? choices,
  }) = _MessageRes;

  factory MessageRes.fromJson(Map<String, dynamic> json) =>
      _$MessageResFromJson(json);
}

@freezed
abstract class ChoiceModel with _$ChoiceModel {
  const factory ChoiceModel({
    MsgModel? message,
  }) = _ChoiceModel;

  factory ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);
}

@freezed
abstract class MsgModel with _$MsgModel {
  const factory MsgModel({
    String? content,
  }) = _MsgModel;

  factory MsgModel.fromJson(Map<String, dynamic> json) =>
      _$MsgModelFromJson(json);
}
