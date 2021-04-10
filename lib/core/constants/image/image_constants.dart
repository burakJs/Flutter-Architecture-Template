class ImageConstants {
  static ImageConstants _instance;
  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get logo => toPng('veli');
  String get hotDog => toPng('hotdog');
  String toPng(String name) => 'assets/image/$name.png';
}
