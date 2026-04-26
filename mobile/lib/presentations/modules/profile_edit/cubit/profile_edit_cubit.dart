import 'dart:io';

import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/data/models/self_id/list_card_info_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.dart';
part 'profile_edit_cubit.freezed.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(ProfileEditState());

  final _selfIdRepo = Injector.getIt<SelfIdRepo>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final imageController = TextEditingController();

  Future<void> update(CardInfoItem? card) async {
    if (card == null) return;
    if (formKey.currentState?.validate() == false) return;
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));

      await _selfIdRepo.updateSelfId(
        selfidModel: CreateCardRequest(
          cardId: card.id,
          address: card.address,
          idNumber: card.idNumber,
          issuedDate: card.issuedDate,
          issuingAuthority: card.issuingAuthority,
          imgBase64:
              imageController.text.isNotEmpty ? imageController.text : null,
          name: [nameController.text, surnameController.text]
              .where((e) => e.trim().isNotEmpty)
              .join(' '),
          phoneNumber: card.phoneNumber,
        ),
      );
      emit(state.copyWith(isLoading: false));
      AppUtils.showSnackBarSuccess(
          context: AppNavigator.context, title: 'Success');
      AppNavigator.pop(true);
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  void fileToBase64(File file) {
    imageController.text = AppUtils.fileToBase64(file);
  }
}
