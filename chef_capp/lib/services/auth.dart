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
    bool appStarted = await ParentService.init();
    if (!appStarted) {
      return false;
    }
    if (_auth == null) {
      _auth = FirebaseAuth.instance;
    }
    return true;
  }

  RegisterState getRegisterState() {
    return _registerState;
  }

  LoginState getLoginState() {
    return _loginState;
  }

  Future<bool> loginAnon() async {
    if (_loginState != LoginState.LoggingIn) {
      if (!(await init())) {
        return false;
      }
      _loginState = LoginState.LoggingIn;
      UserCredential creds;
      try {
        creds = await _auth.signInAnonymously();
      } catch (e) {
        print(e);
        _loginState = LoginState.NotLoggedIn;
        return false;
      }
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
      if (!(await init())) {
        return false;
      }
      _loginState = LoginState.LoggingIn;
      UserCredential creds;
      try {
        creds = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        print(e);
        _loginState = LoginState.NotLoggedIn;
        return false;
      }
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

  // does this sign in on success??
  Future<bool> register(String email, String password) async {
    if (_registerState != RegisterState.Registering) {
      if (!(await init())) {
        return false;
      }
      _registerState = RegisterState.Registering;
      UserCredential creds;
      try {
        creds = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        print(e);
        _registerState = RegisterState.RegistrationFailed;
        return false;
      }
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

  Future<bool> sendPasswordResetEmail(email) async {
    if (!(await init())) {
      return false;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
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