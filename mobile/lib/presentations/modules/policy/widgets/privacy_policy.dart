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

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final ScrollController _scrollController = ScrollController();
  bool hasScrolledToBottom = false;

  bool agreedTerms = false;
  bool agreedRealName = false;
  bool agreedFinancialInfo = false;

  bool get allAgreed => agreedTerms && agreedRealName && agreedFinancialInfo;

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
            Text(S.current.termsMainTitle, style: theme.textTheme.titleLarge),
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
                          S.current.termsPrivacyConsentTitle,
                          '',
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsPurposeTitle,
                          S.current.termsPurposeContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsItemsTitle,
                          S.current.termsItemsContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsRetentionTitle,
                          S.current.termsRetentionContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsAddendumTitle,
                          S.current.termsAddendumContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsRefusalTitle,
                          S.current.termsRefusalContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsMarketingInfoTitle,
                          S.current.termsMarketingInfoContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsThirdPartyTitle,
                          S.current.termsThirdPartyContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsRecipientTitle,
                          S.current.termsRecipientContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsProvisionPurposeTitle,
                          S.current.termsProvisionPurposeContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsProvisionItemsTitle,
                          S.current.termsProvisionItemsContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsRecipientRetentionTitle,
                          S.current.termsRecipientRetentionContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsThirdPartyRefusalTitle,
                          S.current.termsThirdPartyRefusalContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        _buildTermSection(
                          S.current.termsMarketingConsentDetailTitle,
                          S.current.termsMarketingConsentDetailContent,
                          theme,
                        ),
                        SizedBox(height: 24.h),
                        CustomCheckboxTile(
                          value: agreedTerms,
                          onChanged: (v) {
                            setState(() {
                              agreedTerms = !agreedTerms;
                            });
                          },
                          title: S.current.termsCheckboxPrivacyRequired,
                          borderRadius: 12,
                        ),
                        SizedBox(height: 12.h),
                        CustomCheckboxTile(
                          value: agreedRealName,
                          onChanged: (v) {
                            setState(() {
                              agreedRealName = !agreedRealName;
                            });
                          },
                          title: S.current.termsCheckboxThirdPartyRequired,
                          borderRadius: 12,
                        ),
                        SizedBox(height: 12.h),
                        CustomCheckboxTile(
                          value: agreedFinancialInfo,
                          onChanged: (v) {
                            setState(() {
                              agreedFinancialInfo = !agreedFinancialInfo;
                            });
                          },
                          title: S.current.termsCheckboxMarketingOptional,
                          borderRadius: 12,
                        ),
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
                onPressed: allAgreed
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
        if (content.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Text(
            content,
            style: theme.textTheme.titleSmall,
          ),
        ],
      ],
    );
  }
}
