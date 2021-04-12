import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query_enum.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/service_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey) : super(manager, scaffoldKey);

  @override
  Future<SocialUser> fetchUser(id) async {
    final response = await manager.send<SocialUser, SocialUser>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      method: RequestType.GET,
      urlSuffix: '/$id',
    );
    showMessage(scaffoldKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserList(FriendQuery query) async {
    final response = await manager.send<SocialUser, List<SocialUser>>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      queryParameters: {
        FriendQueryEnum.LIMIT.rawValue: query.limit,
        FriendQueryEnum.Q.rawValue: query.q,
      },
      method: RequestType.GET,
    );
    showMessage(scaffoldKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {}
}
