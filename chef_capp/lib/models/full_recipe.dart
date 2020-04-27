import 'package:chef_capp/index.dart';
import 'dart:math';

class FullRecipe {
  int id;
  String title;
  int prepTime; // minutes
  List<Tag> tags;
  String blurb;
  List<Ingredient> ingredients;
  List<Equipment> cookware;
  List<RecipeStep> steps;
  // images
  FullRecipe.dummy(int seed) {
    Random rnd = Random(seed);
    this.id = rnd.nextInt(100);
    this.title = "A Recipe Title";
    this.prepTime = 1 + rnd.nextInt(179);
    this.tags = [Tag.dummy(rnd.nextInt(100)), Tag.dummy(rnd.nextInt(100))];
    this.blurb = "This recipe brought my grandmother back to life";
    this.ingredients = [Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100))];
    this.cookware = [Equipment.dummy(rnd.nextInt(100)), Equipment.dummy(rnd.nextInt(100))];
    this.steps = [RecipeStep.dummy()];
  }
}

class RecipeStep {
  String description;
  List<Ingredient> ingredients;
  RecipeStep.dummy() {
    this.description = "Let cool for seven minutes";
    this.ingredients = [];
  }
}