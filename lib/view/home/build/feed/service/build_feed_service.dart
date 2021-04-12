import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/scaffold.dart';
import '../../../../_product/_utility/service_helper.dart';
import '../../../../_product/enum/network_route_enum.dart';
import '../model/house_model.dart';
import 'IBuildFeedService.dart';
import 'package:vexana/src/network_manager.dart';
import 'package:vexana/vexana.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(NetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey) : super(manager, scaffoldKey);

  @override
  Future<List<HouseModel>> fetchUserHouseList() async {
    final response =
        await manager.send<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);
    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
