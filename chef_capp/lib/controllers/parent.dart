import 'package:chef_capp/index.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// https://firebase.google.com/docs/reference/js/firebase.analytics.Analytics

/// Static object holds most other Controllers
/// - created on startup
/// - static ensures only one instance exists at a time
/// - static ensures objects don't get deleted accidentally
/// - static ensures everything has access, and thus easy access to almost any other controller
/// - universal source of truth
///
/// Also holds the User object, but no other models
class ParentController {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();
  static const int SEED = 2;
  static AppUser _appUser;
  static AuthController _authController;
  static DiscoverController _discoverController;
  static InventoryController _inventoryController;
  static PreferencesController _preferencesController;

  static void set appUser(AppUser user) {
    _appUser = user;
  }

  static AppUser get appUser {
    return _appUser;
  }

  static AuthController get auth {
    if (_authController == null) {
      _authController = AuthController();
    }
    return _authController;
  }

  static DiscoverController get discover {
    if (_discoverController == null) {
      _discoverController = DiscoverController();
    }
    return _discoverController;
  }

  static InventoryController get inventory {
    if (_inventoryController == null) {
      _inventoryController = InventoryController();
    }
    return _inventoryController;
  }

  static PreferencesController get preferences {
    if (_preferencesController == null) {
      _preferencesController = PreferencesController();
    }
    return _preferencesController;
  }
}