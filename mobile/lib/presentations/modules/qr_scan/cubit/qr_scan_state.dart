part of 'qr_scan_cubit.dart';

@freezed
abstract class QrScanState with _$QrScanState {
  factory QrScanState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    @Default(false) showData,
    @Default('') String data,
  }) = _QrScanState;
}
