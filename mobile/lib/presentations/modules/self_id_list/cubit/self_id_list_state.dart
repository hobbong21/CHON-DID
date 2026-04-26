part of 'self_id_list_cubit.dart';

@freezed
abstract class SelfIdListState with _$SelfIdListState {
  const factory SelfIdListState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<CardInfoItem> cards,
    @Default(0) int page,
    @Default(false) bool isLastPage,
    @Default([]) List<CardInfoItem> cardsSelected,
    @Default(false) bool selectMode,
  }) = _SelfIdListState;
}
