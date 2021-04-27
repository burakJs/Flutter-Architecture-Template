import 'package:dio/dio.dart';

import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': LocaleManager.instance.getStringValue(PreferencesKey.TOKEN)},
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    //   _dio.interceptors.add(InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       options.path += 'veli';
    //     },
    //     onResponse: (e, handler) {
    //       return e.data;
    //     },
    //     onError: (e, handler) {
    //       return BaseError(e.message);
    //     },
    //   ));
    // }
  }
}
