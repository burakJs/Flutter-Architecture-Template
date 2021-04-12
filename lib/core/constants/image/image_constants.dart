class ImageConstants {
  static ImageConstants _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('veli');
  String get hotDog => toPng('hotdog');
  String toPng(String name) => 'assets/image/$name.png';
}
