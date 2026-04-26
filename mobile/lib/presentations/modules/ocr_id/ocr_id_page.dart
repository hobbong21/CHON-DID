import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/ocr_id/cubit/ocr_id_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class OcrIdPage extends StatefulWidget {
  final OcrType type;
  const OcrIdPage({super.key, required this.type});

  @override
  State<OcrIdPage> createState() => _OcrIdPageState();
}

class _OcrIdPageState extends State<OcrIdPage> {
  final cubit = OcrIdCubit();

  @override
  void initState() {
    super.initState();
    cubit.init(widget.type);
    cubit.initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final colors = context.colors;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<OcrIdCubit, OcrIdState>(listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.errorMessage.isNotEmpty) {
          AppUtils.showSnackBarError(
              context: context, title: state.errorMessage);
          cubit.clearMessage();
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: (cubit.controller != null)
                    ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            width: cubit.controller!.value.previewSize?.height,
                            height: cubit.controller!.value.previewSize?.width,
                            child: CameraPreview(cubit.controller!)),
                      )
                    : SizedBox.shrink(),
              ),
              if (state.image != null)
                Positioned.fill(
                  child: Image.file(
                    state.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              Positioned.fill(
                child: ClipPath(
                  clipper: RectHoleClipper(),
                  child: Container(
                    color: Colors.black.withAlpha(150),
                  ),
                ),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: HoleBorderPainter(borderColor: colors.primary),
                ),
              ),
              if (state.image == null)
                Positioned(
                  top: 150.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    width: ScreenUtil().screenWidth,
                    child: Text(
                      S.current.idCardAreaGuide,
                      style:
                          textTheme.bodyMedium?.copyWith(color: colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (state.image == null)
                Positioned(
                  bottom: 150.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    width: ScreenUtil().screenWidth,
                    child: Text(
                      S.current.shootingGuide,
                      style:
                          textTheme.bodyMedium?.copyWith(color: colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              Positioned(
                bottom: 200.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  width: ScreenUtil().screenWidth,
                  child: ElevatedButton(
                      onPressed: () {
                        if (state.image != null && state.croppedImage != null) {
                          cubit.generalOcr(state.croppedImage!);
                        } else {
                          cubit.capture(context);
                        }
                      },
                      child: Text('ocr')),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Header(
                  title: S.current.captureIdCard,
                  tintColor: colors.white,
                  actions: [
                    if (state.croppedImage != null)
                      IconButton(
                        onPressed: cubit.clearImage,
                        icon: Assets.icons.close.svg(width: 36.r),
                      )
                    else
                      SizedBox(width: 54.r),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RectHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final holeRect = OcrIdCubit.getHoleRect(size);
    path.addRRect(RRect.fromRectAndRadius(holeRect, Radius.circular(12.r)));

    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class HoleBorderPainter extends CustomPainter {
  final Color borderColor;
  HoleBorderPainter({
    required this.borderColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final rect = OcrIdCubit.getHoleRect(size);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;

    final round = RRect.fromRectAndRadius(rect, Radius.circular(12.r));

    canvas.drawRRect(round, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
