import 'package:flutter/material.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage({required String path, Object? object}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: object);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? object}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: object);
  }
}
