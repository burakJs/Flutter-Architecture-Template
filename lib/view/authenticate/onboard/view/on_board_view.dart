import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_local_text.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/avatar/on_board_circle.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_constant/image_path_svg.dart';
import '../view-model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context))
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (index) {
        viewModel.changeCurrentIndex(index);
      },
      itemBuilder: (context, index) {
        return buildColumnBody(context, viewModel.onBoardItems[index]);
      },
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: buildListViewCircles(viewModel),
        ),
        Expanded(
          child: Center(child: Observer(builder: (_) {
            return Visibility(
              visible: viewModel.isLoading,
              child: CircularProgressIndicator(),
            );
          })),
        ),
        buildFloatingActionButtonSkip(context, viewModel),
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.paddingLow,
          child: Observer(builder: (_) {
            return OnBoardCircle(isSelected: viewModel.currentIndex == index);
          }),
        );
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        backgroundColor: context.colors.secondaryVariant,
        child: Icon(
          Icons.keyboard_arrow_right,
          color: context.colors.primaryVariant,
        ),
        onPressed: () {
          viewModel.completeToOnBoard();
        });
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    var padding2 = Padding(
      padding: context.paddingMediumHorizontal,
      child: buildAutoLocaleTextTitle(model, context),
    );
    return Column(
      children: [buildAutoLocaleTextDescription(model, context), padding2],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w100),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(fontWeight: FontWeight.bold, color: context.colors.onPrimary),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
