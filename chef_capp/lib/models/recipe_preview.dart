import 'package:chef_capp/index.dart';
import 'dart:math';

class RecipePreview {
  int id;
  String title;
  int prepTime; // minutes
  List<Tag> tags;
  String blurb;
  List<Ingredient> ingredients;
  // images
  RecipePreview.dummy(int seed) {
    Random rnd = new Random(seed);
    this.id = rnd.nextInt(100);
    this.title = "A Recipe Title";
    this.prepTime = 1 + rnd.nextInt(179);
    this.tags = [Tag.dummy(rnd.nextInt(100)), Tag.dummy(rnd.nextInt(100))];
    this.blurb = "This recipe brought my grandmother back to life";
    this.ingredients = [Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100)), Ingredient.dummy(rnd.nextInt(100))];
  }
}