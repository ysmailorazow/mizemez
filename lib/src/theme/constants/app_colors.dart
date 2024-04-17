import 'dart:ui';

class AppColors {
  static const _singleton = AppColors._();

  factory AppColors() => _singleton;

  const AppColors._();

  static const Color black = Color.fromARGB(255, 28, 28, 29);
  static const Color lightBlack = Color.fromRGBO(30, 30, 30, 1.0);
  static const Color darkGrey = Color.fromRGBO(51, 57, 62, 1);
  static const Color white = Color.fromRGBO(250, 250, 250, 1);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color extraLightGrey = Color.fromRGBO(243, 243, 243, 1);
  static const Color grey = Color.fromARGB(255, 155, 155, 155);
  // background: rgba(155, 155, 155, 1);

  static const Color lightGrey = Color.fromARGB(255, 207, 207, 207);
  static const Color lightBlueGrey = Color.fromARGB(255, 220, 223, 226);
  static const Color card_grey =Color.fromRGBO(247, 247, 247, 1);


  static const Color lightGreen = Color.fromRGBO(165, 214, 167, 1);
  static const Color limeGreen = Color.fromRGBO(60, 195, 60, 1);
  // static const Color yellow = Color.fromRGBO(228, 206, 10, 1);
  static const Color yellow = Color.fromRGBO(243, 196, 28, 1);
  static const Color red = Color.fromRGBO(210, 0, 0, 1);
  static const Color darkRed = Color.fromRGBO(91, 0, 0, 1);
  static const Color redMedium = Color.fromARGB(255, 224, 59, 59);
  static const Color redLight = Color.fromRGBO(255, 214, 214, 1);
  static const Color orange = Color.fromARGB(255, 243, 123, 28); // main color
  static const Color brown = Color.fromRGBO(116, 51, 0, 1);
  static const Color lightBrown = Color.fromRGBO(206, 111, 0, 1);

  static const Color orangeMedium = Color.fromARGB(255, 240, 148, 73);
  static const Color orangeLight = Color.fromRGBO(255, 229, 209, 1);
  static const Color orangeMediumLight = Color.fromRGBO(249, 223, 204, 1);
  static const Color redAccent = Color.fromRGBO(255, 82, 82, 1);
  static const Color orangeAccent = Color.fromRGBO(255, 171, 63, 1);
  static const Color amberAccent = Color.fromRGBO(255, 215, 64, 1);
  static const Color purpleAccent = Color.fromRGBO(224, 64, 251, 1);
  static const Color cyanAccent = Color.fromRGBO(24, 255, 255, 1);
  static const Color blueAccent = Color.fromRGBO(68, 138, 255, 1);
  static const Color green = Color.fromRGBO(0, 150, 125, 1);

  static const Color beginner_color = Color.fromRGBO(13, 116, 254, 1);
  static const Color elementary_color = Color.fromRGBO(61, 200, 68, 1);
  static const Color pre_inter_color = Color.fromRGBO(239, 206, 8, 1);
  static const Color inter_color = Color.fromRGBO(248, 144, 29, 1);
  static const Color upper_color = Color.fromRGBO(248, 27, 47, 1);
  static const Color advanced_color = Color.fromRGBO(130, 2, 225, 1);


}
