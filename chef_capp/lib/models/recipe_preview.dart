import 'package:chef_capp/index.dart';
import 'dart:math';

class RecipePreview {
  Recipe r;
  // images
  RecipePreview.dummy(int seed) {
    Random rnd = new Random(seed);
    var id = rnd.nextInt(100);
    var title = "A Recipe Title";
    var prepTime = 1 + rnd.nextInt(179);
    var tags = [Tag.dummy(rnd.nextInt(100)), Tag.dummy(rnd.nextInt(100))];
    var blurb = "This recipe brought my grandmother back to life";
    var ingredients = [Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100))];

    r = new Recipe(id, title, prepTime, blurb, tags, ingredients);
  }
}

class Recipe {
  final int id;
  final String title;
  final int prepTime; // minutes
  final String blurb;
  final List<Tag> tags;
  final List<Ingredient> ingredients;

  Recipe (this.id, this.title, this.prepTime, this.blurb, this.tags, this.ingredients);
}