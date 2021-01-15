import 'package:chef_capp/index.dart';

class CCText {
  CCText._();

  static TextStyle mobileDisplayLarge = GoogleFonts.workSans(
    fontWeight: FontWeight.w700,
    fontSize: 48.0,
  );

  static const TextStyle lightButton = TextStyle(
    color: CCColors.primary,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    letterSpacing: 1.0,
  );

  static const TextStyle darkButton = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    letterSpacing: 1.0,
  );
}