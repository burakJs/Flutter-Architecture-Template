import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';

import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  SocialUserViewDetail({Key key, this.socialUser}) : super(key: key);

  ISocialService get socialService => SocialService(manager, null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser.sId).toBuild<SocialUser>(
            onSuccess: (data) {
              return Center(child: Image.network(data.image));
            },
            loadingWidget: CircularProgressIndicator(),
            notFoundWidget: Center(child: Text('Not Found')),
            onError: Text('ERRRRRRRROOOOORRRR'),
          ),
    );
  }
}
