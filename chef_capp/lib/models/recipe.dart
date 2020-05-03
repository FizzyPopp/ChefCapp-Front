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

  static Recipe dummy(int seed) {
    Random rnd = Random(seed);
    return Recipe(
        ID.dummy(rnd.nextInt(100)),
        "A Recipe Title",
        (1 + rnd.nextInt(179)),
        [Tag.dummy(rnd.nextInt(100)), Tag.dummy(rnd.nextInt(100))],
        "This recipe brought my grandmother back to life",
        [Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100))],
        [Equipment.dummy(rnd.nextInt(100)), Equipment.dummy(rnd.nextInt(100))],
        [RecipeStep.dummy(rnd.nextInt(100)), RecipeStep.dummy(rnd.nextInt(100))]
    );
  }
}