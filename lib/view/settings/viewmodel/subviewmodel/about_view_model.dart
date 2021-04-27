part of '../settings_view_model.dart';

extension SettingsViewModelBaseNavigate on _SettingsViewModelBase {
  void navigateToContribution() {
    navigationService.navigateToPage(path: NavigationConstants.SETTINGS_WEB_VIEW, object: SettingsDynamicModel.fakeArchitecturePR());
  }

  void navigateToFakeContribution() {
    navigationService.navigateToPage(path: NavigationConstants.SETTINGS_WEB_VIEW, object: SettingsDynamicModel.fakeNull());
  }
}
