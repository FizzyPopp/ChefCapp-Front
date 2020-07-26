import 'package:chef_capp/index.dart';

class IngredientRange extends Ingredient {
  final List<double> _range;

  IngredientRange(this._range, Ingredient i) : super(i.id, i.name, i.plural, i.quantity, i.unit);

  List<double> get range => _range;

  String get amount {
    if (_range.length != 2) {
      return "";
    } else if (_range[0] == 0 && _range[1] == 0) {
      return "";
    }

    if (_range[0] == _range[1]) {
      return Ingredient.doubleToMixedFraction(_range[0]) + this.unit;
    }

    double low = _range[0];
    double high = _range[1];
    if (low > _range[1]) {
      low = _range[1];
      high = _range[0];
    }

    return Ingredient.doubleToMixedFraction(low) + "\u2013" + Ingredient.doubleToMixedFraction(high) + this.unit;
  }
}