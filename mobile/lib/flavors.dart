enum Flavor {
  local,
  dev,
  stg,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  // Build provenance — injected by CI via --dart-define.
  // Empty string in local/IDE builds.
  static const String buildSha = String.fromEnvironment('BUILD_SHA');
  static const String buildNumber = String.fromEnvironment('BUILD_NUMBER');
  static String get buildShaShort =>
      buildSha.isEmpty ? '' : buildSha.substring(0, 7);

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'Chon selfid (local)';
      case Flavor.dev:
        return 'Chon selfid (dev)';
      case Flavor.stg:
        return 'Chon selfid (stg)';
      case Flavor.prod:
        return 'Chon selfid';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.local:
        return _localBaseUrl;
      case Flavor.dev:
        return 'http://chon-alb-1022894078.ap-northeast-2.elb.amazonaws.com/mcrs-api';
      case Flavor.stg:
        return 'https://parking.vdss.com.vn/mcrs-api'; // TODO: update when stg ALB is ready
      case Flavor.prod:
        return 'http://172.233.87.142:1405/mcrs-api'; // TODO: update when prod ALB is ready
    }
  }

  static const String _localBaseUrl = String.fromEnvironment(
    'LOCAL_API_BASE_URL',
    defaultValue: 'http://localhost:8888/mcrs-api',
  );

  static String imageUrl(String path) =>
      path.startsWith('http') ? path : '$baseUrl/public/image?path=$path';

  static String get openaiUrl {
    return 'https://api.openai.com/v1/chat';
  }

  static String get ocrGenaralUrl {
    return 'https://icj066gojk.apigw.ntruss.com/custom/v1/49235/fbef4daf0f40aed4012680ae474a5d5c4985a25d50ec35c440b061990413dddf';
  }

  static String get ocrUrl {
    return 'https://kyfx83ywxe.apigw.ntruss.com/custom/v1/49284/78cdd383bd74623501e7742c541175e274555dc7ec43f18da914fb38f96a8dac';
  }
}
