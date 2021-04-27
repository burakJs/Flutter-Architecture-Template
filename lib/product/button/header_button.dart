import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';

class HeaderButton extends StatelessWidget {
  final String? titleText;
  final VoidCallback? onPressed;
  HeaderButton({Key? key, this.titleText, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildTextTitle(context), buildTextButtonRight(context)],
      ),
    );
  }

  Text buildTextTitle(BuildContext context) {
    return Text(
      titleText!.tr(),
      style: context.textTheme.headline6!.copyWith(color: context.colorScheme.onError),
    );
  }

  TextButton buildTextButtonRight(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(LocaleKeys.menu_game_viewAll.tr(), style: context.textTheme.subtitle2),
          Icon(Icons.arrow_right, color: context.colorScheme.onError),
        ],
      ),
    );
  }
}
