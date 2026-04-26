import 'package:flutter/material.dart';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Setting Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Injector.getIt<AppCubit>().logout();
                AppNavigator.go(Routes.login);
              },
              child: Text('Logout')),
          const SizedBox(height: 24),
          _BuildInfo(),
        ],
      ),
    );
  }
}

/// Displays flavor + build provenance (SHA and run number).
/// Build fields are populated by CI via --dart-define; empty in local/IDE builds.
class _BuildInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sha = F.buildShaShort;
    final number = F.buildNumber;
    final label = sha.isEmpty && number.isEmpty
        ? '${F.name} • local build'
        : '${F.name} • build ${number.isEmpty ? '?' : number}'
            '${sha.isEmpty ? '' : ' ($sha)'}';
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).hintColor,
          ),
    );
  }
}
