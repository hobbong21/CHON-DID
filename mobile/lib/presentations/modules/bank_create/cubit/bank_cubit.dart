import 'package:base_flutter/data/models/bank/bank_info_model.dart';
import 'package:base_flutter/data/models/bank/bank_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/bank_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_state.dart';
part 'bank_cubit.freezed.dart';

class BankCubit extends Cubit<BankState> {
  final _bankRepo = Injector.getIt<BankRepo>();
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();

  final accountController = TextEditingController();

  int? _currentRefBank;

  BankCubit() : super(const BankState());

  void init(int refBank) {
    _currentRefBank = refBank;
    getCards();
  }

  Future<void> createBank() async {
    final account = accountController.text.trim();

    if (account.isEmpty) {
      emit(state.copyWith(
          errorMessage: S.current.VALIDATE_BANK_ACCOUNT_NOT_NULL));
      return;
    }

    if (_currentRefBank == null) {
      emit(state.copyWith(
          errorMessage: S.current.VALIDATE_BANK_REF_BANK_NOT_NULL));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      await _bankRepo.addBank(
        refBank: _currentRefBank!,
        account: account,
      );
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> getCards() async {
    try {
      final listCardRes = await _selfIdRepo.getListCardInfo(
        body: const ListCardInfoRequest(page: 1, size: 10),
      );
      emit(state.copyWith(listCards: listCardRes.list ?? []));
    } catch (e) {}
  }

  Future<void> getList() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final data = await _bankRepo.getBank();
      emit(state.copyWith(isLoading: false, bankInfo: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    accountController.dispose();
    return super.close();
  }
}
