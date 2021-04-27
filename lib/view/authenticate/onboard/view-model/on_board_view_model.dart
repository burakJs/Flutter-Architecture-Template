import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constant/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;
  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int val) {
    currentIndex = val;
  }

  @override
  void init() {
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc,
        SVGImagePaths.instance!.adventureSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc,
        SVGImagePaths.instance!.calendarSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc,
        SVGImagePaths.instance!.readingSVG,
      ),
    );
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKey.IS_FIRST_APP, true);
    changeLoading();
    if (navigationService.navigatorKey.currentState!.canPop()) {
      navigationService.navigatorKey.currentState!.pop();
    } else {
      await navigationService.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
    }
  }
}
