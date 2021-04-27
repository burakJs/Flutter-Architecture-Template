import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_model/query/friend_query.dart';
import '../../../_product/_utility/thorottle_helper.dart';
import '../model/social_user_model.dart';
import '../service/ISocialService.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  final ISocialService _socialService;
  int _page = 0;
  String? _query = '';
  bool isLazyLoadDataFinish = false;
  int get page => _page;
  late ThorottleStringHelper _thorottleStringHelper;

  @observable
  List<SocialUser> socialUserList = [];

  @observable
  bool isPageLoading = false;

  @observable
  bool isPageLazyLoad = false;

  _SocialViewModelBase(this._socialService);

  @override
  void setContext(BuildContext? context) => this.context = context;
  @override
  void init() {
    _thorottleStringHelper = ThorottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserList(FriendQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    // ignore: dead_code
    if (isPageLazyLoad = true || index != socialUserList.length - 1 || isLazyLoadDataFinish) return;

    _changeLoading();
    final response = await _socialService.fetchUserList(FriendQuery(limit: _page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      }
      if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }

      _page++;
    } else {
      isLazyLoadDataFinish = true;
    }
    _changeLoading();
  }

  @action
  Future<void> fetchAllSearchQuery(String text) async {
    _thorottleStringHelper.onDelayTouch(text, (text) {
      if (_query!.isEmpty) {
        _page = -1;
      }
      _query = text;
      isPageLazyLoad = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList.length - 1);
    });
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazyLoad() {
    isPageLazyLoad = !isPageLazyLoad;
  }
}
