import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constant.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String get isValidEmail =>
      this.contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? null : 'Email does not found';
}
