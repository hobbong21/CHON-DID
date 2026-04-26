import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/storage/app_secure_storage.dart';
import 'package:base_flutter/core/utils/utils.dart';
import 'package:base_flutter/data/models/self_id/verifier_model.dart';
import 'package:base_flutter/domain/repositories/share_repo.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/presentations/modules/self_id_list_choose/self_id_list_choose.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class UniApp extends StatefulWidget {
  final Widget child;
  const UniApp({super.key, required this.child});

  @override
  State<UniApp> createState() => _UniAppState();
}

class _UniAppState extends State<UniApp> {
  static const String scheme = 'chonselfid';
  static const String host = 'app';
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await _appLinks.getInitialLink();
      navigate(initialLink?.toString());

      _appLinks.uriLinkStream.listen((Uri? uri) {
        navigate(uri?.toString());
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
      });
    } catch (e) {
      // Handle exception by warning the user their action did not succeed
    }
  }

  navigate(String? link) async {
    try {
      if (link != null && link.startsWith('$scheme://$host/')) {
        final path = link.replaceAll('$scheme://$host/', '');
        final pathSegments = path.split('/');
        final type = pathSegments[0];
        Routes? route;
        if (LinkTypeE.values.any((e) => type == e.toJson())) {
          final accessToken =
              Injector.getIt<AppCubit>().state.loginModel?.accessToken;
          if (Utils.isNullOrEmpty(accessToken)) {
            AppNavigator.push(Routes.selfIdCreater);
            return;
          }
        }
        if (type == LinkTypeE.verify.toJson()) {
          final verifyType = int.tryParse(pathSegments[1]);
          if (verifyType == VerifyTypeE.selfId.index) {
            route = Routes.confirmRelationship;
          } else if (verifyType == VerifyTypeE.cardFamily.index) {
            // route = Routes.requesterList;
          } else if (verifyType == VerifyTypeE.cardTaekwondo.index) {
            // route = Routes.requesterList;
          }
          final token = pathSegments.elementAtOrNull(2);
          if (route == null || token == null) return;
          AppNavigator.push(route, token);
        } else if (type == LinkTypeE.info.toJson()) {
          final verifyType = int.tryParse(pathSegments[1]);
          if (verifyType == VerifyTypeE.selfId.index) {
            route = Routes.requestVerification;
          } else if (verifyType == VerifyTypeE.cardFamily.index) {
            route = Routes.requestVerification;
          } else if (verifyType == VerifyTypeE.cardTaekwondo.index) {
            route = Routes.requestVerification;
          }
          final token = pathSegments.elementAtOrNull(2);
          if (route == null || token == null) return;
          AppNavigator.push(route, {'token': token});
        } else if (type == LinkTypeE.event.toJson()) {
          final eventId = int.tryParse(pathSegments[1]) ?? -1;
          final token = pathSegments[2];
          AppNavigator.push(Routes.selfIdListChoose, {
            'token': token,
            'type': SelfIdListChooseType.checkInOut,
            'eventId': eventId,
          });
        }
      }
    } catch (e) {
      // Handle exception by warning the user their action did not succeed
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
