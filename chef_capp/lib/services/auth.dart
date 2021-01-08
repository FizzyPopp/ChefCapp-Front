import 'package:firebase_auth/firebase_auth.dart';
import 'package:chef_capp/index.dart';

class AuthService {
  RegisterState _registerState;
  LoginState _loginState;
  FirebaseAuth _auth;
  User _user;

  AuthService() {
   _registerState = RegisterState.Unknown;
   _loginState = LoginState.NotLoggedIn;
  }

  Future<bool> init() async {
    FireState fireState = ParentService.getState();
    if (fireState != FireState.Initialized) {
      return false;
    }
  }

  LoginState getLoginState() {
    return _loginState;
  }

  Future<bool> loginAnon() async {
    if (_loginState != LoginState.LoggingIn) {
      _loginState = LoginState.LoggingIn;
      UserCredential creds = await _auth.signInAnonymously();
      if (creds.user == null) {
        _loginState = LoginState.NotLoggedIn;
        return false;
      } else {
        _user = creds.user;
        _loginState = LoginState.Anonymous;
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> loginEmailPassword(String email, String password) async {
    if (_loginState != LoginState.LoggingIn) {
      _loginState = LoginState.LoggingIn;
      UserCredential creds = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (creds.user == null) {
        _loginState = LoginState.NotLoggedIn;
        return false;
      } else {
        _user = creds.user;
        _loginState = LoginState.LoggedIn;
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> handleSignUp(String email, String password) async {
    if (_registerState != RegisterState.Registering) {
      _registerState = RegisterState.Registering;
      UserCredential creds = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (creds.user == null) {
        _registerState = RegisterState.RegistrationFailed;
        return false;
      } else {
        _user = creds.user;
        _registerState = RegisterState.Registered;
        return true;
      }
    } else {
      return false;
    }
  }

  Future<void> sendPasswordResetEmail(email) async {
    _auth.sendPasswordResetEmail(email: email);
  }
}

enum RegisterState {
  Unknown,
  Registering,
  Registered,
  RegistrationFailed
}

enum LoginState {
  NotLoggedIn,
  LoggingIn,
  LoggedIn,
  Anonymous
}