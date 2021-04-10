import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager _instance;
  static VexanaManager get instance {
    if (_instance == null) _instance = VexanaManager._init();
    return _instance;
  }

  VexanaManager._init();
  INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: "http://localhost:3000/"));
}
