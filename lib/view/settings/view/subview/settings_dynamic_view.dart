import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constant.dart';
import 'package:fluttermvvmtemplate/view/settings/model/settings_dynamic.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsDynamicView extends StatelessWidget {
  final SettingsDynamicModel model;

  const SettingsDynamicView({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title, style: context.textTheme.headline6)),
      body: WebView(
        initialUrl: model.url ?? ApplicationConstants.APP_WEB_SITE,
      ),
    );
  }
}
