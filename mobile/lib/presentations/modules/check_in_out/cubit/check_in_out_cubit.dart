import 'package:base_flutter/data/models/event/visit_event_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/event_repo.dart'; // Import EventRepo
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_out_state.dart';
part 'check_in_out_cubit.freezed.dart';

class CheckInOutCubit extends Cubit<CheckInOutState> {
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final _eventRepo = Injector.getIt<EventRepo>();

  CheckInOutCubit() : super(const CheckInOutState());

  int? _currentEventId;
  int? cardId;

  Future<void> init({required int cardId, int? eventId}) async {
    _currentEventId = eventId;
    cardId = cardId;
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _selfIdRepo.getSelfIdDetail(id: cardId);
      emit(state.copyWith(isLoading: false, card: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _performVisitAction(VisitEventActionT action) async {
    final cardId = state.card?.id;
    final eventId = _currentEventId;

    if (cardId == null) {
      emit(state.copyWith(errorMessage: S.current.CARD_INFO_NOT_EXIST));
      return;
    }
    emit(state.copyWith(isVisiting: true, errorMessage: ''));

    try {
      final results = await Future.wait([
        _eventRepo.visitEvent(
          eventId: eventId ?? 0,
          actionType: action,
          certificateType: 1,
          cardId: cardId,
        ),
        Future.delayed(Duration(seconds: 1)),
      ]);
      final result = results[0] as VisitEventModel;

      emit(state.copyWith(isVisiting: false, visitResult: result));
      AppNavigator.push(Routes.verificationFinish, {
        'type': VerificationFinishType.checkInOut,
        'txId': result.txID,
        'action': action
      });
    } catch (e) {
      emit(state.copyWith(isVisiting: false, errorMessage: e.toString()));
    }
  }

  Future<void> checkIn() async {
    await _performVisitAction(VisitEventActionT.checkIn);
  }

  Future<void> checkOut() async {
    await _performVisitAction(VisitEventActionT.checkOut);
  }
}
