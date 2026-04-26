import 'dart:io';

import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Reusable ID-card camera widget for the ID Generation v2 flow.
///
/// Renders a full-screen back-camera preview with a card-shaped guide
/// overlay (`_GuideOverlay`) and a shutter button. Calls [onCaptured]
/// with the saved [File] once the user taps the shutter.
///
/// Usage (inside a phase leaf):
/// ```dart
/// IdCameraCapture(
///   instructionLabel: '신분증 앞면을 가이드 안에 맞춰주세요',
///   onCaptured: (file) {
///     cubit.setFrontImage(base64Encode(file.readAsBytesSync()));
///     cubit.next();
///   },
/// );
/// ```
class IdCameraCapture extends StatefulWidget {
  const IdCameraCapture({
    super.key,
    required this.onCaptured,
    this.instructionLabel = '신분증을 가이드 안에 맞춰주세요',
    this.onPermissionDenied,
  });

  final ValueChanged<File> onCaptured;
  final String instructionLabel;

  /// Optional callback when the camera permission is denied. Default
  /// behaviour is to display an inline error inside the widget.
  final VoidCallback? onPermissionDenied;

  @override
  State<IdCameraCapture> createState() => _IdCameraCaptureState();
}

class _IdCameraCaptureState extends State<IdCameraCapture> {
  CameraController? _controller;
  String? _error;
  bool _capturing = false;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    final granted = await _requestPermission();
    if (!granted) {
      widget.onPermissionDenied?.call();
      if (mounted) {
        setState(() => _error = '카메라 권한이 필요합니다.');
      }
      return;
    }

    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      if (mounted) setState(() => _error = '사용 가능한 카메라가 없습니다.');
      return;
    }
    final back = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    final controller = CameraController(
      back,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    try {
      await controller.initialize();
    } catch (e) {
      if (mounted) setState(() => _error = '카메라 초기화 실패: $e');
      return;
    }
    if (!mounted) {
      await controller.dispose();
      return;
    }
    setState(() => _controller = controller);
  }

  Future<bool> _requestPermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final status = await Permission.camera.request();
      return status.isGranted;
    }
    return true;
  }

  Future<void> _capture() async {
    final c = _controller;
    if (c == null || !c.value.isInitialized || _capturing) return;
    setState(() => _capturing = true);
    try {
      final shot = await c.takePicture();
      widget.onCaptured(File(shot.path));
    } catch (e) {
      if (mounted) setState(() => _error = '촬영 실패: $e');
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return _ErrorView(message: _error!);
    }
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return const _LoadingView();
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        const _GuideOverlay(),
        Positioned(
          left: 0,
          right: 0,
          top: 24,
          child: _InstructionPill(label: widget.instructionLabel),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 32,
          child: Center(
            child: _ShutterButton(
              onTap: _capturing ? null : _capture,
              isCapturing: _capturing,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF000000),
      child: const Center(
        child:
            CircularProgressIndicator(color: ChonColors.brandPrimary),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: ChonTextStyles.body(
                size: 14, color: ChonColors.textInverse),
          ),
        ),
      ),
    );
  }
}

/// Translucent card-shaped hole in the middle of a black overlay.
class _GuideOverlay extends StatelessWidget {
  const _GuideOverlay();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _GuidePainter(),
    );
  }
}

class _GuidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Card aspect ~1.585 (ID-1 / credit card).
    final cardWidth = size.width * 0.85;
    final cardHeight = cardWidth / 1.585;
    final cardRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: cardWidth,
      height: cardHeight,
    );
    final rrect =
        RRect.fromRectAndRadius(cardRect, const Radius.circular(16));

    // Dim the area outside the card.
    final dim = Path()..addRect(Offset.zero & size);
    final hole = Path()..addRRect(rrect);
    final ring = Path.combine(PathOperation.difference, dim, hole);
    canvas.drawPath(
      ring,
      Paint()..color = const Color(0x99000000),
    );

    // Bright orange dashed-style border around the card hole.
    final stroke = Paint()
      ..color = ChonColors.brandPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(rrect, stroke);

    // Corner accent marks.
    final cornerLen = 24.0;
    final cornerPaint = Paint()
      ..color = ChonColors.brandPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    void corner(Offset p, Offset dx, Offset dy) {
      canvas.drawLine(p, p + dx, cornerPaint);
      canvas.drawLine(p, p + dy, cornerPaint);
    }

    final tl = cardRect.topLeft;
    final tr = cardRect.topRight;
    final bl = cardRect.bottomLeft;
    final br = cardRect.bottomRight;
    corner(tl, Offset(cornerLen, 0), Offset(0, cornerLen));
    corner(tr, Offset(-cornerLen, 0), Offset(0, cornerLen));
    corner(bl, Offset(cornerLen, 0), Offset(0, -cornerLen));
    corner(br, Offset(-cornerLen, 0), Offset(0, -cornerLen));
  }

  @override
  bool shouldRepaint(covariant _GuidePainter oldDelegate) => false;
}

class _InstructionPill extends StatelessWidget {
  const _InstructionPill({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xCC000000),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: ChonTextStyles.body(
              size: 13, color: ChonColors.textInverse),
        ),
      ),
    );
  }
}

class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.onTap, required this.isCapturing});
  final VoidCallback? onTap;
  final bool isCapturing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('idCamera.shutter'),
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ChonColors.textInverse, width: 5),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCapturing
                ? ChonColors.brandPrimary.withValues(alpha: 0.7)
                : ChonColors.brandPrimary,
          ),
          alignment: Alignment.center,
          child: isCapturing
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: ChonColors.textInverse,
                    strokeWidth: 2,
                  ),
                )
              : const Icon(Icons.camera_alt_outlined,
                  size: 28, color: ChonColors.textInverse),
        ),
      ),
    );
  }
}
