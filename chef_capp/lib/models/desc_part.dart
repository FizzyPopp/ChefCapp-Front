import 'package:chef_capp/index.dart';

class DescPart {
  String _text;
  TextMod _style;
  DescPart(this._text, this._style);
  String get text => _text;
  TextMod get style => _style;
}

enum TextMod {
  none,
  ingredient
}