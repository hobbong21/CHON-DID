import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final image = extra?['image'] ?? '';
    final title = extra?['title'];
    final isQr = extra?['isQr'] ?? false;
    final colors = context.colors;
    return Scaffold(
        backgroundColor: colors.background,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Header(title: title),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: isQr
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: QrImageView(
                          data: image,
                          version: QrVersions.auto,
                        ),
                      ),
                    )
                  : PhotoView(
                      imageProvider: NetworkImage(image),
                      backgroundDecoration: BoxDecoration(
                        color: colors.white,
                      ),
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                    ),
            )
          ],
        ));
  }
}
