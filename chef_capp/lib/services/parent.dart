import 'package:firebase_core/firebase_core.dart';
import 'package:chef_capp/index.dart';

class ParentService {
  static DatabaseService _databaseService;
  static AuthService _authService;
  static FireState _fireState = FireState.Uninitialized;

  static FireState getState() {
    return _fireState;
  }

  static Future<bool> init() async {
    if (_fireState != FireState.Initializing) {
      _fireState = FireState.Initializing;
      await Firebase.initializeApp();
      _fireState = FireState.Initialized;
    } else {
      while (_fireState != FireState.Initialized) {
        await Future.delayed(Duration(milliseconds: 10));
      }
    }
    return true;
  }

  static DatabaseService get database {
    if (_databaseService == null) {
      _databaseService = new DatabaseService();
    }
    return _databaseService;
  }

  static AuthService get auth {
    if (_authService == null) {
      _authService = new AuthService();
    }
    return _authService;
  }
}

enum FireState {
  Uninitialized,
  Initializing,
  Initialized,
}