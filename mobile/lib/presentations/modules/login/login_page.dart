import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:base_flutter/presentations/modules/login/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => cubit,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.isLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state.messageError.isNotEmpty) {
              AppUtils.showSnackBarError(
                  context: context, title: state.messageError);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(12.r),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Login',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: cubit.usernameController,
                      decoration: InputDecoration(
                        hintText: S.current.username,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.current.pleaseEnterUsername;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: cubit.passwordController,
                      decoration: InputDecoration(
                        hintText: S.current.password,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.r),
                          child: InkWell(
                            onTap: () {
                              cubit.onChangeObscureText();
                            },
                            child: Icon(
                              cubit.state.isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: colors.secondaryText,
                            ),
                          ),
                        ),
                      ),
                      obscureText: cubit.state.isObscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.current.pleaseEnterPassword;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
