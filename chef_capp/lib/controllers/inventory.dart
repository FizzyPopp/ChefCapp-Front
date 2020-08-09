import 'package:chef_capp/index.dart';
import 'dart:math';

/// will be responsible for ingredients list (what the user has on hand)
/// (read ingredients from db, modify ingredient amounts)
class InventoryController with ChangeNotifier {
  List<IngredientRange> ingredients;
  Map<String, List<IngredientRange>> forDisplay;
  bool updateDisplay;

  InventoryController() {
    ingredients = List<IngredientRange>();
    forDisplay = Map<String, List<IngredientRange>>();
    genDummyLists();
    parseIngredientsIntoDisplay();
  }

  void genDummyLists() {
    Random rnd = Random(ParentController.SEED);
    if (ingredients.length == 0) {
      int lim = 10;
      for (int i = 0; i < lim; i++) {
        ingredients.add(Dummy.ingredientRange(rnd.nextInt(1000)));
      }
    }
  }

  void parseIngredientsIntoDisplay() {
    // NEED TO WORK OUT CATEGORIES
    forDisplay["Category"] = [...ingredients];
  }

  void search(String s) {
    if (s == "") {
      parseIngredientsIntoDisplay();
    } else {
      forDisplay.keys.forEach((String key) {
        forDisplay[key].removeWhere((IngredientRange ir) => !ir.name.contains(s));
      });
      forDisplay.removeWhere((String _, List<IngredientRange> rows) => rows.length == 0);
    }
    notifyListeners();
  }
}