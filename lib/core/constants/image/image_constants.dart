class ImageConstants {
  static ImageConstants _instance;
  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get logo => toPng('veli');
  String toPng(String name) => 'assets/image/$name';
}
