import 'package:chef_capp/index.dart';

List<Widget> dummyMiniCardList(BuildContext context) {
  return <Widget>[
    MiniRecipeCard(
      cardText: 'Recipe Numba Wan',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '0069',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview(
              recipeTitle: 'Recipe Numba Wan',
              heroID: '0069',
              recipeImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
              prepTime: 69,
              cookTime: 69,
              calories: 69,)
        ));
      },
    ),
  ];
}

List<Widget> dummyMiniCardListTwo(BuildContext context) {
  return <Widget>[
    MiniRecipeCard(
      cardText: 'Recipe Numba Tuu',
      cardImage: Image.asset('assets/images/recipe00002.jpg',fit: BoxFit.cover,),
      heroID: '0420',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview(
              recipeTitle: 'Recipe Numba Tuu',
              heroID: '0420',
              recipeImage: Image.asset('assets/images/recipe00002.jpg',fit: BoxFit.cover,),
              prepTime: 420,
              cookTime: 420,
              calories: 420,)
        ));
      },
    ),
  ];
}

List<Widget> dummyHeroCardList(BuildContext context) {
  return <Widget>[
    HeroCard(
      cardHeading: 'COLLECTION',
      cardText: 'Hero Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg', fit: BoxFit.cover,),
      heroID: '0005',
      onTap: (){

      },
    ),
  ];
}

List<Widget> dummyDiscoverHomepageList(BuildContext context) {
  return <Widget>[
    HorizontalCardListBuilder(
      height: cardRowHeight(context, heroCardHeight(context)),
      cardList: dummyHeroCardList(context),
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
      cardList: dummyMiniCardList(context),
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
      cardList: dummyMiniCardListTwo(context),
    ),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
  ];
}