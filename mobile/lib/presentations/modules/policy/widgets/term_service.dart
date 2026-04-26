import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/policy/widgets/custom_checkbox_listile.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/presentations/widgets/safe_area_bottom.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermService extends StatefulWidget {
  const TermService({super.key});

  @override
  State<TermService> createState() => _TermServiceState();
}

class _TermServiceState extends State<TermService> {
  final ScrollController _scrollController = ScrollController();
  bool hasScrolledToBottom = false;
  bool agreed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (currentScroll >= maxScroll - 50 && !hasScrolledToBottom) {
        setState(() {
          hasScrolledToBottom = true;
        });
      }
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            SizedBox(height: 24.h),
            Text(S.current.serviceTermsTitle,
                style: theme.textTheme.headlineLarge),
            SizedBox(height: 36.h),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTermSection(
                          S.current.serviceTermsHeaderTitle,
                          S.current.serviceTermsHeaderContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt1Title,
                          S.current.serviceTermsArt1Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt2Title,
                          S.current.serviceTermsArt2Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt3Title,
                          S.current.serviceTermsArt3Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt4Title,
                          S.current.serviceTermsArt4Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt5Title,
                          S.current.serviceTermsArt5Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt6Title,
                          S.current.serviceTermsArt6Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt7Title,
                          S.current.serviceTermsArt7Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt8Title,
                          S.current.serviceTermsArt8Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt9Title,
                          S.current.serviceTermsArt9Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt10Title,
                          S.current.serviceTermsArt10Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt11Title,
                          S.current.serviceTermsArt11Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt12Title,
                          S.current.serviceTermsArt12Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt13Title,
                          S.current.serviceTermsArt13Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt14Title,
                          S.current.serviceTermsArt14Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt15Title,
                          S.current.serviceTermsArt15Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsArt16Title,
                          S.current.serviceTermsArt16Content,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsAddendumTitle,
                          S.current.serviceTermsAddendumContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.serviceTermsCompanyInfoTitle,
                          S.current.serviceTermsCompanyInfoContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        CustomCheckboxTile(
                          value: agreed,
                          onChanged: (v) {
                            setState(() {
                              agreed = !agreed;
                            });
                          },
                          title: S.current.serviceTermsAgreeCheckbox,
                          borderRadius: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            if (!hasScrolledToBottom)
              ElevatedButton(
                onPressed: _scrollToBottom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.current.termsScrollDown),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_downward, size: 20.sp),
                  ],
                ),
              )
            else
              ElevatedButton(
                onPressed: agreed
                    ? () {
                        AppNavigator.pop();
                      }
                    : null,
                child: Text(S.current.termsConfirm),
              ),
            const SafeAreaBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildTermSection(String title, String content, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          content,
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
