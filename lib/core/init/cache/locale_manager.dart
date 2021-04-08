import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_keys_enum.dart';

class LocaleManager {
  static LocaleManager _instance;
  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }

  Future<void> setStringValue(PreferencesKey key, String value) async {
    await _preferences.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKey key, bool value) async {
    await _preferences.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKey key) => _preferences.getString(key.toString() ?? '');
  bool getBoolValue(PreferencesKey key) => _preferences.getBool(key.toString() ?? false);
}
