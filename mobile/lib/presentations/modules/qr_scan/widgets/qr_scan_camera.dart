import 'dart:async';

import 'package:base_flutter/presentations/modules/qr_scan/cubit/qr_scan_cubit.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanCamera extends StatefulWidget {
  const QrScanCamera({super.key});

  @override
  State<QrScanCamera> createState() => _QrScanCameraState();
}

class _QrScanCameraState extends State<QrScanCamera>
    with WidgetsBindingObserver, RouteAware {
  late final QrScanCubit cubit;
  bool isFocusScreen = true;

  @override
  void initState() {
    super.initState();
    cubit = context.read<QrScanCubit>();
    WidgetsBinding.instance.addObserver(this);

    cubit.startScan();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppNavigator.routeObserver
        .subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cubit.controller.value.error != null) {
      return;
    }
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        if (isFocusScreen) {
          cubit.startScan();
        }
      case AppLifecycleState.inactive:
        cubit.stopScan();
    }
  }

  @override
  void didPush() {
    isFocusScreen = true;
    cubit.startScan();
  }

  @override
  void didPopNext() {
    isFocusScreen = true;
    cubit.startScan();
  }

  @override
  void didPushNext() {
    isFocusScreen = false;
    cubit.stopScan();
  }

  @override
  dispose() async {
    AppNavigator.routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    unawaited(cubit.subscription?.cancel());
    cubit.subscription = null;
    super.dispose();
    await cubit.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(controller: cubit.controller);
  }
}
