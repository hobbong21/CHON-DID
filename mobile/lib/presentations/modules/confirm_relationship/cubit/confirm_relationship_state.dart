part of 'confirm_relationship_cubit.dart';

@freezed
abstract class ConfirmRelationshipState with _$ConfirmRelationshipState {
  const factory ConfirmRelationshipState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingBlock,
    @Default('') String messageError,
    CardInfoItem? info,
    CardInfoItem? owner,
    RelationUserModel? relation,
  }) = _ConfirmRelationshipState;
}
