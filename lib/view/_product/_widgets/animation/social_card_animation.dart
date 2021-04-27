import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../home/social/model/social_user_model.dart';
import '../../../home/social/view/social_view_detail.dart';

class OpenContainerSocialWrapper extends StatelessWidget {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  const OpenContainerSocialWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onClosed,
    this.socialUser,
  });

  final CloseContainerBuilder? closedBuilder;
  final ContainerTransitionType? transitionType;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser? socialUser;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(
          socialUser: socialUser,
        );
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder!,
    );
  }
}
