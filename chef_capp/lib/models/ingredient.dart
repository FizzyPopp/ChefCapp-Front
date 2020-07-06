import 'package:chef_capp/index.dart';

class Ingredient {
  // will need a heck of a lot more fields and maybe more classes to fully describe an ingredient
  final ID _id;
  final String _name;
  final String _plural;
  final double _quantity;
  final String _unit;

  Ingredient(this._id, this._name, this._plural, this._quantity, this._unit);

  ID get id => _id;

  String get name => _name;

  String get plural => _plural;

  double get quantity => _quantity;

  String get amount {
    String out;
    if (_quantity == 0) {
      return "";
    } else if (_quantity == _quantity.toInt()) {
      out = "${_quantity.toInt()} $_unit";
    } else {
      out = "$_quantity $_unit";
    }
    return out;
  }

  bool equals(Ingredient other) {
    return this.id.equals(other.id);
  }

  static Ingredient fromDB(data) {
    // sanitize
    if (data["id"] == null || data["id"] == "") {
      throw ("bad id");
    }
    if (data["name"] == null ||
        data["name"] is! Map ||
        data["name"]["singular"] == null ||
        data["name"]["singular"] == "") {
      throw ("bad name");
    }
    if (data["quantity"] == null || data["quantity"] == "") {
      throw ("bad quantity");
    }
    if (data["unit"] == null) {
      throw ("bad unit");
    }

    // parse
    double quantity = data["quantity"].toDouble();
    String unit = data["unit"];
    String name = data["name"]["singular"];
    String plural = (data["name"]["plural"] ?? name);

    // return
    return Ingredient(ID(data["id"]), name, plural, quantity, unit);
  }

  static List<Ingredient> listFromDB(data) {
    if (data.isEmpty) {
      return [];
    }

    List<String> keys;
    List<Ingredient> unsortedIngredients = [];
    // get keys and parse ingredients
    data.forEach((k, v) {
      if (k == "keys") {
        keys = List<String>.from(v);
      } else {
        unsortedIngredients.add(Ingredient.fromDB(v));
      }
    });
    // sanitize
    if (keys == null) {
      throw("no keys for ingredients");
    }
    // order ingredients
    List<Ingredient> ingredients = [];
    for (int k = 0; k < keys.length; k++) {
      for (int i = 0; i < unsortedIngredients.length; i++) {
        if (unsortedIngredients[i].id.toString() == keys[k]) {
          ingredients.add(unsortedIngredients.removeAt(i));
          break;
        }
      }
    }
    // sanitize
    if (ingredients.length != keys.length) {
      throw ("ingredient keys do not match actual ingredients");
    }
    return ingredients;
  }
}
