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

List<Widget> dummyFullCardList(BuildContext context) {
  return <Widget>[
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
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
    HorizontalListBuilder(
      height: cardRowHeight(context, heroCardHeight(context)),
      widgetList: dummyHeroCardList(context),
    ),
    ButtonRow(
      headingText: 'My History',
      interactionText: 'SEE ALL',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => DiscoverHistory()
        ));
      },
    ),
    HorizontalListBuilder(
      height: cardRowHeight(context, miniCardHeight(context)),
      widgetList: dummyMiniCardList(context),
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
    HorizontalListBuilder(
      height: cardRowHeight(context, miniCardHeight(context)),
      widgetList: dummyMiniCardListTwo(context),
    ),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
    FullRecipeCard(),
  ];
}

final List<Widget> dummyIngredientList = [
  IngredientRow(
    quantity: '100 gr',
    ingredient: 'One tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '500 ml',
    ingredient: 'Another tasty ingredient',
    available: false,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  IngredientRow(
    quantity: '420',
    ingredient: 'Some tasty ingredient',
    available: true,
  ),
  SizedBox(height: 60.0),
];

final List<Widget> dummyStepList = [
  StepRow(
    step: 1,
    directions: "Yeet the ingridients and dab on the bowl until achieved consistency of lit.",
  ),
  StepRow(
    step: 2,
    directions: "Throw shade on the oven",
  ),
  StepRow(
    step: 3,
    directions: "Roast those badboys until golden brown and crispy",
  ),
  SizedBox(height: 60.0),
];