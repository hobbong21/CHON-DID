import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/domain/repositories/share_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/services/contract_service.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'verification_cross_state.dart';
part 'verification_cross_cubit.freezed.dart';

class VerificationCrossCubit extends Cubit<VerificationCrossState> {
  late int cardId;

  VerificationCrossCubit() : super(VerificationCrossState());

  final _shareRepo = Injector.getIt<ShareRepo>();
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final relationRepo = Injector.getIt<RelationRepo>();

  List<Contact> contracts = [];

  init(int cardId) async {
    this.cardId = cardId;
    contracts = await ContractService.getContracts();
  }

  Future<void> getRelationUser() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      final results = await Future.wait([
        relationRepo.getRelationList(certOwnerId: cardId),
        _selfIdRepo.getSelfIdDetail(id: cardId),
      ]);
      final relations = (results[0] as List<RelationUserModel>).where((e) {
        return e.certRelatedName?.isNotEmpty == true &&
            e.certRelatedPhone?.isNotEmpty == true;
      }).toList();
      if (relations.length < 4) {
        relations.addAll(
            List.generate(4 - relations.length, (_) => RelationUserModel()));
      }
      final card = results[1] as CardInfoItem;
      emit(state.copyWith(isLoading: false, relations: relations, card: card));
      expandRelation();
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void expandRelation() {
    final relationFilled = state.relations.where((e) =>
        e.certRelatedName?.isNotEmpty == true ||
        e.certRelatedPhone?.isNotEmpty == true ||
        e.relationType != null);
    if (relationFilled.length == state.relations.length) {
      emit(
          state.copyWith(relations: [...state.relations, RelationUserModel()]));
    }
  }

  Future<String?> getLink() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      final res = await _shareRepo.getLink(
        type: LinkTypeE.verify,
        verifyType: VerifyTypeE.selfId.index,
        cardId: cardId,
      );
      emit(state.copyWith(isLoading: false));
      return res;
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      return null;
    }
  }

  onTapSend() async {
    final link = await getLink();
    if (link == null) return;
    SharePlus.instance.share(ShareParams(text: link));
  }

  onTapCopy() async {
    final link = await getLink();
    if (link == null) return;
    Clipboard.setData(ClipboardData(text: link));
    AppUtils.showSnackBarSuccess(
      context: AppNavigator.context,
      title: 'Copied',
    );
  }
}
