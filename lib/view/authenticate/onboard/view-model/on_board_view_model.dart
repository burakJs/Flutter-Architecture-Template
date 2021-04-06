import 'package:flutter/material.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../model/on_board_model.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = OonBoardViewModelBase with _$OnBoardViewModel;

abstract class OonBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {
    onBoardModel = List.generate(5, (index) => OnBoardModel(index.toString()));
  }

  List<OnBoardModel> onBoardModel;

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }
}
