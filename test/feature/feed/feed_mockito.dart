import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/viewmodel/social_view_model.dart';
import 'package:mockito/mockito.dart';

import 'social_network_mock.dart';

class SocialBuildContext extends Mock implements BuildContext {}

class SocialMockViewModel extends Mock implements SocialViewModel {
  SocialMockViewModel(SocialNetworkMock? mockService);

  @override
  bool isPageLoading = false;
}

class SocialFakeViewModel extends Fake implements SocialViewModel {
  SocialFakeViewModel(SocialNetworkMock mockService);
  @override
  BuildContext? context;
  @override
  List<SocialUser> socialUserList = [];

  @override
  bool isPageLoading = false;

  @override
  Future<void> fetchAllUserLoading(int index) async {
    isPageLoading = true;
    socialUserList = [SocialUser(name: '')];
    isPageLoading = false;

    await Future.delayed(Duration(seconds: 1));
  }

  @override
  void setContext(BuildContext? context) => this.context = context;
}
