import 'dart:async';
import 'dart:convert';

import 'package:base_flutter/app.dart';
import 'package:base_flutter/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyCrash = 'crash';

Future<void> bootstrap({
  AsyncCallback? initialization,
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(const Duration(milliseconds: 50));

    // Bắt lỗi Flutter framework / UI (không gây crash)
    FlutterError.onError = (FlutterErrorDetails details) {
      // catchUnhandledExceptions(details.exception, details.stack);
    };

    // Bắt lỗi platform / isolate
    PlatformDispatcher.instance.onError = (error, stack) {
      catchUnhandledExceptions(error, stack);
      return true;
    };

    await initialization?.call();
    await flavorConfiguration?.call();

    await Injector.init();
    runApp(const App());
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  // FireBaseCrashlytics.instance.recordError(error, stack, fatal: true);
  if (error is Error) {
    debugPrint('-----------------> CRASH <------------------');
    _saveCrashLocally(error, stack);
  }
  debugPrintStack(stackTrace: stack, label: error.toString());
}

void _saveCrashLocally(Object error, StackTrace? stack) {
  try {
    SharedPreferences.getInstance().then((prefs) {
      final now = DateTime.now().toIso8601String();

      final crash = {
        'time': now,
        'error': error.toString(),
        'stack': stack?.toString().split('\n').take(20).join('\n'),
      };

      prefs.setString(
        keyCrash,
        jsonEncode(crash),
      );
    });
  } catch (_) {}
}
