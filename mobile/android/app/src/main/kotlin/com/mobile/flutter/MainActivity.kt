package com.mobile.flutter

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun shouldHandleDeeplinking(): Boolean {
        // KHÔNG cho Flutter tự convert deeplink thành route
        return false
    }
}
