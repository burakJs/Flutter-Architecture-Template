import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/decoration_helper.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/model/house_model.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/service/IBuildFeedService.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/service/build_feed_service.dart';
import 'package:mobx/mobx.dart';
part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  DecorationHelper helper;
  IBuildFeedService feedService;

  @observable
  List<String> likeItems = [];

  @action
  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }
    likeItems = likeItems;
  }

  @observable
  List<HouseModel> houseModels = [];

  @computed
  HouseModel get sliderHouse => houseModels.first;

  @observable
  bool isLoading = false;

  void init() {
    helper = DecorationHelper(context: context);
    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    houseModels = await feedService.fetchUserHouseList();
    _changeLoading();
  }
}
