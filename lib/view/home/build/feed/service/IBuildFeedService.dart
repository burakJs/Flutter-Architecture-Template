import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/house_model.dart';

abstract class IBuildFeedService {
  final NetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IBuildFeedService(this.manager, this.scaffoldKey);

  Future<List<HouseModel>> fetchUserHouseList();
}
