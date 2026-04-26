import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/share_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'requester_list_state.dart';
part 'requester_list_cubit.freezed.dart';

class RequesterListCubit extends Cubit<RequesterListState> {
  RequesterListCubit() : super(RequesterListState());

  final relationRepo = Injector.getIt<RelationRepo>();
  final _shareRepo = Injector.getIt<ShareRepo>();

  String? _phone;

  Future<void> getRequesterList(String phoneNumber) async {
    try {
      _phone = phoneNumber;
      emit(state.copyWith(isLoading: true, messageError: ''));
      final result =
          await relationRepo.getListRequester(phoneNumber: phoneNumber);
      final requesterList = result
          .where((element) => element.status == StatusRelationE.unVerified)
          .toList();
      emit(state.copyWith(isLoading: false, requesterList: requesterList));
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  Future<String?> getLinkAndRedirect(int cardId) async {
    if (_phone == null) return null;
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      final res = await _shareRepo.getLink(
        type: LinkTypeE.verify,
        verifyType: VerifyTypeE.selfId.index,
        cardId: cardId,
      );
      emit(state.copyWith(isLoading: false));
      final params = res.split('?').last;
      final token = params
          .split('&')
          .firstWhere((element) => element.startsWith('token='))
          .split('=')
          .last;
      AppNavigator.push(Routes.confirmRelationship, token);
      return res;
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
      return null;
    }
  }
}
