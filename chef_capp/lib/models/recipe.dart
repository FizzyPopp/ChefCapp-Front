import 'package:chef_capp/index.dart';
import 'dart:math';

class Recipe {
  final ID _id;
  final String _title;
  final int _prepTime; // minutes, should probably spin into dedicated PrepTime class
  final List<Tag> _tags;
  final String _blurb;
  final List<Ingredient> _ingredients;
  final List<Equipment> _cookware;
  final List<RecipeStep> _steps;
  // images

  Recipe(this._id, this._title, this._prepTime, this._tags, this._blurb, this._ingredients, this._cookware, this._steps);

  bool get isPartial {
    return _id != null && _title != null && _prepTime != null && _tags != null && _blurb != null && _ingredients != null && _cookware != null && _steps != null;
  }

  // meant to convert a partial recipe to a full recipe, but probably need other fields to be updated too
  Recipe withSteps(List<RecipeStep> _newSteps) {
    return Recipe(_id, _title, _prepTime, _tags, _blurb, _ingredients, _cookware, _newSteps);
  }
}