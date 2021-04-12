import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/animation/social_card_animation.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/list-tile/friend_card.dart';
import 'package:fluttermvvmtemplate/view/home/social/viewmodel/social_view_model.dart';
import 'package:kartal/kartal.dart';

class SocialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) => Container(
        color: context.colorScheme.background,
        padding: context.paddingLow,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFindFriends(context),
              Spacer(flex: 2),
              TextField(
                onChanged: (value) {
                  viewModel.fetchAllSearchQuery(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colorScheme.onSecondary.withOpacity(0.2),
                  ),
                ),
              ),
              Spacer(flex: 2),
              Expanded(flex: 9, child: Observer(builder: (_) => buildListViewUser(viewModel)))
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
        onPressed: () {},
        child: Text(LocaleKeys.menu_social_cancel).tr(),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.menu_social_next,
            style: context.textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w600,
              color: context.appTheme.buttonTheme.colorScheme.onError,
            ),
          ).tr(),
        ),
      ],
    );
  }

  Text buildTextFindFriends(BuildContext context) {
    return Text(
      LocaleKeys.menu_social_findFriends.tr(),
      style: context.textTheme.headline3.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.onSecondary,
      ),
    );
  }

  ListView buildListViewUser(SocialViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (context, index) {
        viewModel.fetchAllUserLoading(index);
        return OpenContainerSocialWrapper(
          socialUser: viewModel.socialUserList[index],
          closedBuilder: (BuildContext _, VoidCallback action) => FriendCard(
            user: viewModel.socialUserList[index],
            onPressed: action,
          ),
        );
      },
    );
  }
}
