import 'package:chef_capp/index.dart';

/// This is just Recipe without steps
class RecipePreview implements RecipeInterface {
  // serving size??
  final ID _id;
  final String _title;
  final int _prepTime; // minutes, should probably spin into dedicated PrepTime class
  final int _cookTime;
  final int _calories;
  final List<Tag> _tags;
  final List<Ingredient> _ingredients;
  final List<Equipment> _cookware;
  final List<String> _componentIDs;
  final String _imgURL;

  RecipePreview(this._id, this._title, this._prepTime, this._cookTime, this._calories, this._tags, this._ingredients, this._cookware, this._componentIDs, this._imgURL);

  ID get id => _id;

  String get title => _title;

  int get prepTime => _prepTime;

  int get cookTime => _cookTime;

  int get calories => _calories;

  List<Tag> get tags => [..._tags];

  List<Ingredient> get ingredients => [..._ingredients];

  List<Equipment> get cookware => [..._cookware];

  List<RecipeStep> get steps => [];

  List<String> get componentIDs => _componentIDs;

  String get imgURL => _imgURL;

  static RecipePreview fromDB(data, String imgURL) {
    // sanitize
    if (data["id"] == null ||
        data["id"] == "") {
      throw ("bad id");
    }
    if (data["name"] == null ||
        data["name"] is! Map ||
        data["name"]["singular"] == null ||
        data["name"]["singular"] == "") {
      throw ("bad name");
    }
    if (data["time"] == null ||
        data["time"] is! Map ||
        data["time"]["cook"] == null ||
        data["time"]["prepare"] == null) {
      throw ("bad time");
    }
    if (data["tags"] == null ||
        data["tags"] is! List) {
      throw ("bad tags");
    }
    if (data["ingredients"] == null ||
        data["ingredients"] is! Map) {
      throw ("bad ingredients");
    }
    if (data["components"] == null ||
        data["components"] is! List){
      throw ("bad components");
    }

    // parse
    String title = data["name"]["singular"];
    int prepTime = data["time"]["prepare"];
    int cookTime = data["time"]["cook"];
    int calories = 0;
    List<Tag> tags = [];
    data["tags"].forEach((t) {
      tags.add(Tag(Dummy.id(), t));
    });
    List<Ingredient> ingredients = Ingredient.listFromDB(data["ingredients"]);
    List<Equipment> cookware = [];

    // return
    return RecipePreview(ID(data["id"]), title, prepTime, cookTime, calories, tags, ingredients, cookware, List<String>.from(data["components"]), imgURL);
  }
}