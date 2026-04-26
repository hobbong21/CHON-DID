part of 'inproc_contact_cubit.dart';

/// Stage of the "contact in process" flow — Figma section 8
/// (`InProc_Contact_01` `376:21766`, `InProc_Contact_02` `376:22695`).
enum InProcContactStage {
  /// Entry / preparing.
  idle,

  /// Calling out to the family member (`InProc_Contact_01`).
  inProgress,

  /// Connected / completed (`InProc_Contact_02`).
  completed,

  /// Could not reach.
  failed,
}

@freezed
abstract class InProcContactState with _$InProcContactState {
  factory InProcContactState({
    @Default(InProcContactStage.idle) InProcContactStage stage,
    @Default('') String contactName,
    @Default('') String contactPhone,
    @Default('') String errorMessage,

    /// Time when [start] was called, used by the UI to render the elapsed
    /// timer on the InProgress screen.
    @Default(null) DateTime? startedAt,
  }) = _InProcContactState;
}
