import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/product/button/header_button.dart';
import 'package:fluttermvvmtemplate/product/grid/game_grid_view.dart';
import 'package:fluttermvvmtemplate/product/widget/pageview/game_slider.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_view_state.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/service/GameService.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/game_view_model.dart';

part './subview/game_view_card.dart';

class GameView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(GameService(VexanaManager.instance.networkManager, _scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, GameViewModel value) => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: Observer(builder: (_) {
          return value.isLoading
              ? Center(child: CircularProgressIndicator())
              : DefaultTabController(
                  length: value.gameTabItems.length,
                  child: ListView.builder(
                    itemCount: GameViewItems.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      switch (GameViewItems.values[index]) {
                        case GameViewItems.SEARCH_BAR:
                          return buildPaddingSearchBar(context);
                        case GameViewItems.TABBAR:
                          return buildTabBar(context, value);
                        case GameViewItems.SLIDER:
                          return buildSizedBoxSlider(context, value.sliderItems);
                        case GameViewItems.NEW_UPDATE_GAMES_CARD:
                          return buildColumnNewCard(value);
                        case GameViewItems.TOP_UPDATE_GAMES_CARD:
                          return buildColumnUpdate(value);
                        default:
                          throw Exception('STATE NOT FOUND');
                      }
                    },
                  ),
                );
        }),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.rounded_corner),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_enhance))],
      title: Text(
        LocaleKeys.menu_game_title.tr(),
        style: context.textTheme.headline5!.apply(color: context.colorScheme.onError, fontWeightDelta: 2),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context, GameViewModel value) {
    return TabBar(
      isScrollable: true,
      indicatorColor: context.colorScheme.onError,
      labelPadding: EdgeInsets.zero,
      indicatorWeight: 3,
      tabs: value.gameTabItems
          .map(
            (e) => Tab(child: Padding(padding: context.paddingLow, child: Text(e.tr()))),
          )
          .toList(),
    );
  }

  Widget buildSizedBoxSlider(BuildContext context, List<SliderModel>? items) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: GameSlider(
        sliderModel: items,
      ),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        decoration: InputDecoration(prefix: Icon(Icons.search)),
      ),
    );
  }
}
