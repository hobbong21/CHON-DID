import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class AppUtils {
  static OverlayEntry? _overlayEntry;

  ///close snackBar
  static void closeSnackBar(BuildContext context) => _overlayEntry?.remove();

  static void showSnackBar({
    EdgeInsetsGeometry? margin,
    required BuildContext context,
    required String title,
    Duration? duration,
    Widget? icon,
    DismissDirection? dismissDirection,
    Color? backgroundColor,
    Color? color,
  }) async {
    _overlayEntry?.remove();

    final theme = Theme.of(context);
    final textStyle =
        theme.textTheme.titleMedium?.copyWith(color: color ?? Colors.white);

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 24.h,
        left: 24.w,
        right: 24.w,
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    if (icon != null) ...[
                      icon,
                      SizedBox(width: 12.w),
                    ],
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(0, 0),
                        child: Text(
                          title,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Navigator.of(context, rootNavigator: true).overlay!.insert(_overlayEntry!);

    Future.delayed(Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  static void showSnackBarError({
    required BuildContext context,
    required String title,
  }) {
    showSnackBar(
        context: context,
        title: title,
        icon: Icon(Icons.error, color: Colors.redAccent),
        backgroundColor: Color(0xff333333));
  }

  static void showSnackBarSuccess({
    required BuildContext context,
    required String title,
  }) {
    showSnackBar(
      context: context,
      title: title,
      icon: Icon(Icons.check_circle_sharp, color: Colors.white),
      backgroundColor: Colors.lightGreen,
    );
  }

  static void showSnackBarWarning({
    required BuildContext context,
    required String title,
  }) {
    showSnackBar(
        context: context,
        title: title,
        icon: Icon(Icons.warning, color: Colors.yellowAccent));
  }

  static Future<void> showConfirmDialog({
    required BuildContext context,
    String? title,
    String content = '',
    VoidCallback? onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? S.current.confirm),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(S.current.cancel)),
            TextButton(onPressed: onConfirm, child: Text(S.current.action_ok)),
          ],
        );
      },
    );
  }

  static Future<File> uint8ListToFile(Uint8List data, String filename) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');

    return await file.writeAsBytes(data);
  }

  static Future<void> clearCacheImage(String filename) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    FileImage(file).evict(); // xoá cache của Image.file
  }

  static String buildBase64WithHeader(String base64Str) {
    if (base64Str.startsWith('data:')) return base64Str;
    try {
      Uint8List bytes = base64Decode(base64Str);
      String? mimeType = lookupMimeType('', headerBytes: bytes);
      mimeType ??= 'application/octet-stream';
      return 'data:$mimeType;base64,$base64Str';
    } catch (e) {
      debugPrint('Lỗi khi decode base64: $e');
      return base64Str;
    }
  }

  static String fileToBase64(File file) {
    try {
      Uint8List bytes = file.readAsBytesSync();
      String? mimeType = lookupMimeType('', headerBytes: bytes);
      mimeType ??= 'application/octet-stream';
      String dataBase64 = base64Encode(file.readAsBytesSync());
      return 'data:$mimeType;base64,$dataBase64';
    } catch (e) {
      debugPrint('Error reading file: $e');
      return '';
    }
  }
}
