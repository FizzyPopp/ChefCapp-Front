import 'package:chef_capp/index.dart';
part 'ingredient_range.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientRange extends Ingredient {
  final List<double> _range;

  IngredientRange(List<double> range, Ingredient ingredient) :
        this._range = range,
        super(ingredient.id, ingredient.name, ingredient.plural, ingredient.quantity, ingredient.unit) {
    if (_range.length != 2) {
      throw ("bad range");
    }
    if (_range[0] > _range[1]) {
      double tmp = _range[0];
      _range[0] = _range[1];
      _range[1] = tmp;
    }
  }

  @override
  double get quantity => -1;

  List<double> get range => [..._range];

  Ingredient get ingredient => this as Ingredient;

  factory IngredientRange.fromJson(Map<String, dynamic> json) => _$IngredientRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientRangeToJson(this);

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