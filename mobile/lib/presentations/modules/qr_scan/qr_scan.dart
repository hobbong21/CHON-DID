import 'dart:io';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/qr_scan/cubit/qr_scan_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/image_picker.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import 'widgets/qr_scan_camera.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final cubit = QrScanCubit();
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Header(title: S.current.scanQrCode),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  QrScanCamera(),
                  Positioned(
                    bottom: 12.h,
                    child: ImagePickerCustom(
                      onImageSelected: (file) {
                        scanQrFromFile(file);
                      },
                      builder: (onTap) {
                        return ElevatedButton.icon(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 48.r),
                            backgroundColor: colors.lightYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.r)),
                          ),
                          icon: Assets.icons.gallery.svg(),
                          label: Text(
                            S.current.album,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 150.h,
              child: Text(S.current.qrScanOrUpload),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> scanQrFromFile(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);

    final barcodeScanner = BarcodeScanner(
      formats: [BarcodeFormat.qrCode],
    );

    final barcodes = await barcodeScanner.processImage(inputImage);

    await barcodeScanner.close();
    final data = barcodes.firstOrNull?.rawValue ?? '';
    if (data.isNotEmpty) {
      AppNavigator.push(Routes.qrScanSuccess, data);
    }
    return data;
  }
}
