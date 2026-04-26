import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:base_flutter/core/utils/datetime_utils.dart';

class Log {
  static void d(String message) {
    if (kDebugMode) {
      log('\x1B[34m${DateTimeUtils.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      log('\x1B[32m${DateTimeUtils.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void w(String message) {
    if (kDebugMode) {
      log('\x1B[33m${DateTimeUtils.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void e(String message) {
    if (kDebugMode) {
      log('\x1B[31m${DateTimeUtils.timePrint()}:\t$message\x1B[0m');
    }
  }
}
