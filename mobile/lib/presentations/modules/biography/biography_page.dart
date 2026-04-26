import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/presentations/modules/biography/cubit/biography_cubit.dart';
import 'package:base_flutter/presentations/modules/biography/widgets/bio_intro.dart';
import 'package:base_flutter/presentations/modules/biography/widgets/bio_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class BiographyPage extends StatefulWidget {
  const BiographyPage({super.key});

  @override
  State<BiographyPage> createState() => _BiographyPageState();
}

class _BiographyPageState extends State<BiographyPage> {
  final cubit = BiographyCubit();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    cubit.loadData();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<BiographyCubit, BiographyState>(
        listener: (context, state) {
          if (state.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Assets.icons.arrowRight.svg(
                            width: 24.w,
                            height: 24.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.black, BlendMode.srcIn),
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Text(
                          'History',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colors.labelText,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: [
                        if (state.profile != null)
                          BioIntro(profile: state.profile!),
                        if (state.events.isNotEmpty)
                          BioTimeline(events: state.events),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h, top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: _currentPage == index ? 24.w : 8.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? colors.primary.withOpacity(0.7)
                                : colors.primary,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
