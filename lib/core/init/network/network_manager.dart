import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': LocaleManager.instance.getStringValue(PreferencesKey.TOKEN)},
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += 'veli';
      },
      onResponse: (e, handler) {
        return e.data;
      },
      onError: (e, handler) {
        return BaseError(e.message);
      },
    ));
  }
  Dio _dio;

  Future<void> dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        } else {
          return responseBody;
        }
        break;
      default:
    }
  }
}
