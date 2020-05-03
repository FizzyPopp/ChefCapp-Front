import 'package:chef_capp/index.dart';
import 'dart:math';

class RecipeStep {
  final ID _id;
  // tempting to put a reference to the parent Recipe here, but don't think instantiation would work with all these final fields
  final String _description;
  final List<Ingredient> _ingredients;
  RecipeStep(this._id, this._description, this._ingredients);
  static RecipeStep dummy(int seed) {
    Random rnd = Random(seed);
    return RecipeStep(
        ID.dummy(rnd.nextInt(100)),
        "a description",
        [Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100))] // this may break other code, as no guarantee that these ingredients are in the recipe
    );
  }
}