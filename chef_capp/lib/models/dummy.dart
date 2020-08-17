import 'package:chef_capp/index.dart';
import 'dart:math';

/// Static helper class to generate models for use when testing
/// Models will likely change after DB integration, so this class will have to change too
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
        "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2016%2F0804%2Fr110027_1296x729_16%2D9.jpg&w=920&h=518&scale=crop&cquality=80&location=origin&format=jpg"
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
        "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2016%2F0804%2Fr110027_1296x729_16%2D9.jpg&w=920&h=518&scale=crop&cquality=80&location=origin&format=jpg"
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
    int numDescriptions = 1 + rnd.nextInt(12);
    int numChips = (numDescriptions / 2).floor();
    return RecipeStep(
        rsID,
        // these are incorrect
        rsID,
        rsID,
        // this may break other code, as no guarantee that these ingredients are in the recipe
        [for (int i=0; i<numChips; i++) chip()],
        [for (int i=0; i<numDescriptions; i++) descPart(i)]
    );
  }

  static String chip() {
    return "a chip";
  }

  static DescPart descPart(int i) {
    if (i == 0) {
      return DescPart("Some text ", TextMod.copy);
    } else if (i%2 == 1) {
      return DescPart("ingredient", TextMod.name);
    } else {
      return DescPart(" some more text ", TextMod.copy);
    }
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
        "${_ingredients[i][1]} plural [id: ${_ingredients[i][0]}]",
        (100 * rnd.nextDouble()),
        "g",
        (rnd.nextDouble() > .5) ? "A Category" : "B Category",
    );
  }

  static IngredientRange ingredientRange(int seed) {
    Random rnd = Random(seed);
    return IngredientRange([rnd.nextDouble(), 4 * rnd.nextDouble()], ingredient(seed));
  }

  static var _tags = [
    "spicy",
    "hot",
    "salty",
    "sweet",
    "gluten-free",
    "keto",
    "vegetarian",
    "vegan",
    "lunch",
    "dinner",
    "breakfast",
    "dessert"
  ];
  static Tag tag(int seed) {
    int i = Random(seed).nextInt(_ingredients.length);
    return Tag(
        _tags[i]
    );
  }

  static User user(int seed) {
    Random rnd = Random(seed);
    return User(
        id(),
        "loblaw@lawblog.com",
        UnitPreference.metric,
        []
    );
  }
}