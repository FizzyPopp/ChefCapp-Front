import 'package:chef_capp/index.dart';

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