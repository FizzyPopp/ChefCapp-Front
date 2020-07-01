import 'package:chef_capp/index.dart';

class Ingredient {
  // will need a heck of a lot more fields and maybe more classes to fully describe an ingredient
  final ID _id;
  final String _name;
  final double _quantity;
  final String _unit;

  Ingredient(this._id, this._name, this._quantity, this._unit);

  ID get id => _id;

  String get name => _name;

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

  static Ingredient fromDB(data) {
    // sanitize
    if (data["id"] == null || data["id"] == "") {
      throw ("bad id");
    }
    if (data["name"] == null ||
        ((data["name"]["singular"] == null || data["name"]["singular"] == "") &&
            (data["name"]["plural"] == null || data["name"]["plural"] == ""))) {
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

    // return
    return Ingredient(ID(data["id"]), name, quantity, unit);
  }
}
