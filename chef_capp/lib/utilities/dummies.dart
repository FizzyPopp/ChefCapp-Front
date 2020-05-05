import 'package:chef_capp/index.dart';

List<Widget> dummyMiniCardList(BuildContext context) {
  return <Widget>[
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '0069',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '0002',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '0003',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '0004',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
  ];
}

List<Widget> dummyMiniCardListTwo(BuildContext context) {
  return <Widget>[
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '000a',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '000b',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '000c',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    MiniRecipeCard(
      cardText: 'Mini Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg',fit: BoxFit.cover,),
      heroID: '000d',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
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
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    HeroCard(
      cardHeading: 'COLLECTION',
      cardText: 'Hero Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg', fit: BoxFit.cover,),
      heroID: '0006',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
    ),
    HeroCard(
      cardHeading: 'COLLECTION',
      cardText: 'Hero Card Placeholder Text',
      cardImage: Image.asset('assets/images/recipe00001.jpg', fit: BoxFit.cover,),
      heroID: '0007',
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
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