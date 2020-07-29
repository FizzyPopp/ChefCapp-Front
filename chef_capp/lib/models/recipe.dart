import 'package:chef_capp/index.dart';
part 'recipe.g.dart';

@JsonSerializable(explicitToJson: true)
class Recipe implements RecipeInterface {
  final ID _id;
  final String _title;
  final int _prepTime; // minutes, should probably spin into dedicated PrepTime class
  final int _cookTime;
  final int _calories;
  final List<Tag> _tags;
  final List<Ingredient> _ingredients;
  final List<Equipment> _cookware;
  final List<RecipeStep> _steps;
  final String _imgURL;

  Recipe(ID id, String title, int prepTime, int cookTime, int calories, List<Tag> tags, List<Ingredient> ingredients, List<Equipment> cookware, List<RecipeStep> steps, String imgURL) :
        this._id = id,
        this._title = title,
        this._prepTime = prepTime,
        this._cookTime = cookTime,
        this._calories = calories,
        this._tags = tags,
        this._ingredients = ingredients,
        this._cookware = cookware,
        this._steps = steps,
        this._imgURL = imgURL;

  static Recipe fromPreview(RecipePreview rp, List<RecipeStep> steps) {
    return Recipe(rp.id, rp.title, rp.prepTime, rp.cookTime, rp.calories, rp.tags, rp.ingredients, rp.cookware, RecipeStep.orderSteps(steps), rp.imgURL);
  }

  ID get id => _id;

  String get title => _title;

  int get prepTime => _prepTime;

  int get cookTime => _cookTime;

  int get calories => _calories;

  List<Tag> get tags => [..._tags];

  List<Ingredient> get ingredients => [..._ingredients];

  List<Equipment> get cookware => [..._cookware];

  List<RecipeStep> get steps => [..._steps];

  String get imgURL => _imgURL;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}