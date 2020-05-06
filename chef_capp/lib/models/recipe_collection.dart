import 'package:chef_capp/index.dart';

class RecipeCollection {
  final ID _id;
  final String _heading;
  final String _title;
  final List<Recipe> _recipes;
  final Image _thumb;

  RecipeCollection(this._id, this._heading, this._title, this._recipes, this._thumb);

  String get heading => _heading;

  String get title => _title;

  Image get thumb => _thumb;
}