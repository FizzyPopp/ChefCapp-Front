import 'package:chef_capp/index.dart';

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
  final Image _thumb;

  Recipe(this._id, this._title, this._prepTime, this._cookTime, this._calories, this._tags, this._ingredients, this._cookware, this._steps, this._thumb);

  static Recipe fromPreview(RecipePreview rp, List<RecipeStep> steps) {
    return Recipe(rp.id, rp.title, rp.prepTime, rp.cookTime, rp.calories, rp.tags, rp.ingredients, rp.cookware, RecipeStep.orderSteps(steps), rp.thumb);
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

  Image get thumb => _thumb;
}