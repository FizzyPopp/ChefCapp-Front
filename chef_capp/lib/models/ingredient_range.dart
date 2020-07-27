import 'package:chef_capp/index.dart';

class IngredientRange extends Ingredient {
  final List<double> _range;

  IngredientRange(this._range, Ingredient i) : super(i.id, i.name, i.plural, i.quantity, i.unit) {
    if (_range.length != 2) {
      throw ("bad range");
    }
    if (_range[0] > _range[1]) {
      double tmp = _range[0];
      _range[0] = _range[1];
      _range[1] = tmp;
    }
  }

  double get quantity => -1;

  List<double> get range => _range;

  String get amount {
    String low = Ingredient.doubleToMixedFraction(_range[0]);
    String high = Ingredient.doubleToMixedFraction(_range[1]);

    if (low == high) {
      return "$low${this.unit}";
    } else {
      return "$low\u2013$high${this.unit}";
    }
  }
}