import 'package:chef_capp/index.dart';

class DescPart {
  String _text;
  TextMod _style;
  DescPart(this._text, this._style);
  String get text => _text;
  TextMod get style => _style;

  static stringToTextMod(String s) {
    switch (s) {
      case "copy":
        return TextMod.copy;
      case "quantity":
        return TextMod.quantity;
      case "unit":
        return TextMod.unit;
      case "name":
        return TextMod.name;
      default:
        return TextMod.copy;
    }
  }
}

enum TextMod {
  copy, // aka none
  quantity,
  unit,
  name // of an ingredient
}