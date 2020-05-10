import 'package:chef_capp/index.dart';
import 'dart:math';

class DiscoverController with ChangeNotifier {
  /*
  - responsible for the discover page (exploring recipes aka landing page): discover screen will always call this controller. This controller can then call other controllers, but the UI has no knowledge of that.
  - Makes sure another db call is not made if recipe already stored locally, kind of like a cache
   */

  List<RecipeCollectionData> hero;
  List<RecipeData> recent; // aka history
  List<RecipeData> favorite;
  List<RecipeData> custom;
  int _heroStart;

  DiscoverController() {
    hero = List<RecipeCollectionData>();
    recent = List<RecipeData>();
    favorite = List<RecipeData>();
    custom = List<RecipeData>();
    _heroStart = 0;
  }

  String _genHeroID() {
    return (_heroStart++).toString();
  }

  List<Widget> dummyDiscoverHomepageList(BuildContext context) {
    Random rnd = Random(ParentController.SEED);

    if (hero.length == 0) {
      int lim = rnd.nextInt(5) + 1;
      for (int i = 0; i < lim; i++) {
        hero.add(RecipeCollectionData(Dummy.recipeCollection(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    if (recent.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        recent.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    if (favorite.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        favorite.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    if (custom.length == 0) {
      int lim = rnd.nextInt(5) + 3;
      for (int i = 0; i < lim; i++) {
        custom.add(RecipeData(Dummy.recipe(rnd.nextInt(1000)), _genHeroID()));
      }
    }

    List<Widget> dummyHeroCardList = hero.map((rcd) => rcd.toHeroCard(context)).toList();
    List<Widget> dummyMiniCardList = recent.map((rd) => rd.toMiniCard(context)).toList();
    List<Widget> dummyMiniCardListTwo = favorite.map((rd) => rd.toMiniCard(context)).toList();
    List<Widget> dummyFullCardList = custom.map((rd) => rd.toFullCard(context)).toList();

    return <Widget>[
      HorizontalCardListBuilder(
        height: cardRowHeight(context, heroCardHeight(context)),
        cardList: dummyHeroCardList,
      ),
      ButtonRow(
        headingText: 'My History',
        interactionText: 'SEE ALL',
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => DiscoverFavorites()
          ));
        },
      ),
      HorizontalCardListBuilder(
        height: cardRowHeight(context, miniCardHeight(context)),
        cardList: dummyMiniCardList, // replace
      ),
      ButtonRow(
        headingText: 'My Favorites',
        interactionText: 'SEE ALL',
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => DiscoverFavorites()
          ));
        },
      ),
      HorizontalCardListBuilder(
        height: cardRowHeight(context, miniCardHeight(context)),
        cardList: dummyMiniCardListTwo, // replace
      ),
      ...dummyFullCardList,
    ];
  }
}

class RecipeCollectionData {
  final RecipeCollection _rc;
  final String _heroID;

  RecipeCollectionData(this._rc, this._heroID);

  Widget toHeroCard(BuildContext context) {
    return
      HeroCard(
        cardHeading: _rc.heading,
        cardText: _rc.title,
        cardImage: _rc.thumb,
        heroID: _heroID,
        onTap: (){onTapHeroCard(context);},
      );
  }

  void onTapHeroCard(BuildContext context) {
    // do something
  }
}

class RecipeData {
  final Recipe _r;
  final String _heroID;

  RecipeData(this._r, this._heroID);

  Widget toMiniCard(BuildContext context) {
    return
      MiniRecipeCard(
        cardText: _r.title,
        cardImage: _r.thumb,
        heroID: _heroID,
        onTap: (){_onTapMiniRecipeCard(context);},
      );
  }

  void _onTapMiniRecipeCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RecipeOverview(
            recipeTitle: _r.title,
            heroID: _heroID,
            recipeImage: _r.thumb,
            prepTime: _r.prepTime,
            cookTime: _r.cookTime,
            calories: _r.calories)
    ));
  }

  Widget toFullCard(BuildContext context) {
    return FullRecipeCard(
        cardText: _r.title,
        cardImage: _r.thumb,
        time: _r.cookTime + _r.prepTime,
        calories: _r.calories,
        haveIngredients: 0,
        totalIngredients: 5,
        onTap: (){onTapFullRecipeCard(context);}
    );
  }

  void onTapFullRecipeCard(BuildContext context) {
    // do something
  }
}