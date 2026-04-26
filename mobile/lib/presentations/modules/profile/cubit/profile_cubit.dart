import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final _appCubit = Injector.getIt<AppCubit>();

  Future<void> loadData([int? cardId]) async {
    try {
      final loginModel = _appCubit.state.loginModel;
      final token = loginModel?.accessToken;

      if (token == null || token.isEmpty) {
        emit(state.copyWith(isLoading: false, firstCard: null));
        return;
      }

      emit(state.copyWith(isLoading: true, messageError: ''));

      final response = await _selfIdRepo.getListCardInfo(
        body: const ListCardInfoRequest(page: 1, size: 10),
      );
      final list = response.list ?? [];
      final card = list.where((e) => e.id == cardId).firstOrNull ?? list.first;
      emit(state.copyWith(isLoading: false, firstCard: card));
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }
}
