import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final _appCubit = Injector.getIt<AppCubit>();
  final relationRepo = Injector.getIt<RelationRepo>();

  final chatController = TextEditingController();
  int idIndex = 0;

  HomeCubit() : super(HomeState());

  Future<void> loadData() async {
    try {
      final loginModel = _appCubit.state.loginModel;
      final token = loginModel?.accessToken;

      if (token == null || token.isEmpty) {
        emit(state.copyWith(isLoading: false, listCards: []));
        return;
      }

      emit(state.copyWith(isLoading: true, messageError: ''));

      final response = await _selfIdRepo.getListCardInfo(
        body: const ListCardInfoRequest(page: 1, size: 10),
      );
      final list = response.list ?? [];
      emit(state.copyWith(
        isLoading: false,
        listCards: list,
      ));
      if (list.firstOrNull?.phoneNumber != null) {
        await getRequesterList(list.first.phoneNumber!);
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, messageError: e.toString(), listCards: []));
    }
  }

  Future<void> getRequesterList(String phoneNumber) async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      final result =
          await relationRepo.getRelationList(phoneNumber: phoneNumber);
      final requesterList = result
          .where((element) => element.status == StatusRelationE.unVerified)
          .toList();
      emit(state.copyWith(isLoading: false, requesterList: requesterList));
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  changeIdIndex(int index) {
    idIndex = index;
  }
}
