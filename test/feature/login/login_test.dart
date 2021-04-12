import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/model/test_model.dart';

// ignore: always_declare_return_types
main() {
  setUp(() {
    print('here');
  });
  test('User Login Fail Test', () {
    final isUserLogin = true;
    expect(isUserLogin, isTrue);
  });

  group('User Login Full Test', () {
    test('User Login Fail Test', () {
      final isUserLogin = true;
      expect(isUserLogin, isTrue);
    });

    test('User Login Fail Test', () {
      final isUserLogin = true;
      expect(isUserLogin, isTrue);
    });

    test('User Login Fail Test', () {
      final isUserLogin = true;
      expect(isUserLogin, isTrue);
    });

    test('Dynamic parse', () async {
      final error = BaseError('aaa');
      final errorDynamic = error as dynamic;
      final x = await hello<List<TestModel>, TestModel>();
      expect(errorDynamic, isNotNull);
    });
  });
}

Future<R> hello<R, T extends BaseModel>() {
  return Future.error(BaseError('aaa'));
}
