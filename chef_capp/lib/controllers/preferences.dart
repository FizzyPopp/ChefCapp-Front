import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see their preferences
/// backed by a Preferences model
class PreferencesController with ChangeNotifier {
  Preferences _p;
  List<String> _allergenCategories;
  List<String> _allergicToCategories;
  List<DBIngredient> _allIngredients;
  List<DBIngredient> _filteredIngredients;
  List<ID> _selectedAllergenIngredients;

  PreferencesController() {
    // this is just for testing. Should actually get it from DatabaseService
    // DatabaseService will return a Preferences.localized() if it can't find any existing
    // should have a "refresh" function which queries db again ?
    this._p = Preferences.localized();
    _allergenCategories = [];
    _allergicToCategories = [];
    _allIngredients = [];
    _filteredIngredients = [];
    _selectedAllergenIngredients = [];
    populateAllergenCategories();
    populateIngredients();
  }

  Future<void> populateIngredients() async {
    _allIngredients = await ParentService.database.getIngredients();
    this.notifyListeners();
  }

  Future<void> populateAllergenCategories() async {
    _allergenCategories = await ParentService.database.getAllergenCategories();
    this.notifyListeners();
  }

  Preferences get preferences => this._p.copy();

  bool get metricVolume => this._p.metricVolume;
  bool get metricWeight => this._p.metricWeight;
  bool get metricTemperature => this._p.metricTemperature;
  List<String> get allergies => [...this._p.allergies];
  List<String> get dietaryRestrictions => [...this._p.dietaryRestrictions];
  List<String> get allergenCategories => [...this._allergenCategories];
  List<String> get allergicToCategories => [...this._allergicToCategories];
  List<DBIngredient> get allIngredients => [ ...this._allIngredients ];
  List<DBIngredient> get filteredIngredients => [ ...this._filteredIngredients ];
  List<ID> get selectedAllergenIngredients => [ ...this._selectedAllergenIngredients ];

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

  set allergies(List<String> a) {
    this._p.allergies = [...a];
    this.notifyListeners();
  }

  set dietaryRestrictions(List<String> dr) {
    this._p.dietaryRestrictions = [...dr];
    this.notifyListeners();
  }

  void handleChipTouch(ID touchedId, bool selected) {
    if (selected) {
      _selectedAllergenIngredients.add(touchedId);
    } else {
      _selectedAllergenIngredients = _selectedAllergenIngredients.where((id) => !id.equals(touchedId)).toList();
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

  void allergicToCategory(String label, bool selected) {
    if (selected) {
      _allergicToCategories.add(label);
    } else {
      _allergicToCategories = _allergicToCategories.where((c) => c != label).toList();
    }
    notifyListeners();
  }

  Preferences get model => Preferences.fromJson(_p.toJson());
}