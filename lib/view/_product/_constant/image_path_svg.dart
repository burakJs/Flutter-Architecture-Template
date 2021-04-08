import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths _instance;
  static SVGImagePaths get instance {
    if (_instance == null) _instance = SVGImagePaths._init();
    return _instance;
  }

  SVGImagePaths._init();

  final adventureSVG = 'adventure_svg'.toSVG;
  final calendarSVG = 'calendar_svg'.toSVG;
  final readingSVG = 'reading_svg'.toSVG;
}
