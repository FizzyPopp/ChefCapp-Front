import 'package:chef_capp/index.dart';

/// Spun up on demand when the user wants to see a recipe in detail
class RecipeController with ChangeNotifier {
  /*
  - created and destroyed on demand to show a full recipe
   */
  // get ingredients from db, pass to screen
  // modify an amount of an ingredient

  final RecipeData rD;

  RecipeController(this.rD);
}