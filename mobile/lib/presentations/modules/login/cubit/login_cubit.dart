import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/data/models/auth/login_model.dart';
import 'package:base_flutter/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

const kUserName = 'kUserName';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final appCubit = Injector.getIt<AppCubit>();

  final authRepo = Injector.getIt<AuthRepo>();

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));
      // final res = await authRepo.login(
      //     username: usernameController.text, password: passwordController.text);
      AppSP.set(kUserName, usernameController.text);

      await appCubit.setLoginModel(LoginModel(accessToken: 's'));
      if (appCubit.state.redirectPath.isNotEmpty) {
        emit(state.copyWith(isLoading: false, messageError: ''));
        AppNavigator.goNamed(appCubit.state.redirectPath);
        appCubit.setRedirectPath('');
      } else {
        emit(state.copyWith(isLoading: false, messageError: ''));
        AppNavigator.go(Routes.home);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, messageError: e.toString()));
    }
  }

  onChangeObscureText() {
    emit(state.copyWith(isObscureText: !state.isObscureText));
  }
}
