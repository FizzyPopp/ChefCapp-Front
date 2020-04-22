import 'package:chef_capp/model/equipment.dart';
import 'package:chef_capp/model/ingredient.dart';
import 'package:chef_capp/model/tag.dart';
import 'dart:math';

class FullRecipe {
  int id;
  String title;
  int prepTime; // minutes
  List<Tag> tags;
  String blurb;
  List<Ingredient> ingredients;
  List<Equipment> cookware;
  List<Step> steps;
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
    this.steps = [Step.dummy()];
  }
}

class Step {
  String description;
  List<Ingredient> ingredients;
  Step.dummy() {
    this.description = "Let cool for seven minutes";
    this.ingredients = [];
  }
}