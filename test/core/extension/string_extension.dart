import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

// ignore: always_declare_return_types
main() {
  setUp(() {});
  test('Email Regexp', () {
    var email = 'joedoe@gmail.com';
    expect(email.isValidEmail, null);
  });
}
