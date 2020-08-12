import 'package:chef_capp/index.dart';

class RecipeData {
  RecipeInterface _r;
  final String _heroID;

  RecipeData(this._r, this._heroID);

  RecipeInterface get r => _r;
  set r (RecipeInterface ri) => _r = ri.id.equals(_r.id) ? ri : _r;
  String get heroID => _heroID;

  Widget toMiniCard(BuildContext context) {
    return
      MiniRecipeCard(
        cardText: _r.title,
        imgURL: _r.imgURL,
        heroID: _heroID,
        onTap: (){_onTapMiniRecipeCard(context);},
      );
  }

  void _onTapMiniRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(rc: RecipeController(this)),
        settings: RouteSettings(name: "/recipeOverview"),
    ));
  }

  Widget toFullCard(BuildContext context) {
    return FullRecipeCard(
        cardText: _r.title,
        imgURL: _r.imgURL,
        time: _r.cookTime + _r.prepTime,
        calories: _r.calories,
        haveIngredients: 0,
        totalIngredients: 5,
        onTap: (){onTapFullRecipeCard(context);},
        heroID: _heroID
    );
  }

  void onTapFullRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(rc: RecipeController(this)),
        settings: RouteSettings(name: "/recipeOverview"),
    ));
  }
}