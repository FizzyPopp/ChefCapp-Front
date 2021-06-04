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

  DBIngredient(ID id, String name, int timestamp) :
        this._id = id,
        this._name = name,
        this._timestamp = timestamp;

  ID get id => _id;

  String get name => _name;

  int get timestamp => _timestamp;

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

    // parse
    String name = data["name"]["singular"].toLowerCase();

    // return
    return DBIngredient(ID(data["id"]), name, data["timestamp"]);
  }
}
