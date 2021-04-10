import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constant.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  bool get isValidEmail => RegExp(ApplicationConstants.EMAIL_REGEX).hasMatch(this);
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
