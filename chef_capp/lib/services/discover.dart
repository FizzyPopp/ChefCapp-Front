import 'package:chef_capp/index.dart';
import 'dart:math';

class DiscoverController with ChangeNotifier {
  /*
  - responsible for the discover page (exploring recipes aka landing page): discover screen will always call this controller. This controller can then call other controllers, but the UI has no knowledge of that.
  - Makes sure another db call is not made if recipe already stored locally, kind of like a cache
   */

  List<RecipeCollection> hero;
  List<Recipe> recent; // aka history
  List<Recipe> favorite;
  List<Recipe> custom;

  DiscoverController() {
    hero = List<RecipeCollection>();
    recent = List<Recipe>();
    favorite = List<Recipe>();
    custom = List<Recipe>();
  }

  Widget _heroCard(BuildContext context, RecipeCollection recipeCollection, String heroID) {
    return
      HeroCard(
        cardHeading: recipeCollection.heading,
        cardText: recipeCollection.title,
        cardImage: recipeCollection.thumb,
        heroID: heroID,
        onTap: (){onTapHeroCard(context, recipeCollection, heroID);},
    );
  }

  void onTapHeroCard(BuildContext context, RecipeCollection recipeCollection, String heroID) {
    // do something
  }

  Widget _miniRecipeCard(BuildContext context, Recipe recipe, String heroID) {
    return
      MiniRecipeCard(
        cardText: recipe.title,
        cardImage: recipe.thumb,
        heroID: heroID,
        onTap: (){onTapMiniRecipeCard(context, recipe, heroID);},
      )
    ;
  }

  void onTapMiniRecipeCard(BuildContext context, Recipe recipe, String heroID) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(
          recipeTitle: recipe.title,
          heroID: heroID,
          recipeImage: recipe.thumb,
          prepTime: recipe.prepTime,
          cookTime: recipe.cookTime,
          calories: recipe.calories,)
    ));
  }
}