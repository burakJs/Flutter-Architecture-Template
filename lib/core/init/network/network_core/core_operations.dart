part of '../core_dio.dart';

extension CoreDioOperations on CoreDio {
  R _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>);
    } else {
      return data as R;
    }
  }
}
