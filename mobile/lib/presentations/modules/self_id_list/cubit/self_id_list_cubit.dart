import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_id_list_state.dart';
part 'self_id_list_cubit.freezed.dart';

class SelfIdListCubit extends Cubit<SelfIdListState> {
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final int _pageSize = 10;
  bool? _currentStatus;

  final appCubit = Injector.getIt<AppCubit>();

  SelfIdListCubit() : super(const SelfIdListState());

  Future<void> init({bool? status}) async {
    _currentStatus = status;
    emit(
        state.copyWith(isLoading: true, page: 0, cards: [], isLastPage: false));
    await _fetchData(page: 1);
  }

  Future<void> _fetchData({required int page}) async {
    try {
      final response = await _selfIdRepo.getListCardInfo(
        body: ListCardInfoRequest(
            page: page, size: _pageSize, status: _currentStatus),
      );

      if (page == 1 && response.count == 0) {
        appCubit.logout(clearAuth: true);
      }

      final newCards = response.list ?? [];
      final isLast = newCards.length < _pageSize;

      emit(state.copyWith(
        isLoading: false,
        cards: page == 1 ? newCards : [...state.cards, ...newCards],
        page: page,
        isLastPage: isLast,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  changeSelectMode(bool mode) {
    emit(state.copyWith(selectMode: mode, cardsSelected: []));
  }

  selectItem(CardInfoItem item) {
    emit(state.copyWith(
      cardsSelected: state.cardsSelected.contains(item)
          ? state.cardsSelected.where((e) => e.id != item.id).toList()
          : [...state.cardsSelected, item],
    ));
  }

  showDialogDelete() {
    AppUtils.showConfirmDialog(
      context: AppNavigator.context,
      content: S.current.confirmDelete,
      onConfirm: delete,
    );
  }

  delete() async {
    try {
      AppNavigator.pop();
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      await _selfIdRepo.deleteCard(
          ids: state.cardsSelected
              .where((e) => e.id != null)
              .map((e) => e.id!)
              .toList());
      emit(
        state.copyWith(
          isLoading: false,
          selectMode: false,
          cardsSelected: [],
        ),
      );
      _fetchData(page: 1);
      Injector.getIt<AppCubit>().needRefreshHome = true;
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
