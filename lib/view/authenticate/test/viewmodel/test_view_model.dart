import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false).changeValue(AppThemes.DARK);
  }

  void getSampleRequest() {
    isLoading = true;
    NetworkManager.instance.dioGet<TestModel>('x', TestModel());
    isLoading = false;
  }
}
