import 'package:base_flutter/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_navigator.dart';

abstract final class AuthGuard {
  static String? guard(BuildContext context, GoRouterState state) {
    return guardLogin(context, state);
  }

  static String? guardLogin(BuildContext context, GoRouterState state) {
    // final appCubit = context.read<AppCubit>();
    // final bool isAuthenticated =
    //     appCubit.state.loginModel?.accessToken?.isNotEmpty == true;

    // if (!isAuthenticated) {
    //   appCubit.setRedirectPath(state.uri.toString());
    //   return Routes.login.path;
    // }

    return null;
  }
}
