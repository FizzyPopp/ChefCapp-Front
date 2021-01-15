import 'package:chef_capp/index.dart';
import 'dart:math';

/// Responsible for the Discover homepage, as well as generic lists of recipes (collections, history, favorites)
class DiscoverController with ChangeNotifier {
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

  // on app start:
  // - query db for list of all recipe uuids
  // - query db for list of recipe collection uuids and the recipe uuids within them
  // on successful login:
  // - query db for favorite and historical recipe uuids
  // - based off of all above uuids, query for slightly more information on the recipes (recipe overview, pictures async)
  // on opening a recipe overview:
  // - download recipe steps in the background

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

  RecipeCollection get rc => _rc;
  String get heroID => _heroID;

  Widget toHeroCard(BuildContext context) {
    return
      HeroCard(
        cardHeading: _rc.heading,
        cardText: _rc.title,
        imgURL: _rc.imgURL,
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