import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/app_theme_enum.dart';
import 'package:fluttermvvmtemplate/core/extension/widget_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/product/enum/lottie_path_enum.dart';
import 'package:fluttermvvmtemplate/view/settings/viewmodel/settings_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingLow,
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              buildCardUser(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildBuildCardHeaderProjectCore(context, viewModel).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              Card(
                child: ListTile(
                  onTap: viewModel.navigateToOnBoard,
                  title: Text(LocaleKeys.menu_setting_applicationTour.tr()),
                  trailing: Icon(Icons.arrow_right),
                ),
              ).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              buildCardAbout(context, viewModel).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              Text(
                '${''.version}',
                textAlign: TextAlign.center,
                style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100),
              ).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              buildTextButtonLogOut(context, viewModel).toSliver,
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButtonLogOut(BuildContext context, SettingsViewModel viewModel) {
    return TextButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          padding: MaterialStateProperty.all(context.paddingNormal),
          backgroundColor: MaterialStateProperty.all(context.colorScheme.onError.withOpacity(0.7)),
        ),
        onPressed: viewModel.logOutApp,
        icon: Icon(Icons.exit_to_app),
        label: Text(LocaleKeys.menu_setting_exit.tr()));
  }

  Widget buildBuildCardHeaderProjectCore(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: LocaleKeys.menu_setting_core_title.tr(), children: [
      ListTile(
        title: Text(LocaleKeys.menu_setting_core_themeTitle.tr()),
        subtitle: Text(LocaleKeys.menu_setting_core_themeDesc.tr()),
        trailing: IconButton(
            icon: context.watch<ThemeNotifier>().currentThemeEnum == AppThemes.LIGHT ? LottiePathEnum.MOON.toWidget : LottiePathEnum.SUNNY.toWidget,
            onPressed: () {
              viewModel.changeAppTheme();
            }),
      ),
      ListTile(
        title: Text(LocaleKeys.menu_setting_core_langTitle.tr()),
        subtitle: Text(LocaleKeys.menu_setting_core_langDesc.tr()),
        trailing: Observer(builder: (_) {
          return DropdownButton<Locale>(
            items: [
              DropdownMenuItem(
                value: LanguageManager.instance.trLocale,
                child: Text(LanguageManager.instance.trLocale.countryCode!.toUpperCase()),
              ),
              DropdownMenuItem(
                value: LanguageManager.instance.enLocale,
                child: Text(LanguageManager.instance.enLocale.countryCode!.toUpperCase()),
              )
            ],
            onChanged: viewModel.changeAppLocalization,
            value: viewModel.appLocale,
          );
        }),
      ),
    ]);
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel, {required String title, required List<Widget> children}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLow,
            child: Text(title.tr(), style: context.textTheme.headline5),
          ),
          Divider(),
          ...children
        ],
      ),
    );
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            CircleAvatar(radius: 30, child: Text(viewModel.userModel.shortName)),
            Spacer(),
            Text(viewModel.userModel.fullName),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [buildSliverAppBar(context)];
      },
      body: Text('sadsadsads'),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: 100,
      backgroundColor: context.colorScheme.background,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(LocaleKeys.menu_setting_title.tr(), style: context.textTheme.headline5),
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: LocaleKeys.menu_setting_about_title, children: [
      ListTile(
        onTap: viewModel.navigateToContribution,
        leading: Icon(Icons.favorite),
        title: Text(LocaleKeys.menu_setting_about_contribitions.tr()),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
      ),
      ListTile(
        onTap: viewModel.navigateToFakeContribution,
        leading: Icon(Icons.home),
        title: Text('Home Page'),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
      ),
    ]);
  }
}
