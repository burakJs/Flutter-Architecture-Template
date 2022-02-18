import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constants.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/product/model/user.dart';
import 'package:fluttermvvmtemplate/view/settings/model/settings_dynamic.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'settings_view_model.g.dart';
part './subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();

  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  Locale appLocale = LanguageManager.instance.enLocale;

  @override
  void init() {}

  void changeAppTheme() {
    if (context != null) {
      context!.read<ThemeNotifier>().changeTheme();
    }
  }

  @action
  void changeAppLocalization(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      context?.setLocale(locale);
    }
  }

  Future<void> logOutApp() async {
    await localeManager.clearAllSaveFirst();
    await navigationService.navigateToPageClear(path: NavigationConstants.LOGIN);
  }

  Future<void> navigateToOnBoard() async {
    await navigationService.navigateToPage(path: NavigationConstants.ON_BOARD);
  }
}
