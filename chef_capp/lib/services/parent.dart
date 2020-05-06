import 'package:chef_capp/index.dart';

class ParentController with ChangeNotifier {
  static const int SEED = 2;
  static User _user;
  static AuthController _authController;
  static DatabaseService _databaseService;
  static DiscoverController _discoverController;
  static InventoryController _inventoryController;
  static RecipeController _recipeController;

  /*
  - created on start up
  - all other controllers have access to it
  - dispatches all other controllers (ensures there's only ever one instance of the Discover controller, etc.)
  - most screens will need access to this controller, as they will ask it for other controllers
  - single universal source of truth
   */

  static void set user(User user) {
    if (_user != null) {
      throw("User already present");
    }
    _user = user;
  }

  static User get user {
    return _user;
  }

  static AuthController get authController {
    if (_authController == null) {
      _authController = AuthController();
    }
    return _authController;
  }

  static DatabaseService get databaseService {
    if (_databaseService == null) {
      _databaseService = DatabaseService();
    }
    return _databaseService;
  }

  static DiscoverController get discoverController {
    if (_discoverController == null) {
      _discoverController = DiscoverController();
    }
    return _discoverController;
  }

  static InventoryController get inventoryController {
    if (_inventoryController == null) {
      _inventoryController = InventoryController();
    }
    return _inventoryController;
  }

  static RecipeController get recipeController {
    if (_recipeController == null) {
      _recipeController = RecipeController();
    }
    return _recipeController;
  }
}