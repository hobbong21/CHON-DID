import 'dart:async';
import 'dart:ui';

import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

part 'qr_scan_state.dart';
part 'qr_scan_cubit.freezed.dart';

class QrScanCubit extends Cubit<QrScanState> {
  QrScanCubit() : super(QrScanState());

  final MobileScannerController controller = MobileScannerController(
      // required options for the scanner
      );

  StreamSubscription<Object?>? subscription;

  void startScan() {
    unawaited(subscription?.cancel());
    subscription = controller.barcodes.listen(detectQr);
    unawaited(controller.start());
  }

  void stopScan() {
    unawaited(subscription?.cancel());
    subscription = null;
    unawaited(controller.stop());
  }

  void detectQr(BarcodeCapture event) {
    final raw = event.raw;
    if (raw != null) {
      final data = event.barcodes.first.rawValue;
      stopScan();
      AppNavigator.push(Routes.qrScanSuccess, data);
      // checkData(data ?? '');
    }
  }

  checkData(String data) {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, messageError: ''));
    final serverUrl = F.baseUrl;
    if (data.startsWith(serverUrl)) {
      onTapUrl(data);
      emit(state.copyWith(isLoading: false));
      return;
    }
    bool isSignatureValid = false;
    QrSignatureHandler.handle(
      data,
      onSuccess: () {
        isSignatureValid = true;
        stopScan();
      },
      onError: () {
        emit(state.copyWith(
          isLoading: false,
          messageError: S.current.error,
        ));
      },
    );
    emit(state.copyWith(
      isLoading: false,
      showData: !isSignatureValid,
      data: data,
    ));
  }

  Future<void> onTapUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (true) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {}
  }
}

enum PrefixData {
  CHONCARD('CHONCARD'),
  CHONCLAN('CHONCLAN'),
  CHONTEAK('CHONTEAK'),
  CHONEVENT('CHONEVENT'),
  ;

  const PrefixData(this.name);

  final String name;
}

class QrSignatureHandler {
  static handle(String data,
      {VoidCallback? onSuccess, VoidCallback? onError}) async {
    final split = data.split('\\');
    final prifix = split[0];
    if (PrefixData.values.any((element) => element.name == prifix)) {
      try {
        final rawData = split[1];
        final signature = split[2];
        final publicKey = split[3];
        final verifyscroce = split[4];
        final imgPath = split.elementAtOrNull(5);
        final txId = split.elementAtOrNull(6);
        final blockHeght = split.elementAtOrNull(7);
        // Routes route;
        // if (prifix == PrefixData.CHONCARD.name) {
        //   route = Routes.selfIdVerifier;
        // } else if (prifix == PrefixData.CHONCLAN.name) {
        //   route = Routes.clanVerify;
        // } else if (prifix == PrefixData.CHONTEAK.name) {
        //   route = Routes.taekwondoVerify;
        // } else if (prifix == PrefixData.CHONEVENT.name) {
        //   route = Routes.entrance;
        // } else {
        //   return;
        // }
        onSuccess?.call();
        AppNavigator.push(Routes.chat, {
          'rawData': rawData,
          'signature': signature,
          'publicKey': publicKey,
          'verifyscroce': verifyscroce,
          'imgPath': imgPath,
          'txId': txId,
          'blockHeght': blockHeght,
        });
      } catch (e) {
        onError?.call();
        return;
      }
    }
  }
}
