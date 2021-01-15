import 'package:chef_capp/index.dart';

abstract class RecipeInterface {
  ID get id;
  String get title;
  int get prepTime;
  int get cookTime;
  int get calories;
  List<Tag> get tags;
  List<Ingredient> get ingredients;
  List<Equipment> get cookware;
  List<RecipeStep> get steps;
  String get imgURL;
}