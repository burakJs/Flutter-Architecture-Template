import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/service_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:fluttermvvmtemplate/view/home/game/service/IGameService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class GameService extends IGameService with ServiceHelper {
  GameService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey) : super(manager, scaffoldKey);

  @override
  Future<List<GameModel>?> fetchGameItems(GameEnum type) async {
    final response = await manager.send<GameModel, List<GameModel>>(
      NetworkRoutes.GAME.rawValue,
      urlSuffix: '/${type.index + 1}',
      parseModel: GameModel(),
      method: RequestType.GET,
    );
    showMessage(scaffoldKey, response.error);

    await Future.delayed(Duration(seconds: 5));
    return response.data;
  }

  @override
  Future<List<SliderModel>?> fetchSliderItems() async {
    final response =
        await manager.send<SliderModel, List<SliderModel>>(NetworkRoutes.GAME.rawValue, parseModel: SliderModel(), method: RequestType.GET);
    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
