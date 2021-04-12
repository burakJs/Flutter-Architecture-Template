import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                buildAnimatedContainer(context),
                buildContainerTabBar(context),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: buildForm(value, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        duration: context.lowDuration,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: Colors.white,
        child: Image.asset(ImageConstants.instance.hotDog));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(context.width * 0.1))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.headline5,
      unselectedLabelStyle: context.textTheme.headline5,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.yellow,
      tabs: [Tab(text: '     ${LocaleKeys.login_tab1.tr()}'), Tab(text: '${LocaleKeys.login_tab2.tr()}')],
    );
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildElevatedButtonLogin(context, value),
          buildWrapForgot(),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value.isNotEmpty ? null : 'This Field Required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
          labelText: LocaleKeys.login_password.tr(),
          labelStyle: context.textTheme.subtitle1,
          icon: buildContainerIconField(context, Icons.vpn_key),
          suffixIcon: TextButton(
            onPressed: () {
              viewModel.isLockStateChange();
            },
            style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: Observer(builder: (_) {
              return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
            }),
          ),
        ),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value.isValidEmail ? null : 'Email is invalid',
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryVariant),
    );
  }

  Widget buildTextForgot() => Align(alignment: Alignment.centerRight, child: Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end));

  Widget buildElevatedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.colors.onError),
          padding: MaterialStateProperty.all(context.paddingNormal),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
          child: Text(
            LocaleKeys.login_login.tr(),
            style: context.textTheme.headline5,
          ),
        ),
      );
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.tr()),
        TextButton(
          onPressed: () {},
          child: Text(LocaleKeys.login_tab2.tr()),
        )
      ],
    );
  }
}
