import 'package:chef_capp/index.dart';
part 'ingredient_range.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientRange extends Ingredient {
  final List<double> _range;

  IngredientRange(List<double> range, Ingredient ingredient) :
        this._range = range,
        super(ingredient.id, ingredient.name, ingredient.plural, ingredient.quantity, ingredient.unit, ingredient.category) {
    if (_range.length != 2 || range[0] < 0 || range[1] < 0) {
      throw ("bad range");
    }
    if (_range[0] > _range[1]) {
      double tmp = _range[0];
      _range[0] = _range[1];
      _range[1] = tmp;
    }
  }

  List<double> get range => [..._range];

  Ingredient get ingredient => Ingredient(this.id, this.name, this.plural, this.quantity, this.unit, this.category);

  factory IngredientRange.fromJson(Map<String, dynamic> json) => _$IngredientRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientRangeToJson(this);

  @override
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