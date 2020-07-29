import 'package:chef_capp/index.dart';
part 'recipe_preview.g.dart';

@JsonSerializable(explicitToJson: true)
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

  RecipePreview(ID id, String title, int prepTime, int cookTime, int calories, List<Tag> tags, List<Ingredient> ingredients, List<Equipment> cookware, List<String> componentIDs, String imgURL) :
        this._id = id,
        this._title = title,
        this._prepTime = prepTime,
        this._cookTime = cookTime,
        this._calories = calories,
        this._tags = tags,
        this._ingredients = ingredients,
        this._cookware = cookware,
        this._componentIDs = componentIDs,
        this._imgURL = imgURL;

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

  factory RecipePreview.fromJson(Map<String, dynamic> json) => _$RecipePreviewFromJson(json);

  Map<String, dynamic> toJson() => _$RecipePreviewToJson(this);

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
      tags.add(Tag(t));
    });
    List<Ingredient> ingredients = Ingredient.listFromDB(data["ingredients"]);
    List<Equipment> cookware = [];

    // return
    return RecipePreview(ID(data["id"]), title, prepTime, cookTime, calories, tags, ingredients, cookware, List<String>.from(data["components"]), imgURL);
  }
}