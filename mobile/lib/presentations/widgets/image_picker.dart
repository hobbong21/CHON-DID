import 'dart:io';
import 'dart:math';

import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerCustom extends StatefulWidget {
  final String? initUrl;
  final bool enabled;
  final Function(File file)? onImageSelected;
  final double? height;
  final double? width;
  final Widget Function(VoidCallback onTap)? builder;
  const ImagePickerCustom({
    super.key,
    this.initUrl,
    this.onImageSelected,
    this.enabled = true,
    this.height,
    this.width,
    this.builder,
  });

  @override
  State<ImagePickerCustom> createState() => _ImagePickerCustomState();
}

class _ImagePickerCustomState extends State<ImagePickerCustom> {
  final _picker = ImagePicker();
  File? imageSelected;

  @override
  void initState() {
    super.initState();
    // imageSelected = widget.imagePath != null ? File(widget.imagePath!) : null;
  }

  @override
  void didUpdateWidget(covariant ImagePickerCustom oldWidget) {
    if (oldWidget.initUrl != widget.initUrl) {
      imageSelected = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<PermissionStatus> requestPermissionAndroid() async {
    final androidDeviceInfo = Injector.getIt<AndroidDeviceInfo>();
    if (androidDeviceInfo.version.sdkInt < 33) {
      return Permission.storage.request();
    }
    return Permission.photos.request();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageSelected = File(image.path);
        widget.onImageSelected?.call(imageSelected!);
        setState(() {});
      }
    } catch (e) {
      openAppSettings();
    }
  }

  onTap() async {
    if (Platform.isAndroid) {
      final status = await requestPermissionAndroid();
      if (status.isGranted) {
        pickImageFromGallery();
      } else if (status.isDenied) {
        // Nếu quyền bị từ chối, yêu cầu lại quyền
        // final result = await requestPermissionAndroid();
        // if (result.isGranted) {
        //   pickImageFromGallery();
        // }
      } else if (status.isPermanentlyDenied) {
        // Nếu quyền bị từ chối vĩnh viễn, mở cài đặt ứng dụng
        openAppSettings();
      }
    } else {
      pickImageFromGallery();
    }
  }

  void viewImage() {
    if (imageSelected != null || widget.initUrl != null) {
      AppNavigator.push(
          Routes.imageView, {'image': imageSelected?.path ?? widget.initUrl});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return widget.builder!(onTap);
    }
    final colors = context.colors;
    final sizeIcon = min(widget.height ?? 180, widget.width ?? 180) * 0.5;
    return InkWell(
      onTap: widget.enabled ? onTap : viewImage,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: widget.height ?? 180,
        width: widget.width ?? 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        clipBehavior: Clip.antiAlias,
        child: imageSelected != null
            ? Image.file(
                imageSelected!,
                height: widget.height ?? 180,
                width: widget.width ?? 180,
                fit: BoxFit.cover,
              )
            : widget.initUrl != null
                ? Image.network(
                    widget.initUrl!,
                    height: widget.height ?? 180,
                    width: widget.width ?? 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  )
                : SizedBox(
                    height: sizeIcon,
                    width: sizeIcon,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Assets.icons.icImage.svg(),
                        if (widget.enabled)
                          Positioned(
                            top: -12,
                            left: -12,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: 2, color: colors.white),
                                color: colors.hintText,
                              ),
                              child: Icon(Icons.add, color: colors.white),
                            ),
                          )
                      ],
                    ),
                  ),
      ),
    );
  }
}
