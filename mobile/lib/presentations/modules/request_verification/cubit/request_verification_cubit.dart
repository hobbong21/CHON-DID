import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/share_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/verification_finish/verification_finish_page.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart'; // Import model CardInfoItem
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verification_state.dart';
part 'request_verification_cubit.freezed.dart';

class RequestVerificationCubit extends Cubit<RequestVerificationState> {
  final _repo = Injector.getIt<SelfIdRepo>();
  final _shareRepo = Injector.getIt<ShareRepo>();
  final _verifyRepo = Injector.getIt<VerifyRepo>();
  String? token;

  RequestVerificationCubit() : super(const RequestVerificationState());

  Future<void> init(int cardId) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final data = await _repo.getSelfIdDetail(id: cardId);
      emit(state.copyWith(isLoading: false, card: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> initByToken(String? token) async {
    if (token == null) return;
    this.token = token;
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final data = await _verifyRepo.getCardInfoVerify(token: token);
      emit(state.copyWith(isLoading: false, card: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<String?> getLink() async {
    if (state.card?.id == null) {
      return null;
    }
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      final res = await _shareRepo.getLink(
        type: LinkTypeE.info,
        verifyType: VerifyTypeE.selfId.index,
        cardId: state.card!.id!,
      );
      emit(state.copyWith(isLoading: false));
      return res;
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      return null;
    }
  }

  Future<void> verify() async {
    if (token == null) return;
    emit(state.copyWith(isLoadingBlock: true, errorMessage: ''));
    try {
      final datas = await Future.wait([
        _verifyRepo.verifyDid(token: token!),
        Future.delayed(const Duration(seconds: 1)),
      ]);
      final data = datas[0] as CardInfoItem;
      emit(state.copyWith(isLoadingBlock: false));
      AppNavigator.push(Routes.verificationFinish, {
        'type': VerificationFinishType.verify,
        'txId': data.txId ?? '',
      });
    } catch (e) {
      emit(state.copyWith(isLoadingBlock: false, errorMessage: e.toString()));
    }
  }

  onTapCopy() async {
    final link = await getLink();
    if (link == null) return;
    Clipboard.setData(ClipboardData(text: link));
    AppUtils.showSnackBarSuccess(
      context: AppNavigator.context,
      title: S.current.copied,
    );
  }
}
