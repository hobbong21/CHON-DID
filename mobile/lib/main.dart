import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bootstrap.dart';
import 'flavors.dart';

void main() async {
  await bootstrap(
    flavorConfiguration: () async {
      const configuredFlavor = String.fromEnvironment('APP_FLAVOR');
      final flavorName =
          configuredFlavor.isNotEmpty ? configuredFlavor : appFlavor;

      F.appFlavor = Flavor.values.firstWhere(
        (element) => element.name == flavorName,
      );
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await dotenv.load();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    },
  );
}
