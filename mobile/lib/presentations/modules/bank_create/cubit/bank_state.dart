part of 'bank_cubit.dart';

@freezed
abstract class BankState with _$BankState {
  const factory BankState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<BankModel> banks,
    @Default([]) List<BankInfoModel> bankInfo,
    @Default([]) List<CardInfoItem> listCards,
  }) = _BankState;
}
