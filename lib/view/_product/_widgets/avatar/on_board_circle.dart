import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  final isSelected;

  const OnBoardCircle({Key key, @required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colors.onError.withOpacity(isSelected ? 1 : 0.2),
      radius: isSelected ? context.width * 0.015 : 0.01,
    );
  }
}
