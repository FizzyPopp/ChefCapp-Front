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

  void notify() {
    notifyListeners();
  }

  Future<void> handleWelcomeBrowse(BuildContext context) {
    ParentService.auth.loginAnon().then((success) async {
      if (success) {
        // maybe don't pushNamedAndRemoveUntil? just push
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("cannot browse");
      }
      notifyListeners();
    });
  }

  Future<void> handleDietPrefsNext(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) => RegisterForm(),
      settings: RouteSettings(name: "/register_form"),
    ));
  }

  Future<void> handleLogin(BuildContext context, String email, String password) {
    ParentService.auth.loginEmailPassword(email, password).then((success) async {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("cannot login");
      }
      notifyListeners();
    });
  }

  Future<void> handleRegister(BuildContext context, String email, String password) {
    ParentService.auth.register(email, password).then((success) async {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("cannot register");
      }
      notifyListeners();
    });
  }

  Future<void> handleLogout(BuildContext context) {
    ParentService.auth.logout().then((success) async {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/', (Route<dynamic> route) => false);
      } else {
        print("cannot logout");
      }
      notifyListeners();
    });
  }
}