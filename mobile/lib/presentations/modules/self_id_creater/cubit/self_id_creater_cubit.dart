import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/utils/datetime_utils.dart';
import 'package:base_flutter/data/models/auth/login_model.dart';
import 'package:base_flutter/data/models/self_id/create_card_model.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_korean_data.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'dart:convert';
import 'dart:io';

part 'self_id_creater_state.dart';
part 'self_id_creater_cubit.freezed.dart';

class SelfIdCreaterCubit extends Cubit<SelfIdCreaterState> {
  final _selfIdRepo = Injector.getIt<SelfIdRepo>();
  final appCubit = Injector.getIt<AppCubit>();
  SelfIdCreaterCubit() : super(const SelfIdCreaterState());

  final nameController = TextEditingController();
  final idPart1Controller = TextEditingController();
  final idPart2Controller = TextEditingController();
  final addressController = TextEditingController();
  final issuerController = TextEditingController();
  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  // driver license specific
  final licenseNumberController = TextEditingController();
  final licenseValidityController = TextEditingController();
  // passport specific
  final genderController = TextEditingController();
  final expirationDateController = TextEditingController();
  String? dateOfBirth;

  GenderCardE? gender;
  IdType? cardType;
  bool get isPassport => cardType == IdType.passport;
  bool get isDriverLicense => cardType == IdType.driver;

  String? get currentAccessToken => appCubit.state.loginModel?.accessToken;

  void init(KoreanIdCard? card) {
    countryController.text =
        LanguageSetting.values.byName(appCubit.state.locale).phoneCode;
    if (card != null) {
      final rrn = card.rrn?.split('-');
      nameController.text = card.name ?? '';
      idPart1Controller.text = rrn?.isNotEmpty == true ? rrn!.first : '';
      idPart2Controller.text = (rrn?.length ?? 0) > 1 ? rrn![1] : '';
      addressController.text = card.address ?? '';
      issuerController.text = card.issuer ?? '';
      dateController.text =
          DateTimeUtils.convertDateToString(card.issueDate, 'yyyy.MM.dd');
      cardType = card.idType;
      if (isDriverLicense) {
        licenseNumberController.text = card.licenseNumber ?? '';
        licenseValidityController.text = card.licenseValidity ?? '';
      } else if (isPassport) {
        expirationDateController.text = DateTimeUtils.convertDateToString(
            card.expirationDate, 'yyyy.MM.dd');
        dateOfBirth = card.dateOfBirth?.toIso8601String();
      }
      gender = card.gender;
    }
  }

  void onImageSelected(File file) =>
      emit(state.copyWith(selectedFile: file, errorMessage: ''));

  Future<void> createCard() async {
    emit(state.copyWith(errorMessage: ''));
    final error = _validateForm();
    if (error != null) {
      emit(state.copyWith(errorMessage: error));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      final base64Img = await _processImage(state.selectedFile!);

      final fullId =
          '${idPart1Controller.text.trim()}${idPart2Controller.text.trim()}';

      final phoneCode = countryController.text;
      final phoneNumber =
          '$phoneCode ${phoneController.text.trim().replaceFirst(RegExp(r'^0+'), '').replaceAll(RegExp(r'[^0-9]'), '')}';

      final responseData = await _selfIdRepo.createCard(
        body: CreateCardRequest(
          name: nameController.text.trim(),
          idNumber: fullId,
          address: addressController.text.trim(),
          issuingAuthority: issuerController.text.trim(),
          issuedDate: dateController.text.trim().replaceAll('.', '-'),
          gender: gender ?? getGenderFromRRN(),
          phoneNumber:
              (currentAccessToken?.isEmpty ?? true) ? phoneNumber : null,
          imgBase64: base64Img,
          licenseNumber:
              isDriverLicense ? licenseNumberController.text.trim() : null,
          licenseValidity:
              isDriverLicense ? licenseValidityController.text.trim() : null,
          expirationDatePassport:
              isPassport ? expirationDateController.text.trim() : null,
          dateOfBirth: isPassport ? dateOfBirth : null,
        ),
      );
      if (responseData.accessToken != null &&
          responseData.accessToken!.isNotEmpty) {
        await appCubit
            .setLoginModel(LoginModel(accessToken: responseData.accessToken));
      } else {
        print("⚠️ Không có Token mới (Dùng lại Token cũ)");
      }

      if (responseData.cardId != null) {
        appCubit.needRefreshHome = true;
        await _initFamily(responseData.cardId!);
        emit(state.copyWith(
            isLoading: false, createdCardId: responseData.cardId));
        await AppNavigator.push(Routes.selfIdCreaterSuccess, {
          'cardId': responseData.cardId,
        });
        // if (!isClosed) {
        //    resetForm();
        // }
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: S.current.AN_ERROR_HAS_OCCURRED));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  GenderCardE? getGenderFromRRN() {
    if (idPart2Controller.text.isEmpty) return null;
    final genderCode = idPart2Controller.text[0];

    switch (genderCode) {
      case '1':
      case '3':
      case '5':
      case '7':
        return GenderCardE.male;

      case '2':
      case '4':
      case '6':
      case '8':
        return GenderCardE.female;

      default:
        return GenderCardE.male;
    }
  }

  Future<void> _initFamily(int cardId) async {
    try {
      final res = await _selfIdRepo.initRelationList(cardId: cardId);
    } catch (e) {}
  }

  String? _validateForm() {
    if (nameController.text.isEmpty ||
        ((currentAccessToken?.isEmpty ?? true) &&
            phoneController.text.isEmpty) ||
        idPart1Controller.text.isEmpty ||
        (idPart2Controller.text.isEmpty && !isPassport)) {
      return S.current.fillAllRequiredFields;
    }

    if (state.selectedFile == null) return S.current.selectPortraitPhoto;

    final part1 = idPart1Controller.text.trim();
    final part2 = idPart2Controller.text.trim();

    if (!isPassport) {
      if (part1.length != 6) {
        return S.current.residentNumberFirstPartInvalid;
      }
      if (part2.length != 7) {
        return S.current.residentNumberSecondPartInvalid;
      }
    }

    // final phoneText = phoneController.text.trim();
    // final phoneRegex = RegExp(r'^(\+|0)[0-9\s-]{8,15}$');

    // if (!phoneRegex.hasMatch(phoneText)) {
    //   return 'Số điện thoại không hợp lệ (VD: 010 1234 5678 hoặc +82...)';
    // }

    return null;
  }

  Future<String> _processImage(File file) async {
    if (!await file.exists()) throw Exception("File ảnh không tồn tại");

    final length = await file.length();
    if (length == 0)
      throw Exception(
          "File ảnh bị lỗi (Dung lượng 0 byte). Vui lòng chọn ảnh khác.");

    final bytes = await file.readAsBytes();

    final image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception("Định dạng ảnh không được hỗ trợ hoặc file bị hỏng.");
    }

    final resized =
        image.width > 800 ? img.copyResize(image, width: 800) : image;
    final compressed = img.encodeJpg(resized, quality: 80);

    return 'data:image/jpeg;base64,${base64Encode(compressed)}';
  }

  @override
  Future<void> close() {
    nameController.dispose();
    idPart1Controller.dispose();
    idPart2Controller.dispose();
    addressController.dispose();
    issuerController.dispose();
    dateController.dispose();
    phoneController.dispose();
    return super.close();
  }

  // void resetForm() {
  //   if (isClosed) return;
  //   nameController.clear();
  //   idPart1Controller.clear();
  //   idPart2Controller.clear();
  //   addressController.clear();
  //   issuerController.clear();
  //   dateController.clear();
  //   phoneController.clear();

  //   emit(state.copyWith(
  //     selectedFile: null,
  //     errorMessage: '',
  //     resetKey: state.resetKey + 1,
  //     createdCardId: null,
  //   ));
  // }
}
