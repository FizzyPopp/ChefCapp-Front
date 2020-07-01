import 'package:chef_capp/index.dart';

// https://firebase.google.com/docs/reference/js/firebase.analytics.Analytics

/// Static object holds most other Controllers
/// - created on startup
/// - static ensures only one instance exists at a time
/// - static ensures objects don't get deleted accidentally
/// - static ensures everything has access, and thus easy access to almost any other controller
/// - universal source of truth
///
/// Also holds the User object, but no other models
class ParentController with ChangeNotifier {
  static const int SEED = 2;
  static User _user;
  static AuthController _authController;
  static DatabaseService _databaseService;
  static DiscoverController _discoverController;
  static InventoryController _inventoryController;

  static void set user(User user) {
    if (_user != null) {
      throw("User already present");
    }
    _user = user;
  }

  static User get user {
    return _user;
  }

  static AuthController get auth {
    if (_authController == null) {
      _authController = AuthController();
    }
    return _authController;
  }

  static DatabaseService get database {
    if (_databaseService == null) {
      _databaseService = DatabaseService();
    }
    return _databaseService;
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
}