import 'package:chef_capp/index.dart';

/// This is just Recipe without steps
class RecipePreview implements RecipeInterface {
  final ID _id;
  final String _title;
  final int _prepTime; // minutes, should probably spin into dedicated PrepTime class
  final int _cookTime;
  final int _calories;
  final List<Tag> _tags;
  final List<Ingredient> _ingredients;
  final List<Equipment> _cookware;
  final Image _thumb;

  RecipePreview(this._id, this._title, this._prepTime, this._cookTime, this._calories, this._tags, this._ingredients, this._cookware, this._thumb);

  ID get id => _id;

  String get title => _title;

  int get prepTime => _prepTime;

  int get cookTime => _cookTime;

  int get calories => _calories;

  List<Tag> get tags => [..._tags];

  List<Ingredient> get ingredients => [..._ingredients];

  List<Equipment> get cookware => [..._cookware];

  List<RecipeStep> get steps => [];

  Image get thumb => _thumb;
}