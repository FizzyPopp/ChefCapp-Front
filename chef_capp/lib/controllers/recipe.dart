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
        ParentService.database.getRecipeFromPreview(this._rd.r).then((r) {
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
          ),
          settings: RouteSettings(name: context.widget.runtimeType.toString()),
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