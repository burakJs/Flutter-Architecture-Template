import 'package:flutter/cupertino.dart';

import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context);
  void init();
}
