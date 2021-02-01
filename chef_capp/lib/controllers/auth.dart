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

  bool _loggingIn = false;
  bool _signingUp = false;

  bool getLoggingIn() {
    return _loggingIn;
  }

  bool getSigningUp() {
    return _signingUp;
  }

  void handleSignUpLink(BuildContext context) {
    Navigator.push( context,
      MaterialPageRoute(
          builder: (context) => SignUp()
      ),
    );
  }

  void notify() {
    notifyListeners();
  }

  Future<void> handleForgotPassword(BuildContext context, String email) {
    ParentService.auth.sendPasswordResetEmail(email).then((success) async {
      if (success) {
        print("sent email");
      } else {
        print("failed to send email");
      }
    });
  }

  Future<void> handleAnonBrowse(BuildContext context) {
    ParentService.auth.loginAnon().then((success) async {
      if (success) {
        Navigator.pushNamed(context, '/home');
      } else {
        print("cannot browse");
      }
      notifyListeners();
    });
  }

  Future<void> handleLogin(BuildContext context, String email, String password) {
    _loggingIn = true;
    notifyListeners();
    ParentService.auth.loginEmailPassword(email, password).then((success) async {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("cannot login");
      }
      _loggingIn = false;
      notifyListeners();
    });
  }

  Future<void> handleSignUp(BuildContext context, String name, String email, String password) {
    // what do we do with the name?
    _signingUp = true;
    notifyListeners();
    ParentService.auth.register(email, password).then((success) async {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("cannot register");
      }
      _signingUp = false;
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