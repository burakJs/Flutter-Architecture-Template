part of '../core_dio.dart';

extension CoreDioOperations on CoreDio {
  R _responseParser<R>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList() as R;
    } else if (data is Map) {
      return model.fromJson(data);
    } else {
      return data as R;
    }
  }
}
