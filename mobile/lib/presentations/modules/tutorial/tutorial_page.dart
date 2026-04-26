import 'package:base_flutter/core/theme/chon_design_tokens.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 4-step onboarding tutorial mapped to Figma `Tutorial_01` … `Tutorial_04`
/// (`320:18658`, `326:4129`, `347:4189`, `347:4285`).
///
/// Pure presentation — no Cubit yet. Page state is held locally because
/// the only thing that changes is the active page index.
///
/// Usage:
/// ```dart
/// AppNavigator.push(Routes.tutorial);
/// ```
/// or in tests, supply a custom [onFinish] to avoid the router.
class TutorialPage extends StatefulWidget {
  const TutorialPage({
    super.key,
    this.steps = defaultSteps,
    this.onFinish,
    this.onSkip,
  });

  final List<TutorialStep> steps;

  /// Fired when the user taps "시작하기" on the last step.
  /// Defaults to `AppNavigator.go(Routes.home)`.
  final VoidCallback? onFinish;

  /// Fired when the user taps "건너뛰기" on any step.
  /// Defaults to the same as [onFinish].
  final VoidCallback? onSkip;

  static const List<TutorialStep> defaultSteps = [
    TutorialStep(
      title: '나를 확인 받는\nCHON DID',
      body: '내 신분을 가족·인척에게\n확인 받고, 필요한 곳에 인증해 보세요.',
      illustration: TutorialIllustration.shield,
    ),
    TutorialStep(
      title: '서로를 인증하는\n상호 인증',
      body: '가족과 서로를 인증해\n관계를 증명하세요.',
      illustration: TutorialIllustration.handshake,
    ),
    TutorialStep(
      title: '나의 가족과 함께\n가계도',
      body: '가족 관계를 시각화하고\n족보를 안전하게 보관합니다.',
      illustration: TutorialIllustration.tree,
    ),
    TutorialStep(
      title: 'CHON과 함께\n시작해 볼까요?',
      body: '준비가 끝났습니다.\n지금 바로 사용해 보세요.',
      illustration: TutorialIllustration.start,
      isFinalStep: true,
    ),
  ];

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isLast => _index == widget.steps.length - 1;

  void _finish() {
    if (widget.onFinish != null) {
      widget.onFinish!();
    } else {
      AppNavigator.go(Routes.home);
    }
  }

  void _skip() {
    if (widget.onSkip != null) {
      widget.onSkip!();
    } else {
      _finish();
    }
  }

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChonColors.bgPage,
      body: SafeArea(
        child: Column(
          children: [
            _SkipButton(onTap: _skip),
            Expanded(
              child: PageView.builder(
                key: const Key('tutorial.pageview'),
                controller: _controller,
                itemCount: widget.steps.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  return _TutorialStepView(step: widget.steps[i]);
                },
              ),
            ),
            _Indicator(count: widget.steps.length, current: _index),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ChonShape.pagePaddingX, vertical: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  key: const Key('tutorial.next'),
                  onPressed: _next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ChonColors.brandPrimary,
                    foregroundColor: ChonColors.textInverse,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ChonShape.radiusPill),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _isLast ? '시작하기' : '다음',
                    style: ChonTextStyles.actionLabel(
                            color: ChonColors.textInverse)
                        .copyWith(fontSize: 16.sp, height: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8.h, 16.w, 0),
        child: TextButton(
          key: const Key('tutorial.skip'),
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: ChonColors.textTertiary,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          ),
          child: Text(
            '건너뛰기',
            style: ChonTextStyles.body(size: 14, color: ChonColors.textTertiary),
          ),
        ),
      ),
    );
  }
}

class _TutorialStepView extends StatelessWidget {
  const _TutorialStepView({required this.step});
  final TutorialStep step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ChonShape.pagePaddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _IllustrationView(kind: step.illustration),
          SizedBox(height: 32.h),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: ChonTextStyles.cardTitle().copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            step.body,
            textAlign: TextAlign.center,
            style: ChonTextStyles.body(
                size: 16, color: ChonColors.textSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.count, required this.current});
  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: active ? 20.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: active
                ? ChonColors.brandPrimary
                : ChonColors.iconDisabledStrong,
            borderRadius: BorderRadius.circular(ChonShape.radiusPill),
          ),
        );
      }),
    );
  }
}

/// Illustration kinds that the tutorial picks between. Real Figma exports
/// can be wired in later — for now we render simple flat shapes that
/// match the brand palette. Replace each branch with a `SvgPicture.asset`
/// call once the SVG exports are available in `assets/images/tutorial/`.
enum TutorialIllustration { shield, handshake, tree, start }

class _IllustrationView extends StatelessWidget {
  const _IllustrationView({required this.kind});
  final TutorialIllustration kind;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    switch (kind) {
      case TutorialIllustration.shield:
        icon = Icons.verified_user_outlined;
        break;
      case TutorialIllustration.handshake:
        icon = Icons.handshake_outlined;
        break;
      case TutorialIllustration.tree:
        icon = Icons.account_tree_outlined;
        break;
      case TutorialIllustration.start:
        icon = Icons.rocket_launch_outlined;
        break;
    }
    return Container(
      width: 220.r,
      height: 220.r,
      decoration: BoxDecoration(
        color: const Color(0xFFFFE7B8),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 96.r, color: ChonColors.brandPrimary),
    );
  }
}

/// Data for a single tutorial step.
class TutorialStep {
  const TutorialStep({
    required this.title,
    required this.body,
    required this.illustration,
    this.isFinalStep = false,
  });

  final String title;
  final String body;
  final TutorialIllustration illustration;
  final bool isFinalStep;
}
