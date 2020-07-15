import 'package:chef_capp/index.dart';

class RecipeCollection {
  final ID _id;
  final String _heading;
  final String _title;
  final List<Recipe> _recipes;
  final String _imgURL;

  RecipeCollection(this._id, this._heading, this._title, this._recipes, this._imgURL);

  String get heading => _heading;

  String get title => _title;

  List<Recipe> get recipes => [..._recipes];

  String get imgURL => _imgURL;
}