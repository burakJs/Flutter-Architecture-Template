import 'package:flutter/material.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: context.paddingLow,
              height: context.height * .4,
              color: context.theme.colorScheme.onPrimary,
              child: buildText(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.lowValue),
              child: Placeholder(),
            ),
          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      'Hello',
      style: context.textTheme.headline1.copyWith(color: context.theme.primaryColor),
    );
  }
}
