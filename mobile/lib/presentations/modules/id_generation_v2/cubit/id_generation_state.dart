part of 'id_generation_cubit.dart';

/// Phases of the ID Generation flow — Figma section 3.
enum IdGenStage {
  start,
  personalInfo,
  verificationOk,
  selectIdType,
  capturePrep,
  captureFront,
  captureBack,
  ocrConfirm,
  review,
  done,
}

/// ID type the user is generating.
enum IdGenType { selfId, cardFamily, cardTaekwondo }

@freezed
abstract class IdGenerationState with _$IdGenerationState {
  factory IdGenerationState({
    @Default(IdGenStage.start) IdGenStage stage,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool verificationFailed,
    @Default(IdGenType.selfId) IdGenType idType,
    @Default('') String fullName,
    @Default('') String idNumber,
    @Default('') String address,
    @Default('') String issuedDate,
    @Default('') String issuingAuthority,
    @Default(null) String? frontImageBase64,
    @Default(null) String? backImageBase64,
    @Default(null) KoreanIdCard? ocrResult,
  }) = _IdGenerationState;
}
