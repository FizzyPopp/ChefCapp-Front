import 'package:chef_capp/index.dart';

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
    collections = <RecipeCollectionData>[];
    recent = <RecipeData>[];
    favorite = <RecipeData>[];
    custom = <RecipeData>[];
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
}