import 'package:chef_capp/index.dart';

class FontSizeCalc {
  static double mobileDisplayLarge(BuildContext context) {
    if(screenWidth(context) < 500) {
      return 36.0;
    } else {
      return 40.0;
    }
  }
}

class CCText {
  CCText._();

  static TextStyle mobileDisplayLarge(BuildContext context) {
    return GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: FontSizeCalc.mobileDisplayLarge(context),
    );
  }
  /*
  static TextStyle mobileDisplayLarge = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontSize: 48.0,
  );
  */
  static TextStyle mobileDisplayLargeBold = GoogleFonts.workSans(
    fontWeight: FontWeight.w700,
    fontSize: 48.0,
  );

  static TextStyle mobileDisplaySmall = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontSize: 24.0,
  );

  static TextStyle mobileTextSmall = GoogleFonts.firaSans(
    color: CCColors.greyscale40,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );

  static TextStyle tempSubHeader = TextStyle(
    color: CCColors.greyscale40,
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    letterSpacing: 1.8,
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