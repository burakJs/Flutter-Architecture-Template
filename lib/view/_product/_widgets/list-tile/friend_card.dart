import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:kartal/kartal.dart';

class FriendCard extends StatelessWidget {
  final SocialUser user;
  final VoidCallback onPressed;

  const FriendCard({Key key, this.user, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.image),
      ),
      title: Text(user.name),
      subtitle: Text(user.name),
      trailing: Padding(
        padding: EdgeInsets.zero,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.appTheme.buttonTheme.colorScheme.onError),
          ),
          child: Text(
            LocaleKeys.menu_social_follow.tr(),
            style: context.textTheme.subtitle1.copyWith(color: context.colorScheme.background),
          ),
        ),
      ),
    );
  }
}
