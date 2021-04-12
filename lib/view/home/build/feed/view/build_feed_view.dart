import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/base/view/base_widget.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../_product/_widgets/card/build_user_card.dart';
import '../model/house_model.dart';
import '../viewmodel/build_feed_view_model.dart';
import 'package:kartal/kartal.dart';

class BuildFeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.format_align_left)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: DefaultTabController(
            length: 4,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenter()
                  : viewModel.houseModels == null || viewModel.houseModels.isEmpty
                      ? Center(
                          child: Text('Not Found'),
                        )
                      : buildListViewRecommended(viewModel, context);
            })),
      ),
    );
  }

  ListView buildListViewRecommended(BuildFeedViewModel viewModel, BuildContext context) {
    return ListView(
      padding: context.paddingLow,
      children: [
        buildTabBar(viewModel),
        buildSizedBoxLastestPageView(context, viewModel),
        context.emptySizedHeightBoxLow,
        Text(LocaleKeys.menu_build_subTitle.tr(), style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.w600)),
        context.emptySizedHeightBoxLow,
        buildListViewBottom(viewModel),
      ],
    );
  }

  ListView buildListViewBottom(BuildFeedViewModel viewModel) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
          height: context.dynamicHeight(0.15),
          child: Card(
            child: Row(
              children: [
                Expanded(flex: 3, child: Image.network(viewModel.houseModels[index].image)),
                Expanded(flex: 9, child: buildObserver(viewModel, index)),
              ],
            ),
          )),
      itemCount: 3,
      shrinkWrap: true,
    );
  }

  Observer buildObserver(BuildFeedViewModel viewModel, int index) {
    return Observer(builder: (_) {
      return BuildUserCard(
        model: viewModel.houseModels[index],
        isLiked: viewModel.likeItems.contains(
          viewModel.houseModels[index].id,
        ),
        onPressedLikeId: (id) {
          viewModel.onLikeItemPressed(id);
        },
      );
    });
  }

  SizedBox buildSizedBoxLastestPageView(BuildContext context, BuildFeedViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemBuilder: (context, index) => buildStackFloaty(context, viewModel.sliderHouse, viewModel),
        itemCount: 3,
      ),
    );
  }

  TabBar buildTabBar(BuildFeedViewModel viewModel) {
    return TabBar(indicator: viewModel.helper.circleDecoration, indicatorSize: TabBarIndicatorSize.label, isScrollable: true, tabs: [
      Tab(text: LocaleKeys.menu_build_tabbar_tab1.tr()),
      Tab(text: LocaleKeys.menu_build_tabbar_tab2.tr()),
      Tab(text: LocaleKeys.menu_build_tabbar_tab3.tr()),
      Tab(text: LocaleKeys.menu_build_tabbar_tab4.tr()),
    ]);
  }

  Center buildCenter() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildStackFloaty(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 100,
            left: -50,
            right: -50,
            child: Image.network(
              model.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 120,
            left: 50,
            right: 50,
            child: buildCard(context, model, viewModel),
          )
        ],
      ),
    );
  }

  Card buildCard(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Observer(builder: (_) {
          return BuildUserCard(
            model: model,
            isLiked: viewModel.likeItems.contains(model.id),
            onPressedLikeId: (id) {
              viewModel.onLikeItemPressed(id);
            },
          );
        }),
      ),
    );
  }
}
