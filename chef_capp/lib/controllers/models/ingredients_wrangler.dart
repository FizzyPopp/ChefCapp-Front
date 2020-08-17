import 'package:chef_capp/index.dart';

// TODO: is this implementation efficient?
class IngredientsWrangler {
  List<IngredientInterface> _allIngredients;

  IngredientsWrangler(this._allIngredients);

  Map<String, List<IngredientInterface>> _categorize(List<IngredientInterface> base) {
    Map<String, List<IngredientInterface>> out = Map<String, List<IngredientInterface>>();
    base.forEach((ingr) {
      if (!out.containsKey(ingr.category)) {
        out[ingr.category] = List<IngredientInterface>();
      }
      out[ingr.category].add(ingr);
    });
    return out;
  }

  Map<String, List<IngredientInterface>> filter(String s) {
    if (s == "") {
      return _categorize(_allIngredients);
    }

    List<IngredientInterface> tmp = [..._allIngredients];
    tmp.removeWhere((IngredientInterface ingr) {
      return !ingr.name.toLowerCase().contains(s.toLowerCase());
    });
    return _categorize(tmp);
  }

  IngredientInterface getIngredientById(ID id) {
    IngredientInterface out;
    bool found = false;
    for (IngredientInterface ingr in _allIngredients) {
      if (ingr.id.equals(id)) {
        found = true;
        out = ingr;
        break;
      }
    }

    if (!found) {
      throw("Could not find matching ingredient");
    }

    return out;
  }

  bool removeIngredient(ID id) {
    int initialLength = _allIngredients.length;
    _allIngredients.removeWhere((ingr) {
      return ingr.id.equals(id);
    });
    return (initialLength != _allIngredients.length);
  }
}