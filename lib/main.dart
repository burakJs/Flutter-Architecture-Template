import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constant.dart';
import 'package:fluttermvvmtemplate/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/provider_list.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        home: TestView(),
      ),
    );
  }
}
