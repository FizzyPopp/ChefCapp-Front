import 'package:chef_capp/index.dart';
import 'dart:math';

/// will be responsible for ingredients list (what the user has on hand)
/// (read ingredients from db, modify ingredient amounts)
class InventoryController with ChangeNotifier {
  Map<String, List<IngredientInterface>> forDisplay;
  IngredientsWrangler _ingredients;

  InventoryController() {
    List<IngredientInterface> fake = genDummyList();
    _ingredients = IngredientsWrangler(fake);
    updateDisplay();
  }

  List<IngredientInterface> genDummyList() {
    int lim = 20;
    Random rnd = Random(ParentController.SEED);
    List<IngredientInterface> out = [];
    for (int i = 0; i < lim; i++) {
      if (rnd.nextDouble() > .6) {
        out.add(Dummy.ingredient(rnd.nextInt(1000)));
      } else {
        out.add(Dummy.ingredientRange(rnd.nextInt(1000)));
      }
    }
    return out;
  }

  void search(String s) {
    forDisplay = _ingredients.filter(s);
    notifyListeners();
  }

  void updateDisplay() {
    forDisplay = _ingredients.filter("");
    notifyListeners();
  }

  void onTap(context, ID id) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => IngredientAdjust(
        controller: IngredientController(_ingredients, id),
      ),
      settings: RouteSettings(name: context.widget.runtimeType.toString()),
    ));
  }
}