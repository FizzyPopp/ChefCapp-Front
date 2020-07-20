import 'package:chef_capp/index.dart';

class IngredientRange {
  final Ingredient _ingredient;
  final List<double> _range;

  IngredientRange(this._ingredient, this._range);

  IngredientRange.fromIngredient(this._ingredient, double low, double high) : this._range = [low, high];

  ID get id => _ingredient.id;

  String get name => _ingredient.name;

  Ingredient get ingredient => _ingredient;

  List<double> get range => _range;

  String get amount {
    if (_range.length != 2) {
      return "";
    } else if (_range[0] == 0 && _range[1] == 0) {
      return "";
    }

    if (_range[0] == _range[1]) {
      return Ingredient.doubleToMixedFraction(_range[0]) + _ingredient.unit;
    }

    double low = _range[0];
    double high = _range[1];
    if (low > _range[1]) {
      low = _range[1];
      high = _range[0];
    }

    return Ingredient.doubleToMixedFraction(low) + "\u2013" + Ingredient.doubleToMixedFraction(high) + _ingredient.unit;
  }
}