import 'package:chef_capp/index.dart';
import 'dart:math';

class Dummy {
  static int _idStart = 0;

  static ID id() {
    return ID(
        (_idStart++).toString()
    );
  }

  static Recipe recipe(int seed) {
    Random rnd = Random(seed);
    ID rID = id();
    return Recipe(
        rID,
        "Recipe Title " + rID.hash,
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(599)),
        [tag(rnd.nextInt(100)), tag(rnd.nextInt(100))],
        [ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100))],
        [equipment(), equipment()],
        [recipeStep(rnd.nextInt(100)), recipeStep(rnd.nextInt(100))],
        Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover) // fit does not belong in the model! what do?
    );
  }

  static RecipeCollection recipeCollection(int seed) {
    Random rnd = Random(seed);
    ID rcID = id();
    return RecipeCollection(
        rcID,
      "Collection Heading " + rcID.hash,
      "Collection Title " + rcID.hash,
      [recipe(rnd.nextInt(100)), recipe(rnd.nextInt(100))],
        Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover)
    );
  }

  static Equipment equipment() {
    ID eID = id();
    return Equipment(
        eID,
        "equipment " + eID.hash
    );
  }

  static RecipeStep recipeStep(int seed) {
    Random rnd = Random(seed);
    ID rsID = id();
    return RecipeStep(
        rsID,
        "description of step with id " + rsID.hash,
        [ingredient(rnd.nextInt(100)), ingredient(rnd.nextInt(100))] // this may break other code, as no guarantee that these ingredients are in the recipe
    );
  }

  static Ingredient ingredient(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["chicken", "potatoe", "garlic", "chocolate", "carrot", "apple", "orange", "rice", "venison"];
    return Ingredient(
        id(),
        names[rnd.nextInt(names.length)],
        (100 * rnd.nextDouble())
    );
  }

  static Tag tag(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["spicy", "hot", "salty", "sweet", "gluten-free", "keto", "vegetarian", "lunch", "dinner", "breakfast", "dessert"];
    return Tag(
        id(),
        names[rnd.nextInt(names.length)]
    );
  }

  static User user(int seed) {
    Random rnd = Random(seed);
    return User(
        id(),
        "loblaw@lawblog.com"
    );
  }
}