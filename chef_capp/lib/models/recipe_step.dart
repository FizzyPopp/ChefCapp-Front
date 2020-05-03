import 'package:chef_capp/index.dart';
import 'dart:math';

class RecipeStep {
  final ID _id;
  // tempting to put a reference to the parent Recipe here, but don't think instantiation would work out with all these final fields
  final String _description;
  final List<Ingredient> _ingredients;
  RecipeStep(this._id, this._description, this._ingredients);
}