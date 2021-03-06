import 'package:dio/dio.dart';
import 'package:dio/src/options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'core_dio_mock.dart';
import 'dio_mock_model.dart';

// ignore: always_declare_return_types
main() {
  late ICoreDioFull service;
  setUp(() {
    service = CoreDioMock(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  });
  test('CoreDio List', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>(
      '/posts',
      type: HttpTypes.GET,
      parseModel: PostModel(),
    );

    expect(data.data, isList);
  });
  test('CoreDio List No Network', () async {
    final data = await service.fetchDataNoNetwork<List<PostModel>, PostModel>(
      '/posts',
      type: HttpTypes.GET,
      parseModel: PostModel(),
    );

    expect(data.data, isList);
  });
  test('CoreDio Object', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>(
      '/posts',
      type: HttpTypes.GET,
      parseModel: PostModel(),
    );

    expect(data.data, isList);
  });
  test('CoreDio Primitive', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>(
      '/posts',
      type: HttpTypes.GET,
      parseModel: PostModel(),
    );

    expect(data.data, isList);
  });
  test('CoreDio Error', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>(
      '/posts',
      type: HttpTypes.GET,
      parseModel: PostModel(),
    );

    expect(data.data, isList);
  });
}
