import 'package:chef_capp/index.dart';

class Recipe {
  final ID _id;
  final String _title;
  final int _prepTime; // minutes, should probably spin into dedicated PrepTime class
  final int _cookTime;
  final int _calories;
  final List<Tag> _tags;
  final String _blurb;
  final List<Ingredient> _ingredients;
  final List<Equipment> _cookware;
  final List<RecipeStep> _steps;
  final Image _thumb;

  Recipe(this._id, this._title, this._prepTime, this._cookTime, this._calories, this._tags, this._blurb, this._ingredients, this._cookware, this._steps, this._thumb);

  bool get isPartial {
    return _id != null && _title != null && _prepTime != null && _cookTime != null && _calories != null && _tags != null && _blurb != null && _ingredients != null && _cookware != null && _steps != null && _thumb != null;
  }

  // meant to convert a partial recipe to a full recipe, but probably need other fields to be updated too
  Recipe withSteps(List<RecipeStep> _newSteps) {
    return Recipe(_id, _title, _prepTime, _cookTime, _calories, _tags, _blurb, _ingredients, _cookware, _newSteps, _thumb);
  }

  String get title => _title;

  int get prepTime => _prepTime;

  int get cookTime => _cookTime;

  int get calories => _calories;

  String get blurb => _blurb;

  Image get thumb => _thumb;
}