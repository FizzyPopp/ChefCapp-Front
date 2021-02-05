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
  bool _emailIsValid = false;
  bool _passwordIsValid = false;
  RegExp _emailRegExp = new RegExp(
  r"[a-z0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_‘{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  RegExp _alphaLowerRegExp = new RegExp(r"[a-z]");
  RegExp _alphaUpperRegExp = new RegExp(r"[A-Z]");
  RegExp _digitRegExp = new RegExp(r"\d");
  RegExp _specialCharRegExp = new RegExp(r"[^a-zA-Z0-9]");
  bool _emailAlreadyUsed = false;
  ResetEmailStatus _resetEmailSent = ResetEmailStatus.unattempted;



  ResetEmailStatus getResetEmailSent() {
    return _resetEmailSent;
  }

  void resetResetEmailSent() {
    _resetEmailSent = ResetEmailStatus.unattempted;
  }

  bool getLoggingIn() {
    return _loggingIn;
  }

  bool canLogIn() {
    return (!_loggingIn) && _emailIsValid;
  }

  bool getSigningUp() {
    return _signingUp;
  }

  bool canSignUp() {
    return (!_signingUp) && _emailIsValid && _passwordIsValid;
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

  String validateEmail(String email) {
    if (_emailAlreadyUsed) {
      _emailAlreadyUsed = false;
      return "Email already in use";
    }
    String _emailMatch = _emailRegExp.stringMatch(email);
    if (email.length == 0) {
      _emailIsValid = false;
      return null;
    } else if (email == _emailMatch) {
      _emailIsValid = true;
      return null;
    } else {
      _emailIsValid = false;
      return 'Please enter a valid email address.';
    }
  }

  String validatePassword(String password) {
    if (password.length == 0) {
      _passwordIsValid = false;
      return null;
    } else if (password.length > 16
            || password.length > 8
            && _alphaLowerRegExp.hasMatch(password)
            && _alphaUpperRegExp.hasMatch(password)
            && _digitRegExp.hasMatch(password)
            && _specialCharRegExp.hasMatch(password)) {
      _passwordIsValid = true;
      return null;
    } else {
      _passwordIsValid = false;
      return 'Please ensure password meets the requirements below.';
    }
  }

  Future<void> handleForgotPassword(BuildContext context, String email) {
    ParentService.auth.sendPasswordResetEmail(email).then((success) async {
      if (success) {
        _resetEmailSent = ResetEmailStatus.sent;
      } else {
        _resetEmailSent = ResetEmailStatus.failed;
      }
      notifyListeners();
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
        // could be some other reason, but idk
        _emailAlreadyUsed = true;
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

enum ResetEmailStatus {
  unattempted,
  failed,
  sent
}