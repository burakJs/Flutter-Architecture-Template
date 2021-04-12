import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/thorottle_helper.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:mobx/mobx.dart';
part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  ISocialService _socialService;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int _page = 0;
  String _query = '';
  bool isLazyLoadDataFinish = false;

  ThorottleStringHelper _thorottleStringHelper;

  @observable
  List<SocialUser> socialUserList = [];

  @observable
  bool isPageLoading = false;

  @observable
  bool isPageLazyLoad = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _socialService = SocialService(vexanaManager.networkManager, scaffoldKey);
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
  void fetchAllSearchQuery(String text) {
    _thorottleStringHelper.onDelayTouch(text, (text) {
      if (_query.isEmpty) {
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
