import 'package:chef_capp/models/user.dart';

import 'package:chef_capp/index.dart';

/// Used to deal with all aspects of authentication: register, sign in, sign out, recover password
/// Responsible for all unauthenticated screens
class AuthController with ChangeNotifier {

  /*
   * Database should allow anonymous users, each anonymous user is unique.
   * The app will automatically create an anonymous user the first time it's started.
   * When a user logs in for the first time, the app's anonymous user is converted into a named user.
   * When an app's anonymous user is converted into a named user, the app no longer has an anonymous user.
   * If: the app is open, no one is logged in, and the app does not have an anonymous user, then:
     the app should create a new anonymous user.

   * Anonymous users have read-only access to recipes (and everything you need for a recipe).
   * A named user has write access to store their ingredients, history, and favorites,
     as well as all the access that an anonymous user has.
   * No anonymous user has read or write access to any named user's data.
   * No named user has access to another named user's data.
   * Super users obv have access to everything.
   */

  String _loginButtonText;
  Function _loginFunction;

  AuthController() {
    _loginButtonText = "Go";
    _loginFunction = loadTestRecipe;
  }

  String get loginButtonText => _loginButtonText;
  Function get loginFunction => _loginFunction;

  Future<void> loadTestRecipe(BuildContext context) async {
    _loginButtonText = "loading...";
    _loginFunction = null;
    notifyListeners();
    ParentController.database.signInAnon().then((success) async {
      if (success) {
        // get recipe from db
        RecipePreview rp;
        try {
          rp = await ParentController.database
              .getTestRecipePreview();
        } catch (e) {
          print(e);
          return;
        }
        // convert into RecipeData and pass to RecipeController
        RecipeController rc = RecipeController(RecipeData(rp, "0"));
        // push RecipeOverview
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview(rc: rc)
        ));
        // load full Recipe
        rc.getFullRecipe();
      }
      _loginButtonText = "Go";
      _loginFunction = loadTestRecipe;
      notifyListeners();
    });
  }

  void signInAnon(BuildContext context) async {
    _loginButtonText = "connecting";
    _loginFunction = null;
    notifyListeners();
    ParentController.database.signInAnon().then((success) {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        _loginButtonText = "Try again";
        _loginFunction = signInAnon;
        notifyListeners();
      }
    });
  }
}