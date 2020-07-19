import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see a recipe in detail
/// will have to modify ingredients on hand if recipe is completed
class RecipeController with ChangeNotifier {
  RecipeData _rd;
  bool _isFullRecipe;

  RecipeData get rd => _rd;
  bool get isFullRecipe => _isFullRecipe;

  RecipeController(this._rd) {
    if (this._rd.r is RecipePreview) {
      _isFullRecipe = false;
    } else {
      _isFullRecipe = true;
    }
  }

  Future<void> getFullRecipe() async {
    if (this._rd.r is RecipePreview) {
      try {
        ParentController.database.getRecipeFromPreview(this._rd.r).then((r) {
          this._rd.r = r;
          _isFullRecipe = true;
          notifyListeners();
        });
      } catch (e) {
        print(e);
      }
    } else {
      _isFullRecipe = true;
    }
  }

  void getCooking(BuildContext context) {
    if (_isFullRecipe) {
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => RecipeCooking(
            rc: this,
          )
      ));
    }
  }

  String getCookingButtonText() {
    if (_isFullRecipe) {
      return "GET COOKING";
    } else {
      return "loading...";
    }
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
        imgURL: _r.imgURL,
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
        imgURL: _r.imgURL,
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