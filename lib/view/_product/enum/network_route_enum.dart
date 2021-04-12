enum NetworkRoutes { LOGIN, BUILD_HOME, FRIENDS }

extension NetworkRoutesExtension on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'login';
      case NetworkRoutes.BUILD_HOME:
        return 'house';
      case NetworkRoutes.FRIENDS:
        return 'friends';
      default:
        throw Exception('Route Not Found');
    }
  }
}
