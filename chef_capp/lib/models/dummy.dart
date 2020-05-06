import 'package:chef_capp/index.dart';
import 'dart:math';

class Dummy {
  static ID id(int seed) {
    Random rnd = Random(seed);
    return ID(
        rnd.nextInt(4096).toString()
    );
  }

  static Recipe recipe(int seed) {
    Random rnd = Random(seed);
    return Recipe(
        id(rnd.nextInt(100)),
        "A Recipe Title",
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(599)),
        [tag(rnd.nextInt(100)), tag(rnd.nextInt(100))],
        "This recipe brought my grandmother back to life",
        [ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100))],
        [equipment(rnd.nextInt(100)), equipment(rnd.nextInt(100))],
        [recipeStep(rnd.nextInt(100)), recipeStep(rnd.nextInt(100))],
        Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover)
    );
  }

  static RecipeCollection recipeCollection(int seed) {
    Random rnd = Random(seed);
    return RecipeCollection(
      id(rnd.nextInt(100)),
      "A Collection Heading",
      "A Collection Title",
      [recipe(rnd.nextInt(100)), recipe(rnd.nextInt(100))],
        Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover)
    );
  }

  static Equipment equipment(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["oven", "chef's knife", "microwave", "stand mixer", "grater", "muffin tin", "wax paper", "whisk", "melon baller"];
    return Equipment(
        id(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)]
    );
  }

  static RecipeStep recipeStep(int seed) {
    Random rnd = Random(seed);
    return RecipeStep(
        id(rnd.nextInt(100)),
        "description of a step",
        [ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100))] // this may break other code, as no guarantee that these ingredients are in the recipe
    );
  }

  static Ingredient ingredient(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["chicken", "potatoe", "garlic", "chocolate", "carrot", "apple", "orange", "rice", "venison"];
    return Ingredient(
        id(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)],
        (100 * rnd.nextDouble())
    );
  }

  static Tag tag(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["spicy", "hot", "salty", "sweet", "gluten-free", "keto", "vegetarian", "lunch", "dinner", "breakfast", "dessert"];
    return Tag(
        id(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)]
    );
  }

  static User user(int seed) {
    Random rnd = Random(seed);
    return User(
        id(rnd.nextInt(100)),
        "loblaw@lawblog.com"
    );
  }
}