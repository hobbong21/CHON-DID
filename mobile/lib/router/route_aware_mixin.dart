import 'package:flutter/material.dart';
import 'package:base_flutter/router/app_navigator.dart';

mixin RouteAwareMixin<T extends StatefulWidget> on State<T>, RouteAware {
  bool isFocusScreen = true;

  RouteObserver<PageRoute<dynamic>> get observer => AppNavigator.routeObserver;

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    observer.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @mustCallSuper
  @override
  void didPush() {
    isFocusScreen = true;
    onFocus();
  }

  @mustCallSuper
  @override
  void didPopNext() {
    isFocusScreen = true;
    onFocus();
  }

  @mustCallSuper
  @override
  void didPushNext() {
    isFocusScreen = false;
  }

  @override
  void didPop() {
    isFocusScreen = false;
  }

  @mustCallSuper
  @override
  dispose() async {
    observer.unsubscribe(this);
    super.dispose();
  }

  onFocus() {}
}
