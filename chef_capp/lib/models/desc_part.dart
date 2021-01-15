import 'package:chef_capp/index.dart';
part 'desc_part.g.dart';

@JsonSerializable()
class DescPart implements EqualsInterface {
  String _text;
  TextMod _style;

  DescPart(String text, TextMod style) :
        this._text = text,
        this._style = style;

  String get text => _text;

  TextMod get style => _style;

  bool equals(var other) {
    if (other is! DescPart) return false;
    return jsonEncode(this.toJson()) == jsonEncode((other as DescPart).toJson());
  }

  factory DescPart.fromJson(Map<String, dynamic> json) => _$DescPartFromJson(json);

  Map<String, dynamic> toJson() => _$DescPartToJson(this);

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