import 'package:chef_capp/index.dart';

class IngredientController with ChangeNotifier {
  final IngredientsWrangler _wrangler;
  IngredientInterface _ingredient;
  bool _isEstimate;
  bool _isExisting;

  IngredientController(this._wrangler, ID id) {
    _ingredient = _wrangler.getIngredientById(id);
    _isEstimate = (_ingredient is IngredientRange);
    _isExisting = true;
  }

  IngredientController.empty(this._wrangler) {
    _isEstimate = false;
    _isExisting = false;
  }

  String get label => _ingredient?.name ?? "";

  bool get isExisting => _isExisting;

  bool get isEstimate => _isEstimate;

  void onConfirm(context) {
    if (_isExisting) {
      // we are modifying an existing ingredient
      if (_isEstimate && _ingredient is! IngredientRange) {
        _ingredient = IngredientRange([0,0], _ingredient);
      } else if (!_isEstimate && _ingredient is IngredientRange) {
        _ingredient = Ingredient.fromRange(_ingredient);
      }
      _wrangler.update(_ingredient);
    } else {
      // we are creating a new ingredient
      Ingredient ingr = Dummy.ingredient(5);
      _wrangler.add(ingr);
    }
    Navigator.pop(context);
  }

  void onDelete(context) {
    if (_isExisting) {
      // remove an existing ingredient
      _wrangler.removeIngredient(_ingredient);
    }
    ParentController.inventory.updateDisplay();
    Navigator.pop(context);
  }

  void onEstimateChanged(bool newVal) {
    _isEstimate = newVal;
    notifyListeners();
  }
}