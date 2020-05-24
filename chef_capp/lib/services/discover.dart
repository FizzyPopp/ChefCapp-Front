import 'package:chef_capp/index.dart';
import 'dart:math';

/// this is a doc comment on discover controller
class DiscoverController with ChangeNotifier {
  /*
  - responsible for the discover page (exploring recipes aka landing page): discover screen will always call this controller. This controller can then call other controllers, but the UI has no knowledge of that.
  - Makes sure another db call is not made if recipe already stored locally, kind of like a cache
   */

  List<RecipeCollectionData> hero;
  List<RecipeData> recent; // aka history
  List<RecipeData> favorite;
  List<RecipeData> custom;
  int _heroStart;

  DiscoverController() {
    hero = List<RecipeCollectionData>();
    recent = List<RecipeData>();
    favorite = List<RecipeData>();
    custom = List<RecipeData>();
    _heroStart = 0;
  }

  String _genHeroID() {
    return (_heroStart++).toString();
  }

  void genDummyLists() {
    Random rnd = Random(ParentController.SEED);

    if (hero.length == 0) {
      int lim = rnd.nextInt(5) + 1;
      for (int i = 0; i < lim; i++) {
        hero.add(RecipeCollectionData(Dummy.recipeCollection(rnd.nextInt(1000)), _genHeroID(), _genHeroID));
      }
    }

    if (recent.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        recent.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    if (favorite.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        favorite.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    if (custom.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        custom.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }
  }

  void discoverHistory(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) =>
          DiscoverGenericList(
              title: "My History",
              metaSelector: (DiscoverController model) => model.recent
          ),
    ));
  }

  void discoverFavorites(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) =>
            DiscoverGenericList(
                title: "My Favorites",
                metaSelector: (DiscoverController model) => model.favorite
            ),
    ));
  }
}

class RecipeCollectionData {
  final RecipeCollection _rc;
  final String _heroID;
  final Function _genHeroID;

  RecipeCollectionData(this._rc, this._heroID, this._genHeroID);

  Widget toHeroCard(BuildContext context) {
    return
      HeroCard(
        cardHeading: _rc.heading,
        cardText: _rc.title,
        cardImage: _rc.thumb,
        heroID: _heroID,
        onTap: (){onTapHeroCard(context);},
      );
  }

  void onTapHeroCard(BuildContext context) {
    final List<RecipeData> noUpdate = _rc.recipes.map((r) => RecipeData(r, _genHeroID())).toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) =>
          DiscoverGenericList(
              title: _rc.title,
              // noUpdate does not come from model, so I don't think this page will ever re-render
              // that means that all data needed for the page has to be available when this page is set up
              // but I'm not exactly sure what data is needed
              metaSelector: (DiscoverController model) => noUpdate
          ),
    ));
  }
}

class RecipeData {
  final Recipe _r;
  final String _heroID;

  RecipeData(this._r, this._heroID);

  Widget toMiniCard(BuildContext context) {
    return
      MiniRecipeCard(
        cardText: _r.title,
        cardImage: _r.thumb,
        heroID: _heroID,
        onTap: (){_onTapMiniRecipeCard(context);},
      );
  }

  void _onTapMiniRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(
            recipeTitle: _r.title,
            heroID: _heroID,
            recipeImage: _r.thumb,
            prepTime: _r.prepTime,
            cookTime: _r.cookTime,
            calories: _r.calories)
    ));
  }

  Widget toFullCard(BuildContext context) {
    return FullRecipeCard(
        cardText: _r.title,
        cardImage: _r.thumb,
        time: _r.cookTime + _r.prepTime,
        calories: _r.calories,
        haveIngredients: 0,
        totalIngredients: 5,
        onTap: (){onTapFullRecipeCard(context);}
    );
  }

  void onTapFullRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(
            recipeTitle: _r.title,
            heroID: _heroID,
            recipeImage: _r.thumb,
            prepTime: _r.prepTime,
            cookTime: _r.cookTime,
            calories: _r.calories)
    ));
  }
}

// list of ingredients = a list of vectors
// "mediterranean", "korean", "spicy", etc. is difficult to do
// for each recipe, get jaccard index
// ultimately for mvp, only consider what the user has on hand, their history, and their favorites?
// also need some underlying ranking?
// what else could be a factor:
// independent ranking
// dependant (personalized) ranking
// prep time
// cook time
// number of ingredients
// least amount of ingredients by volume or scarcity (will not deplete anything on hand)
// meal size
// how many times they have had the option to cook it before and chose to cook something else
// calories

// ranking could be based on:
// rating
// most cooked
// most favorited
// geographic cuisine
// some ML clustering thing