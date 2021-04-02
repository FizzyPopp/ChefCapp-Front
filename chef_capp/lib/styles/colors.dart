import 'package:chef_capp/index.dart';

class CCColors {
  CCColors._();

  static const Color primary = Color(0xFFFF5722);

  static const Color secondary = Color(0xFF03DAC5);

  static const Color secondaryDark = Color(0xFF198F83);

  static const Color successDark = Color(0xFF177D2D);

  static const Color error = Color(0xFFEF0081);

  static const Color errorDark = Color(0xFF9A175E);

  static const Color greyscale40 = Color(0xFFA0A3BD);

  static const Gradient primaryGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFF5722),
      Color(0xFFAC24ED),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFAC24ED),
      Color(0xFF03DAC5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}