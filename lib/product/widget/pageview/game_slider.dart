import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:kartal/kartal.dart';

class GameSlider extends StatefulWidget {
  final List<SliderModel>? sliderModel;

  const GameSlider({Key? key, this.sliderModel}) : super(key: key);

  @override
  _GameSliderState createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  int _selectedValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: buildPageView(),
        ),
        Expanded(child: buildListViewCircleIndicator())
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemCount: widget.sliderModel!.length,
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: _changeValue,
      itemBuilder: (BuildContext context, int index) => buildCardImage(index),
    );
  }

  void _changeValue(int index) {
    setState(() {
      _selectedValueIndex = index;
    });
  }

  Widget buildCardImage(int index) => CachedNetworkImage(imageUrl: widget.sliderModel![index].image!);

  ListView buildListViewCircleIndicator() {
    return ListView.builder(
      itemCount: widget.sliderModel!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(context.dynamicWidth(0.01)),
          child: CircleAvatar(
            backgroundColor: _selectedValueIndex == index ? context.colorScheme.onError : context.colorScheme.onError.withOpacity(0.1),
            radius: 10,
          ),
        );
      },
    );
  }
}
