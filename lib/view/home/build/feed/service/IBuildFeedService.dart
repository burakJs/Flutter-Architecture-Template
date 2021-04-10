import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/model/house_model.dart';
import 'package:vexana/vexana.dart';

abstract class IBuildFeedService {
  final NetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IBuildFeedService(this.manager, this.scaffoldKey);

  Future<List<HouseModel>> fetchUserHouseList();
}
