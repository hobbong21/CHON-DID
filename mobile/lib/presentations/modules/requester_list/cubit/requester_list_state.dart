part of 'requester_list_cubit.dart';

@freezed
abstract class RequesterListState with _$RequesterListState {
  factory RequesterListState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    @Default([]) List<RelationUserModel> requesterList,
  }) = _RequesterListState;
}
