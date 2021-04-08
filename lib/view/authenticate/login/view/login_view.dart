import 'package:flutter/material.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/button/facebook_button.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),
            FaceBookButton(
              onComplete: (data, {errorMessage}) {
                if (data != null) {
                } else {
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(errorMessage)));
                }
              },
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
