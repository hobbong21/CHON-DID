part of 'id_generation_cubit.dart';

/// Phases of the ID Generation flow — Figma section 3.
///
/// 28 frames in Figma map to ~10 logical phases. The Cubit drives this
/// state; each phase is rendered by a small leaf page (some delegate to
/// existing modules — `ocr_id`, `self_id_creater`).
enum IdGenStage {
  /// `ID_01` `182:23526` — entry / consent.
  start,

  /// `PP_01_1` … `PP_01_4` (`260:20879`, `300:3979`, `300:4018`, `300:4139`)
  /// — personal info form, 4 steps.
  personalInfo,

  /// `PP_02_OK_01` `260:20344` — verification success.
  /// `PP_02_OK_F_01` `260:21163` — verification failure (kept here, branched
  /// via [verificationFailed]).
  verificationOk,

  /// `ID Gen_02` `300:4231` — choose ID type (selfId / cardFamily / etc).
  selectIdType,

  /// `ID Gen_03_01` … `ID Gen_03_06` — capture preparation (6 sub-steps).
  capturePrep,

  /// `ID Gen_03_02_01_01` … `_01_04` — front-side camera capture flow.
  captureFront,

  /// `ID Gen_03_02_02`, `ID Gen_03_02_02_01` — back-side capture.
  captureBack,

  /// `ID Gen_03_02_03`, `ID Gen_03_02_03_01` — OCR confirm.
  ocrConfirm,

  /// `ID Gen_03_02_04`, `ID Gen_03_02_04_01`, `_02` — review extracted info.
  review,

  /// `ID Gen_04` `301:26743` — done.
  done,
}

/// ID type the user is generating. Mirrors `VerifyTypeE` for now.
enum IdGenType { selfId, cardFamily, cardTaekwondo }

@freezed
abstract class IdGenerationState with _$IdGenerationState {
  factory IdGenerationState({
    @Default(IdGenStage.start) IdGenStage stage,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,

    /// `true` after PP_02_OK_F_01 surfaces — keeps the verificationOk
    /// stage so the page can flip to a failure card without leaving.
    @Default(false) bool verificationFailed,

    @Default(IdGenType.selfId) IdGenType idType,

    // Personal info captured during the PP_01_NN steps.
    @Default('') String fullName,
    @Default('') String idNumber,
    @Default('') String address,
    @Default('') String issuedDate,
    @Default('') String issuingAuthority,

    /// Base64-encoded JPEG of the front of the card.
    @Default(null) String? frontImageBase64,

    /// Base64-encoded JPEG of the back of the card.
    @Default(null) String? backImageBase64,
  }) = _IdGenerationState;
}
