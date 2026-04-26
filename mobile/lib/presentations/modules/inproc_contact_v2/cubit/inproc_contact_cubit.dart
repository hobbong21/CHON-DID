import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inproc_contact_state.dart';
part 'inproc_contact_cubit.freezed.dart';

/// Cubit for the "Contact in Process" flow — Figma section 8
/// (`InProc_Contact_01` … `InProc_Contact_02`).
///
/// This is the status flow shown after a user taps the **연락하기**
/// quick action on Home. The actual phone call is handed off to the
/// system dialer; this cubit just tracks UI stage so we can show the
/// in-progress / completed screens consistently.
class InProcContactCubit extends Cubit<InProcContactState> {
  InProcContactCubit() : super(InProcContactState());

  /// Called when the user picked a contact and we kick off the dial.
  void start({
    required String contactName,
    required String contactPhone,
  }) {
    emit(state.copyWith(
      stage: InProcContactStage.inProgress,
      contactName: contactName,
      contactPhone: contactPhone,
      startedAt: DateTime.now(),
      errorMessage: '',
    ));
  }

  /// Called when the system reports the call connected / ended OK.
  void markCompleted() {
    emit(state.copyWith(stage: InProcContactStage.completed));
  }

  /// Called when the dial failed.
  void markFailed(String reason) {
    emit(state.copyWith(
      stage: InProcContactStage.failed,
      errorMessage: reason,
    ));
  }

  /// Reset back to idle (e.g. user tapped "다시 시도").
  void reset() {
    emit(InProcContactState());
  }
}
