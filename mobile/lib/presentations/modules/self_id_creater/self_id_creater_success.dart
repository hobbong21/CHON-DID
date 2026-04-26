import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/request_verification/request_verification.dart';
import 'package:base_flutter/presentations/modules/self_id_creater/widgets/animated_check.dart';
import 'package:base_flutter/presentations/widgets/header.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SelfIdCreaterSuccess extends StatefulWidget {
  const SelfIdCreaterSuccess({super.key});

  @override
  State<SelfIdCreaterSuccess> createState() => _SelfIdCreaterSuccessState();
}

class _SelfIdCreaterSuccessState extends State<SelfIdCreaterSuccess> {
  bool _showText = false;
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map?;
    final cardId = extra?['cardId'] as int?;
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          AppNavigator.popToHead();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(onBack: AppNavigator.popToHead),
              SizedBox(height: 32.h),
              Center(
                child: AnimatedOpacity(
                  opacity: _showText ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    S.current.self_id_created,
                    style: context.theme.textTheme.titleLarge,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: AnimatedCheck(onComplete: () {
                  if (mounted) {
                    setState(() {
                      _showText = true;
                    });
                  }
                }),
              ),
              SizedBox(height: 64.h),
              Spacer(),
              SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: AnimatedOpacity(
                      opacity: _showText ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: ElevatedButton(
                          onPressed: () {
                            AppNavigator.push(Routes.requestVerification, {
                              'cardId': cardId,
                              'isNewCreated': true,
                            });
                          },
                          child: Text(S.current.confirm)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
