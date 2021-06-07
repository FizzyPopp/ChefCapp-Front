import 'package:chef_capp/index.dart';

// if we store just Ingredient name and id (for fast reference), it's roughly 2mb per per 10,000 ingredients

class IngredientsWrangler {
  Map<ID, IngredientInterface> _allIngredients;

  IngredientsWrangler(Iterable<IngredientInterface> raw) {
    _allIngredients =  Map<ID, IngredientInterface>();
    for (IngredientInterface ingr in raw) {
      if (_allIngredients.containsKey(ingr.id)) {
        throw ("two or more ingredients have the same id");
      }
      _allIngredients[ingr.id] = ingr;
    }
  }

  Map<String, List<IngredientInterface>> _categorize(Iterable<IngredientInterface> base) {
    Map<String, List<IngredientInterface>> out = Map<String, List<IngredientInterface>>();
    base.forEach((ingr) {
      if (!out.containsKey(ingr.category)) {
        out[ingr.category] = <IngredientInterface>[];
      }
      out[ingr.category].add(ingr);
    });
    return out;
  }

  Map<String, List<IngredientInterface>> filter(String s) {
    if (s == "") {
      return _categorize(_allIngredients.values);
    }

    List<IngredientInterface> tmp = [..._allIngredients.values];
    tmp.removeWhere((IngredientInterface ingr) {
      return !ingr.name.toLowerCase().contains(s.toLowerCase());
    });
    return _categorize(tmp);
  }

  IngredientInterface getIngredientById(ID id) {
    return _allIngredients[id];
  }

  bool update(IngredientInterface ingr) {
    if (!_allIngredients.containsKey(ingr.id)) {
      return false;
    }
    _allIngredients[ingr.id] = ingr;
    return true;
  }

  bool add(IngredientInterface ingr) {
    if (_allIngredients.containsKey(ingr.id)) {
      return false;
    }
    _allIngredients[ingr.id] = ingr;
    return true;
  }

  bool removeIngredient(IngredientInterface ingr) {
    return (_allIngredients.remove(ingr.id) != null);
  }
}