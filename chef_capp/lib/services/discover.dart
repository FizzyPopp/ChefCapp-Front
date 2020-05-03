import 'package:chef_capp/index.dart';
import 'dart:math';

class DiscoverController with ChangeNotifier {
  /*
  - responsible for the discover page (exploring recipes aka landing page): discover screen will always call this controller. This controller can then call other controllers, but the UI has no knowledge of that.
  - Makes sure another db call is not made if recipe already stored locally, kind of like a cache
   */

  // get favorite, recent, and recommended recipes from the db, pass to screen
  List<Recipe> favorite;
  List<Recipe> recent;
  List<Recipe> custom;
  Random _rand;

  DiscoverController() {
    _rand = Random(ParentController.SEED);
    favorite = List<Recipe>();
    recent = List<Recipe>();
    custom = List<Recipe>();
  }

  void _getFavourites() {
    // needs to load async / on demand
    favorite.add(Recipe.dummy(_rand.nextInt(100)));
  }

  void _getRecents() {
    recent.add(Recipe.dummy(_rand.nextInt(100)));
  }

  void _getCustom() {
    custom.add(Recipe.dummy(_rand.nextInt(100)));
  }
}