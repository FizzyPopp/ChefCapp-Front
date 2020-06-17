import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see a recipe in detail
/// will have to modify ingredients on hand if recipe is completed
class RecipeController with ChangeNotifier {
  final RecipeData rd;

  RecipeController(this.rd) {
    // get the recipe steps async from db, then:
    // rd.r = Recipe.fromOverview(rd.r, steps);
    rd.r = Recipe.fromOverview(rd.r, (rd.r as Recipe).steps);
    //ParentController.databaseService.testGetData();
  }

  void getCooking(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeCooking()
    ));
  }
}

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
        cardImage: _r.thumb,
        heroID: _heroID,
        onTap: (){_onTapMiniRecipeCard(context);},
      );
  }

  void _onTapMiniRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(rc: RecipeController(this))
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
        builder: (BuildContext context) => RecipeOverview(rc: RecipeController(this))
    ));
  }
}