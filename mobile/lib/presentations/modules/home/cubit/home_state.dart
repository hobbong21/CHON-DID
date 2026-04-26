part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    @Default([]) List<CardInfoItem> listCards,
    @Default([]) List<RelationUserModel> requesterList,
  }) = _HomeState;
}
