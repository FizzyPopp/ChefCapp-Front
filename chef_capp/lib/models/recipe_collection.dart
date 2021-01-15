import 'package:chef_capp/index.dart';
part 'recipe_collection.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeCollection {
  final ID _id;
  final String _heading;
  final String _title;
  final List<Recipe> _recipes;
  final String _imgURL;

  RecipeCollection(ID id, String heading, String title, List<Recipe> recipes, String imgURL) :
        this._id = id,
        this._heading = heading,
        this._title = title,
        this._recipes = recipes,
        this._imgURL = imgURL;

  ID get id => _id;

  String get heading => _heading;

  String get title => _title;

  List<Recipe> get recipes => [..._recipes];

  String get imgURL => _imgURL;

  factory RecipeCollection.fromJson(Map<String, dynamic> json) => _$RecipeCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCollectionToJson(this);
}