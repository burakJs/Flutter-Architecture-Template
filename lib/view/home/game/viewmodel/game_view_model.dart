import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/service/GameService.dart';
import 'package:mobx/mobx.dart';
part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  final List<String> gameTabItems = [
    LocaleKeys.menu_game_tabbar_tab1,
    LocaleKeys.menu_game_tabbar_tab2,
    LocaleKeys.menu_game_tabbar_tab3,
    LocaleKeys.menu_game_tabbar_tab4,
    LocaleKeys.menu_game_tabbar_tab5
  ];
  final GameService gameService;
  List<SliderModel>? sliderItems = [];
  List<GameModel>? newsGameItems = [];
  List<GameModel>? topGameItems = [];
  _GameViewModelBase(this.gameService);

  @override
  void setContext(BuildContext context) => this.context = context;
  @observable
  bool isLoading = false;

  @override
  void init() {
    fetchSliderItems();
  }

  @action
  Future<void> fetchSliderItems() async {
    changeLoading();
    final response = await gameService.fetchSliderItems();
    sliderItems = response;
    changeLoading();
  }

  Future<List<GameModel>?> onNewsGameItems() async {
    if (newsGameItems!.isNotEmpty) return newsGameItems;
    final response = await gameService.fetchGameItems(GameEnum.NEW);
    newsGameItems = response;
    return response;
  }

  Future<List<GameModel>?> onTopGameItems() async {
    if (newsGameItems!.isNotEmpty) return topGameItems;
    final response = await gameService.fetchGameItems(GameEnum.TOP);
    topGameItems = response;
    return response;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
