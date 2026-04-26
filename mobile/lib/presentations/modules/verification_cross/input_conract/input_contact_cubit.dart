import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/data/models/family/relation_model.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/verification_cross/cubit/verification_cross_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/services/contract_service.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_contact_state.dart';
part 'input_contact_cubit.freezed.dart';

class InputContactCubit extends Cubit<InputContactState> {
  final VerificationCrossCubit vcCubit;

  InputContactCubit(
    RelationUserModel relation,
    this.vcCubit,
  ) : super(InputContactState(relation: relation));
  List<Contact> searchContracts = [];
  final nameController = TextEditingController();
  final relationRepo = Injector.getIt<RelationRepo>();

  bool get isValid =>
      state.relation.certRelatedName?.trim().isNotEmpty == true &&
      state.relation.certRelatedPhone?.trim().isNotEmpty == true &&
      state.relation.relationType != null;

  Future<void> updateRelation() async {
    try {
      if (state.relation.id == null ||
          (state.relation.certRelatedName?.isEmpty ?? true) ||
          (state.relation.certRelatedPhone?.isEmpty ?? true) ||
          (state.relation.relationType == null)) {
        return;
      }
      emit(state.copyWith(errorMessage: ''));
      await relationRepo.updateRelation(
        id: state.relation.id,
        certRelatedName: state.relation.certRelatedName,
        certRelatedPhone:
            _normalizePhoneNumber(state.relation.certRelatedPhone),
      );
      vcCubit.getRelationUser();
    } catch (e) {
      nameController.clear();
      emit(state.copyWith(
          errorMessage: e.toString(),
          relation: state.relation.copyWith(
            certRelatedName: '',
            certRelatedPhone: '',
          )));
    }
  }

  Future<void> resetOldRelation() async {
    try {
      if (state.relation.id == null) {
        return;
      }
      emit(state.copyWith(errorMessage: ''));
      await relationRepo.updateRelation(
        id: state.relation.id,
        certRelatedName: '',
        certRelatedPhone: '',
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  searchContract(List<Contact> contracts) async {
    if (state.relation.certRelatedName?.trim().isEmpty ?? true) return;
    emit(state.copyWith(isLoading: true));
    if (contracts.isEmpty) {
      contracts = await ContractService.getContracts();
    }
    searchContracts = contracts
        .where((e) =>
            e.displayName.toLowerCase().contains(
                state.relation.certRelatedName?.toLowerCase() ?? '') &&
            e.phones.isNotEmpty)
        .toList();
    if (searchContracts.length > 1) {
      emit(
        state.copyWith(
          relation: state.relation.copyWith(certRelatedPhone: ''),
        ),
      );
    } else if (searchContracts.length == 1) {
      updatePhoneNumber(searchContracts.first.phones[0].number);
    } else {
      updatePhoneNumber('');
    }
    emit(state.copyWith(isLoading: false));
  }

  void updateName(String name) {
    emit(
      state.copyWith(
        relation: state.relation.copyWith(
          certRelatedName: name,
        ),
      ),
    );
  }

  void updatePhoneNumber(String phoneNumber) {
    searchContracts = [];
    emit(
      state.copyWith(
        relation: state.relation.copyWith(certRelatedPhone: phoneNumber),
      ),
    );
    updateRelation();
  }

  void updateRelationship(int id, RelationType relationType) {
    if (state.relation.status != StatusRelationE.unVerified) {
      AppUtils.showSnackBarError(
          context: AppNavigator.context, title: S.current.updateFailed);
      return;
    }
    if (id != state.relation.id) {
      resetOldRelation();
    }
    emit(
      state.copyWith(
        relation: state.relation.copyWith(
          id: id,
          relationType: relationType,
        ),
      ),
    );
    updateRelation();
  }

  String? _normalizePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) return phone;

    final userPhone = vcCubit.state.card?.phoneNumber;

    final cleanedPhone = phone.replaceAll(RegExp(r'[ \-_.]'), '');

    if (userPhone == null || !userPhone.startsWith('+')) {
      return cleanedPhone;
    }

    final countryCodes =
        LanguageSetting.values.map((e) => e.phoneCode).toList();
    final countryCode =
        countryCodes.where((e) => userPhone.startsWith(e)).firstOrNull;

    if (cleanedPhone.startsWith('0') && countryCode != null) {
      return '$countryCode${cleanedPhone.substring(1)}';
    }

    return cleanedPhone;
  }

  clearMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}
