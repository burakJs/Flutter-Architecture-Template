enum NetworkRoutes { LOGIN }

extension NetworkRoutesExtension on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'login';
        break;
      default:
        throw Exception('Route Not Found');
    }
  }
}
