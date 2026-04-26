import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'injector.dart';
import 'presentations/widgets/keyboard_dismiss.dart';
import 'router/app_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: const AppMobile(),
    );
  }
}

class AppMobile extends StatefulWidget {
  const AppMobile({super.key});

  @override
  State<AppMobile> createState() => _AppMobileState();
}

class _AppMobileState extends State<AppMobile> {
  late AppCubit _appBloc;

  @override
  void initState() {
    _appBloc = Injector.getIt<AppCubit>()..init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appBloc.initTheme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(437, 912),
      minTextAdapt: true,
      fontSizeResolver: FontSizeResolvers.radius,
      child: BlocProvider<AppCubit>.value(
        value: _appBloc,
        child: BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) =>
              previous.locale != current.locale ||
              previous.themeMode != current.themeMode ||
              previous.themes != current.themes,
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppNavigator.router,
              scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
              color: Colors.white,
              title: F.title,
              theme: state.themes?.light,
              darkTheme: state.themes?.dark,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales:
                  const AppLocalizationDelegate().supportedLocales,
              locale: Locale(
                state.locale.split('_')[0],
                state.locale.split('_').elementAtOrNull(1),
              ),
              builder: (context, child) {
                return DismissKeyboard(
                  child: MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: TextScaler.noScaling),
                    child: LoaderOverlay(
                      disableBackButton: true,
                      overlayWidgetBuilder: (_) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      },
                      child: child!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
