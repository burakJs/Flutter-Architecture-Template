import 'package:flutter/cupertino.dart';
import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';

import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio = NetworkManager.instance.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
