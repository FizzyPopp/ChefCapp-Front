import 'package:chef_capp/index.dart';
part 'ingredient.g.dart';

@JsonSerializable(explicitToJson: true)
// need to include a category?? (see kitchen_homepage.dart)
class Ingredient implements IngredientInterface {
  // will need a heck of a lot more fields and maybe more classes to fully describe an ingredient
  final ID _id;
  final String _name;
  final String _plural;
  final double _quantity;
  final String _unit;
  final String _category;
  final List<double> _range;
  DBIngredient _dbIngredient;

  Ingredient(ID id, String name, String plural, double quantity, String unit, String category) :
        this._id = id,
        this._name = name,
        this._plural = plural,
        this._quantity = quantity,
        this._unit = unit,
        this._category = category,
        this._range = [quantity, quantity],
        this._dbIngredient = null {
    getDBIngredient();
  }

  Ingredient.fromRange(IngredientRange ir) :
        this._id = ir.id,
        this._name = ir.name,
        this._plural = ir.plural,
        this._quantity = ir.quantity,
        this._unit = ir.unit,
        this._category = ir.category,
        this._range = [ir.quantity, ir.quantity],
        this._dbIngredient = null {
    getDBIngredient();
  }

  ID get id => _id;

  String get name => _name;

  String get plural => _plural;

  double get quantity => _quantity;

  String get unit => _unit;

  String get category {
    if (_dbIngredient != null) {
      return _dbIngredient.category;
    } else {
      return this._category;
    }
  }

  List<String> get allergens {
    if (_dbIngredient != null) {
      return _dbIngredient.allergens;
    } else {
      return [];
    }
  }

  List<double> get range => [..._range];


  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  Future<void> getDBIngredient() async {
    this._dbIngredient = await ParentService.database.getDBIngredient(this._id);
  }

  bool equals(Ingredient other) {
    return this.id.equals(other.id);
  }

  String get amount {
    String out;
    if (_quantity == 0) {
      return "";
    } else {
      out = "${doubleToMixedFraction(_quantity)}$_unit";
    }
    return out;
  }

  static String doubleToMixedFraction (double v) {
    int whole = v.floor();
    int numerator = ((v - whole) * 12).round();

    String fraction = "";

    switch (numerator) {
      case 0:
        // round down
        return "$whole";
      case 1:
        // round down
        return "$whole";
        break;
      case 2:
        // round up
        fraction = "\u00BC";
        break;
      case 3:
        // 3/12 = one quarter
        fraction = "\u00BC";
        break;
      case 4:
        // 4/12 = one third
        fraction = "\u2153";
        break;
      case 5:
        // round up
        fraction = "\u00BD";
        break;
      case 6:
        // 6/12 = one half
        fraction = "\u00BD";
        break;
      case 7:
        // round down
        fraction = "\u00BD";
        break;
      case 8:
        // 8/12 = two thirds
        fraction = "\u2154";
        break;
      case 9:
        // 9/12 = three quarters
        fraction = "\u00BE";
        break;
      case 10:
        // round down
        fraction = "\u00BE";
        break;
      case 11:
        // round up
        return "${whole + 1}";
      case 12:
        // round up
        return "${whole + 1}";
      default:
        throw ("bad conversion to mixed fraction");
    }

    if (whole == 0) {
      return fraction;
    } else {
      return "$whole" + fraction;
    }
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
    String unit = data["unit"]["singular"];
    String name = data["name"]["singular"];
    String plural = (data["name"]["plural"] ?? name);

    // TODO: get category

    // return
    return Ingredient(ID(data["id"]), name, plural, quantity, unit, "");
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
