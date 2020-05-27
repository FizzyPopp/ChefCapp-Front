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
    int numTags = rnd.nextInt(10);
    int numIngredients = 3 + rnd.nextInt(8);
    int numEquipments = rnd.nextInt(4);
    int numSteps = 4 + rnd.nextInt(3);
    return Recipe(
        rID,
        "Recipe Title " + rID.hash,
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(179)),
        (1 + rnd.nextInt(599)),
        [for (int i=0; i<numTags; i++) tag(rnd.nextInt(100))],
        [for (int i=0; i<numIngredients; i++) ingredient(rnd.nextInt(100))],
        [for (int i=0; i<numEquipments; i++) equipment()],
        [for (int i=0; i<numSteps; i++) recipeStep(rnd.nextInt(100))],
        Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover) // fit does not belong in the model! what do?
    );
  }

  static RecipeCollection recipeCollection(int seed) {
    Random rnd = Random(seed);
    ID rcID = id();
    int numRecipes = 2 + rnd.nextInt(7);
    return RecipeCollection(
        rcID,
      "Collection Heading " + rcID.hash,
      "Collection Title " + rcID.hash,
        [for (int i=0; i<numRecipes; i++) recipe(rnd.nextInt(100))],
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

  static var _ingredients = [
    [id(), "chicken"],
    [id(), "potato"],
    [id(), "garlic"],
    [id(), "cheese"],
    [id(), "rice"],
    [id(), "beans"],
    [id(), "apples"],
    [id(), "orange"],
    [id(), "venison"],
    [id(), "carrot"],
    [id(), "chocolate"]
  ];
  static Ingredient ingredient(int seed) {
    Random rnd = Random(seed);
    int i = rnd.nextInt(_ingredients.length);
    return Ingredient(
        _ingredients[i][0],
        "${_ingredients[i][1]} [id: ${_ingredients[i][0]}]",
        (100 * rnd.nextDouble())
    );
  }

  static var _tags = [
    [id(), "spicy"],
    [id(), "hot"],
    [id(), "salty"],
    [id(), "sweet"],
    [id(), "gluten-free"],
    [id(), "keto"],
    [id(), "vegetarian"],
    [id(), "vegan"],
    [id(), "lunch"],
    [id(), "dinner"],
    [id(), "breakfast"],
    [id(), "dessert"]
  ];
  static Tag tag(int seed) {
    int i = Random(seed).nextInt(_ingredients.length);
    return Tag(
        _tags[i][0],
        _tags[i][1]
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