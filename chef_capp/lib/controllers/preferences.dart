import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see their preferences
/// backed by a Preferences model
class PreferencesController with ChangeNotifier {
  Preferences _p;

  List<String> _allAllergenCategories;
  List<String> _allDietaryCategories;
  List<DBIngredient> _allIngredients;
  List<DBIngredient> _filteredIngredients;

  PreferencesController() {
    this._p = Preferences.localized();
    _getModel();

    _allAllergenCategories = [];
    _allDietaryCategories = [];
    _allIngredients = [];
    _filteredIngredients = [];

    populateAllergenCategories();
    populateIngredients();
  }

  Future<void> _getModel() async {
    this._p = await ParentService.database.getUserPreferences();
    notifyListeners();
  }

  Future<void> populateIngredients() async {
    _allIngredients = await ParentService.database.getIngredients();
    this.notifyListeners();
  }

  Future<void> populateAllergenCategories() async {
    _allAllergenCategories = await ParentService.database.getAllergenCategories();
    populateDietaryCategories();
    this.notifyListeners();
  }

  Future<void> populateDietaryCategories() async {
    _allDietaryCategories = _allAllergenCategories;
    this.notifyListeners();
  }

  Preferences get preferences => this._p.copy();

  bool get metricVolume => this._p.metricVolume;
  bool get metricWeight => this._p.metricWeight;
  bool get metricTemperature => this._p.metricTemperature;

  List<DBIngredient> get allIngredients => [ ...this._allIngredients ];

  List<DBIngredient> get filteredIngredients => [ ...this._filteredIngredients ];

  List<Map> get allergenCategories {
    var out = this._allAllergenCategories.map((s) => { "name": s, "selected": false }).toList();
    for (final a in out) {
      if (this._p.allergyCategories.contains(a["name"])) {
        a["selected"] = true;
      }
    }
    return out;
  }

  List<ID> get allergenIngredients => [ ...this._p.allergyIngredients ];

  List<Map> get dietaryCategories {
    var out = this._allDietaryCategories.where((s) => !this._p.allergyCategories.contains(s)).map((s) => { "name": s, "selected": false }).toList();
    for (final a in out) {
      if (this._p.dietaryCategories.contains(a["name"])) {
        a["selected"] = true;
      }
    }
    return out;
  }

  List<ID> get dietaryIngredients => [ ...this._p.dietaryIngredients ];

  set metricVolume(bool v) {
    this._p.metricVolume = v;
    this.notifyListeners();
  }

  set metricWeight(bool w) {
    this._p.metricWeight = w;
    this.notifyListeners();
  }

  set metricTemperature(bool t) {
    this._p.metricTemperature = t;
    this.notifyListeners();
  }

  void updateAllergenCategory(String name, bool selected) {
    if (selected) {
      if (!this._p.allergyCategories.contains(name)) {
        this._p.allergyCategories.add(name);
      }
    } else {
      this._p.allergyCategories = this._p.allergyCategories.where((a) => a != name).toList();
    }
    notifyListeners();
  }

  void updateAllergenIngredient(ID id, bool selected) {
    if (selected) {
      if (!this._p.allergyIngredients.contains(id)) {
        this._p.allergyIngredients.add(id);
      }
    } else {
      this._p.allergyIngredients = this._p.allergyIngredients.where((a) => a != id).toList();
    }
    notifyListeners();
  }

  void updateDietaryCategory(String name, bool selected) {
    if (selected) {
      if (!this._p.dietaryCategories.contains(name)) {
        this._p.dietaryCategories.add(name);
      }
    } else {
      this._p.dietaryCategories = this._p.dietaryCategories.where((a) => a != name).toList();
    }
    notifyListeners();
  }

  void updateDietaryIngredient(ID id, bool selected) {
    if (selected) {
      if (!this._p.dietaryIngredients.contains(id)) {
        this._p.dietaryIngredients.add(id);
      }
    } else {
      this._p.dietaryIngredients = this._p.dietaryIngredients.where((a) => a != id).toList();
    }
    notifyListeners();
  }

  void filterIngredients(String query) {
    query = query.trim().toLowerCase();
    if (query == "") {
      _filteredIngredients = [];
    } else {
      _filteredIngredients = _allIngredients.where((ingr) => ingr.name.contains(query)).toList();
    }
    notifyListeners();
  }

  Future<void> done(BuildContext context) async {
    LoginState loginState = ParentService.auth.getLoginState();

    if (loginState == LoginState.LoggedIn) {
      int count = 0;
      Navigator.popUntil(context, (route) {
        return count++ == 2;
      });
      ParentService.database.saveUserPreferences(ParentController.preferences.model);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUp()
        ),
      );
    }
  }

  Preferences get model => Preferences.fromJson(_p.toJson());
}
