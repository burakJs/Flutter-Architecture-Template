import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(
    String path, {
    @required HttpTypes type,
    @required T parseModel,
    dynamic data,
    Map<String, Object> queryParameters,
    Options options,
    void Function(int, int) onReceiveProgress,
  });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchDataNoNetwork<R, T extends BaseModel>(
    String path, {
    @required HttpTypes type,
    @required T parseModel,
    dynamic data,
    Map<String, Object> queryParameters,
    Options options,
    void Function(int, int) onReceiveProgress,
  });
}
