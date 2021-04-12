import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

// ignore: always_declare_return_types
main() {
  // ignore: unused_local_variable
  ICoreDio coreDio;
  setUp(() {
    coreDio = NetworkManager.instance.coreDio;
  });
  test('Sample Test', () {});
}
