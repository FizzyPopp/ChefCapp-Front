import 'package:chef_capp/index.dart';
import 'dart:math';

/// Responsible for the Discover homepage, as well as generic lists of recipes (collections, history, favorites)
class DiscoverController with ChangeNotifier {
  // NOTE: when modifying any below list, first clone the variable to itself
  // (x = List.from(x)), otherwise the Selector won't pick up on the change
  List<RecipeCollectionData> collections;
  List<RecipeData> recent; // aka history
  List<RecipeData> favorite;
  List<RecipeData> custom;
  List<RecipeData> generic; // used to display a single collection
  int _heroStart; // used to give each recipe card a unique hero id

  DiscoverController() {
    collections = List<RecipeCollectionData>();
    recent = List<RecipeData>();
    favorite = List<RecipeData>();
    custom = List<RecipeData>();
    _heroStart = 0;

    testActualRecipes();
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

  void testActualRecipes() async {
    List<RecipePreview> recipes = await ParentService.database.getRecipePreviews();
    custom = [...recipes.map((rp) => RecipeData(rp, _genHeroID())).toList()];
    notifyListeners();
  }

  void genDummyLists() {
    Random rnd = Random(ParentController.SEED);

    if (collections.length == 0) {
      int lim = rnd.nextInt(5) + 1;
      for (int i = 0; i < lim; i++) {
        collections.add(RecipeCollectionData(Dummy.recipeCollection(rnd.nextInt(1000)), _genHeroID(), _genHeroID, _updateGeneric));
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

    /*
    if (custom.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        custom.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }
     */
  }

  void discoverHistory(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) =>
        DiscoverGenericList(
            title: "My History",
            metaSelector: (DiscoverController model) => model.recent
        ),
      settings: RouteSettings(name: context.widget.runtimeType.toString()),
    ));
  }

  void discoverFavorites(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) =>
            DiscoverGenericList(
                title: "My Favorites",
                metaSelector: (DiscoverController model) => model.favorite
            ),
        settings: RouteSettings(name: context.widget.runtimeType.toString()),
    ));
  }

  void _updateGeneric(List<RecipeData> c) {
    generic = List.from(c);
    notifyListeners();
  }
}