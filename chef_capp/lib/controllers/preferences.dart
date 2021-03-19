import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see their preferences
/// backed by a Preferences model
class PreferencesController with ChangeNotifier {
  Preferences _p;
  List<String> _allergenCategories;
  List<String> _allergicToCategories;

  PreferencesController() {
    // this is just for testing. Should actually get it from DatabaseService
    // DatabaseService will return a Preferences.localized() if it can't find any existing
    // should have a "refresh" function which queries db again ?
    this._p = Preferences.localized();
    _allergenCategories = [];
    _allergicToCategories = [];
    populateAllergenCategories();
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