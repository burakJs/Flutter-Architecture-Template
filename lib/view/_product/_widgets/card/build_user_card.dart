import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../home/build/feed/model/house_model.dart';

class BuildUserCard extends StatelessWidget {
  final HouseModel model;
  final bool isLiked;
  final Function(String? id)? onPressedLikeId;
  const BuildUserCard({Key? key, required this.model, this.onPressedLikeId, this.isLiked = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(backgroundImage: NetworkImage(model.user!.image!)),
          title: Text(model.user!.name!),
          subtitle: Text(model.user!.date!),
          trailing: buildIconButton(),
        ),
        context.emptySizedHeightBoxLow,
        buildWrap(context)
      ],
    );
  }

  Widget buildWrap(BuildContext context) {
    return Column(
      // direction: Axis.vertical,
      children: [
        AutoSizeText(
          model.title!,
          style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
        ),
        AutoSizeText(model.description!),
      ],
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: isLiked ? Colors.pink : Colors.black12,
        // color: feedViewModel.likeItems.contains(model.id) ? Colors.pink : Colors.white30,
      ),
      onPressed: () {
        if (onPressedLikeId != null) onPressedLikeId!(model.id);
      },
    );
  }
}
