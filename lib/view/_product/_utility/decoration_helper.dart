import 'package:flutter/cupertino.dart';

import '../../../core/components/decoration/circle_decoration.dart';
import '../../../core/extension/context_extension.dart';

class DecorationHelper {
  BuildContext? context;
  DecorationHelper({
    this.context,
  });
  Decoration get circleDecoration => CircleDecoration(color: context!.colors.surface, radius: 3);
}
