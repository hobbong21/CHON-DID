part of 'self_id_creater_cubit.dart';

@freezed
abstract class SelfIdCreaterState with _$SelfIdCreaterState {
  const factory SelfIdCreaterState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    File? selectedFile, 
    @Default(0) int resetKey,
    int? createdCardId,
  }) = _SelfIdCreaterState;
}