abstract class INavigationService {
  Future<void> navigateToPage({required String path, Object? object});
  Future<void> navigateToPageClear({required String path, Object? object});
}
