import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/utils/exception.dart';
import 'package:base_flutter/data/models/self_id/ocr_model.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/resolve_passport_data.dart';
import 'package:base_flutter/presentations/widgets/item.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image/image.dart' as img;

import 'resolve_korean_data.dart';

part 'ocr_id_state.dart';
part 'ocr_id_cubit.freezed.dart';

class OcrIdCubit extends Cubit<OcrIdState> {
  OcrIdCubit() : super(OcrIdState());

  final ocrRepo = Injector.getIt<OcrRepo>();

  CameraController? controller;

  void init(OcrType type) {
    emit(state.copyWith(ocrType: type));
  }

  Future<void> initCamera() async {
    if (Platform.isAndroid) {
      final isGranted = await requestCameraPermission();

      if (!isGranted) {
        AppUtils.showConfirmDialog(
          context: AppNavigator.context,
          content: S.current.cameraPermissionRequired,
          onConfirm: () {
            openAppSettings();
          },
        );
        return;
      }
    }

    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    final firstCamera = cameras.firstWhere(
        (e) => e.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first);

    emit(state.copyWith(isLoading: true));

    controller = CameraController(
      firstCamera,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await controller!.initialize();
    emit(state.copyWith(isLoading: false));
  }

  Future<bool> requestCameraPermission() async {
    final permissionStatus = await Permission.camera.status;
    if (!permissionStatus.isGranted) {
      final res = await Permission.camera.request();
      if (!res.isGranted) {
        return false;
      }
    }
    return true;
  }

  Future<void> capture(BuildContext context) async {
    if (controller == null || !controller!.value.isInitialized) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: S.current.cameraNotInitialized,
      ));
      return;
    }

    if (controller!.value.isTakingPicture) return;

    try {
      emit(state.copyWith(
        isLoading: true,
        image: null,
        croppedImage: null,
        errorMessage: '',
      ));

      final XFile xFile = await controller!.takePicture();

      final originalFile = File(xFile.path);

      final croppedImage = await cropImageByHole(
        originalFile: originalFile,
        controller: controller!,
        context: AppNavigator.context,
      );

      emit(state.copyWith(
        image: originalFile,
        croppedImage: croppedImage,
        isLoading: false,
      ));

      controller!.dispose();
      controller = null;

      if (state.croppedImage != null) {
        generalOcr(state.croppedImage!);
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> generalOcr(File file) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      final secretKey = '${dotenv.env['OCR_SECRET']}';

      final fileName = _getFileName(file);
      final format = _getFormat(file);
      final messageObj = OcrMessage(
        version: 'V2',
        requestId: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now().millisecondsSinceEpoch,
        images: [
          OcrImageMessage(
            format: format,
            name: fileName,
          ),
        ],
      );
      final messageString = jsonEncode(messageObj.toJson());
      late KoreanIdCard card;
      switch (state.ocrType) {
        case OcrType.identityCard:
        case OcrType.driverLicense:
        case OcrType.other:
          card = await ocrIdCard(
            secretKey: secretKey,
            file: file,
            messageString: messageString,
          );
          break;
        case OcrType.passport:
          card = await ocrPassport(
            secretKey: secretKey,
            file: file,
            messageString: messageString,
          );
          break;
        default:
          throw StringException('Ocr type is required');
      }
      emit(state.copyWith(isLoading: false));
      AppNavigator.push(Routes.selfIdCreater, card);
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<KoreanIdCard> ocrIdCard({
    required String secretKey,
    required File file,
    required String messageString,
  }) async {
    final res = await ocrRepo.idCardOcr(
      secretKey: secretKey,
      file: file,
      message: messageString,
    );
    if (res.images.firstOrNull?.idCard?.result?.ic != null) {
      return ResolveKoreanData.parseByIdCard(
          res.images.firstOrNull!.idCard!.result!.ic!);
    } else if (res.images.firstOrNull?.idCard?.result?.dl != null) {
      return ResolveKoreanData.parseByDriverLicense(
          res.images.firstOrNull!.idCard!.result!.dl!);
    } else {
      throw StringException('Ocr failed');
    }
  }

  Future<KoreanIdCard> ocrPassport({
    required String secretKey,
    required File file,
    required String messageString,
  }) async {
    final res = await ocrRepo.passportOcr(
      secretKey: secretKey,
      file: file,
      message: messageString,
    );
    if (res.images.firstOrNull?.passport != null) {
      return ResolveKoreanDataPassport.parsePassport(
          res.images.firstOrNull!.passport!);
    } else {
      throw StringException('Ocr failed');
    }
  }

  Future<File> cropImageByHole({
    required File originalFile,
    required CameraController controller,
    required BuildContext context,
  }) async {
    final bytes = await originalFile.readAsBytes();
    final originalImage = img.decodeImage(bytes)!;

    final imageWidth = originalImage.width;
    final imageHeight = originalImage.height;

    final previewSize = controller.value.previewSize!;
    final screenSize = MediaQuery.of(context).size;

    final holeRect = getHoleRect(screenSize);

    final scaleX = screenSize.width / previewSize.height;
    final scaleY = screenSize.height / previewSize.width;
    final scale = max(scaleX, scaleY);

    final displayedWidth = previewSize.height * scale;
    final displayedHeight = previewSize.width * scale;

    final dx = (displayedWidth - screenSize.width) / 2;
    final dy = (displayedHeight - screenSize.height) / 2;

    final rectInPreview = Rect.fromLTWH(
      (holeRect.left + dx) / scale,
      (holeRect.top + dy) / scale,
      holeRect.width / scale,
      holeRect.height / scale,
    );

    final cropRect = Rect.fromLTWH(
      rectInPreview.left * imageWidth / previewSize.height,
      rectInPreview.top * imageHeight / previewSize.width,
      rectInPreview.width * imageWidth / previewSize.height,
      rectInPreview.height * imageHeight / previewSize.width,
    );

    final cropped = img.copyCrop(
      originalImage,
      x: cropRect.left.round(),
      y: cropRect.top.round(),
      width: cropRect.width.round(),
      height: cropRect.height.round(),
    );

    final croppedFile = File(
      originalFile.path.replaceFirst('.jpg', '_crop.jpg'),
    );

    await croppedFile.writeAsBytes(img.encodeJpg(cropped, quality: 95));
    return croppedFile;
  }

  static Rect getHoleRect(Size screenSize) {
    final double w = min(400.0.w, screenSize.width - 32.w);
    final double h = w * 3 / 4;

    return Rect.fromCenter(
      center: Offset(screenSize.width / 2, screenSize.height / 2),
      width: w,
      height: h,
    );
  }

  String _getFormat(File file) {
    final ext = file.path.split('.').last.toLowerCase();
    if (ext == 'jpeg') return 'jpg';
    return ext;
  }

  String _getFileName(File file) {
    return file.path.split('/').last;
  }

  clearImage() {
    emit(state.copyWith(image: null, croppedImage: null));
    initCamera();
  }

  clearMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}
