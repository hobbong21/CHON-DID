part of 'ocr_id_cubit.dart';

@freezed
abstract class OcrIdState with _$OcrIdState {
  factory OcrIdState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(OcrType.identityCard) OcrType? ocrType,
    File? image,
    File? croppedImage,
  }) = _OcrIdState;
}

enum OcrType {
  identityCard,
  driverLicense,
  passport,
  other,
}

extension OcrTypeExtension on OcrType {
  String get displayName {
    switch (this) {
      case OcrType.identityCard:
        return S.current.identityCard;
      case OcrType.driverLicense:
        return S.current.driverLicense;
      case OcrType.passport:
        return S.current.passport;
      case OcrType.other:
        return S.current.other;
    }
  }
}
