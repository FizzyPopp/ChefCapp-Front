import "dart:collection";

// single thread, don't need to worry about caching?
// should getters/setters be async?
// should saving to disk be handled here as well? or is that handled in the blocs and this is analogous to RAM?
class Globals {
  Globals._internal(); // a "named constructor"

  static final Globals _singleton = Globals._internal();

  factory Globals() {
    return _singleton;
  }

  int _sessionToken;
  get sessionToken => _sessionToken;
  set sessionToken (int sessionToken) => _sessionToken = sessionToken;

  String _username;
  get username => _username;
  set username (String username) => _username = username;

  List<FoodPreference> _foodPreferences = [];
  List<FoodAllergy> _foodAllergies = [];
  HashMap<int, Unit> _preferredUnits = new HashMap<int, Unit>();
  int _usualPeople;

  Set<Recipe> _recipes = {};

  List<Recipe> _recipeHistory = [];
  List<Recipe> _favouriteRecipes = [];

  List<IngredientWithAmount> _cupboard = [];
  List<IngredientWithAmount> _shoppingList = [];
}

class FoodPreference {
  final int id;
  final String name;

  FoodPreference(this.id, this.name);
}

class FoodAllergy {
  final int id;
  final String name;

  FoodAllergy(this.id, this.name);
}

// define how to convert one unit id to another, or if allowed
// use consistently in database and here
// everything stored in database should be in a certain type (volume always in mL, for example)
// mL, L, g, kg, teaspoon, tablespoon, fluid ounce, pound, cup, pint, quart, gallon, drop, dash
class Unit {
  final int id;
  final String abbrev;
  final String fullName;

  Unit(this.id, this.abbrev, this.fullName);

  Unit.copy(Unit original)
      : this.id = original.id,
        this.abbrev = original.abbrev,
        this.fullName = original.fullName;

  static Unit convert(Unit a, String b) {
    // look up Unit based on b
    // switch based on a.id + (b.id * total_number_of_units)
    // default: throw an exception
    return null;
  }
}

class Amount {
  final Unit unit;
  final double amount;

  Amount(this.unit, this.amount);
}

class Ingredient {
  final int id;
  final String name;

  Ingredient(this.id, this.name);
}

class CommonIngredientAmounts {
  final Ingredient ingredient;
  final List<Amount> amounts;

  CommonIngredientAmounts(this.ingredient, this.amounts);
}

class IngredientWithAmount {
  final Ingredient ingredient;
  final Amount amount;

  IngredientWithAmount(this.ingredient, this.amount);
}

class Recipe {
  final int id;
  final String title;
  final String smallImageURL;
  final String bigImageURL;
  final String shortDescription;
  final String longDescription;
  final int feeds;
  final int prepTime; // in minutes
  final List<FoodAllergy> allergens;
  final int calories;
  final List<IngredientWithAmount> ingredients;
  final Instructions instructions;

  Recipe(
      this.id,
      this.title,
      this.smallImageURL,
      this.bigImageURL,
      this.shortDescription,
      this.longDescription,
      this.feeds,
      this.prepTime,
      this.allergens,
      this.calories,
      this.ingredients,
      this.instructions);
}

class Instructions {
  final List<InstructionStep> steps;

  Instructions(this.steps);
}

class InstructionStep {
  final String instruction;

  InstructionStep(this.instruction);
}
