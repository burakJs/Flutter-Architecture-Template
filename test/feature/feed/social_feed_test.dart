import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';

import 'package:mockito/mockito.dart';
import 'package:vexana/vexana.dart';
import 'feed_mockito.dart';
import 'social_network_mock.dart';

void main() {
  BuildContext? context;
  SocialNetworkMock? mockService;
  INetworkManager networkManager;
  late SocialMockViewModel socialMockViewModel;

  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager(options: BaseOptions());
    mockService = SocialNetworkMock(networkManager, null);
    socialMockViewModel = SocialMockViewModel(mockService);
    socialMockViewModel.setContext(context);
  });
  test('Context Test', () async {
    verify(socialMockViewModel.setContext(context));
  });
  test('List Check', () async {
    await socialMockViewModel.fetchAllUserLoading(0);
    when(socialMockViewModel.fetchAllUserLoading(1)).thenReturn(Future.value());
    expect(socialMockViewModel.socialUserList.length, 1);
  });
  test('Loading Test', () async {
    await socialMockViewModel.fetchAllUserLoading(1);
    expect(socialMockViewModel.isPageLoading, false);
    await Future.delayed(Duration(seconds: 1));
    expect(socialMockViewModel.isPageLoading, false);
  });
  test('User All Loading', () async {
    socialMockViewModel.isPageLazyLoad = false;
    socialMockViewModel.socialUserList = [];
    socialMockViewModel.isLazyLoadDataFinish = false;

    await socialMockViewModel.fetchAllUserLoading(-1);
    expect(socialMockViewModel.socialUserList.isNotEmpty, true);
    expect(socialMockViewModel.page > 0, true);
    expect(socialMockViewModel.isPageLoading, false);
  });
  test('Fetch User Id', () async {
    final response = await mockService!.fetchUser(10);
    expect(response, isNotNull);
  });

  test('Fetch House Id', () async {
    final response = await mockService!.fetchUserList(FriendQuery());
    expect(response, isNotEmpty);
  });

  test('Fetch User Name Query', () async {
    final response = await mockService!.fetchUserNameQuery('hello');
    expect(response, isNotEmpty);
  });
}
