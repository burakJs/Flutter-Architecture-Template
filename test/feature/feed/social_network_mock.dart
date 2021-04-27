import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';

class SocialNetworkMock extends SocialService {
  SocialNetworkMock(INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldKey) : super(manager, scaffoldKey);
}

class SocialNetworkMockAll extends ISocialService {
  SocialNetworkMockAll(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey) : super(manager, scaffoldKey);

  @override
  Future<SocialUser> fetchUser(id) async {
    await Future.delayed(Duration(seconds: 1));
    return SocialUser(name: id);
  }

  @override
  Future<List<SocialUser>> fetchUserList(FriendQuery query) {
    throw UnimplementedError();
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    throw UnimplementedError();
  }
}
