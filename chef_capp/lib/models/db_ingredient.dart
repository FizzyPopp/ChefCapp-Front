import 'package:chef_capp/index.dart';
//part 'ingredient.g.dart';

@JsonSerializable(explicitToJson: true)
// need to include a category?? (see kitchen_homepage.dart)
// YES, and maybe other info
class DBIngredient {
  // will need a heck of a lot more fields and maybe more classes to fully describe an ingredient
  final ID _id;
  final String _name;
  final int _timestamp;
  final String _category;
  final String _allergen;

  DBIngredient(ID id, String name, int timestamp, String category, String allergen) :
        this._id = id,
        this._name = name,
        this._timestamp = timestamp,
        this._category = category,
        this._allergen = allergen;

  ID get id => _id;

  String get name => _name;

  int get timestamp => _timestamp;

  String get category => _category;

  String get allergen => _allergen;

  //factory DBIngredient.fromJson(Map<String, dynamic> json) => _$DBIngredientFromJson(json);

  //Map<String, dynamic> toJson() => _$DBIngredientToJson(this);

  bool equals(DBIngredient other) {
    return this.id.equals(other.id);
  }

  static DBIngredient fromDB(data) {
    // sanitize
    if (data["id"] == null || data["id"] == "") {
      throw ("bad id");
    }
    if (data["name"] == null ||
        data["name"]["singular"] == null ||
        data["name"]["singular"] == "") {
      throw ("bad name");
    }
    if (data["timestamp"] == null) {
      throw ("bad timestamp");
    }
    if (data["category"] == null) {
      throw("bad category");
    }
    // data["allergen"] is optional, so null is valid

    // parse
    String name = data["name"]["singular"].toLowerCase();

    // return
    return DBIngredient(ID(data["id"]), name, data["timestamp"], data["category"], data["allergen"]);
  }
}
