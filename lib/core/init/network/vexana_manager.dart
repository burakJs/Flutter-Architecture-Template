import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager _instance;
  static VexanaManager get instance {
    if (_instance == null) _instance = VexanaManager._init();
    return _instance;
  }

  static const String _iosBaseUrl = 'http://localhost:3000/';
  static const String _androidBaseUrl = 'http://10.0.0.2:3000/';
  VexanaManager._init();
  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true, options: BaseOptions(baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl));
}
