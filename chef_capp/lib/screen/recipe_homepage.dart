import 'package:flutter/material.dart';
import 'package:chef_capp/screen/recipe_overview.dart';
//import 'package:chef_capp/globals.dart';

const double heroCardMargins = 6;
const double horizontalCardPadding = 2 * heroCardMargins;
const double horizontalPadding = 3 * heroCardMargins;
const double verticalTitlePadding = 10;

List<Widget> buildWidgetList(
    int count,
    Widget widget,
    {
      bool horizontal = false,
      bool vertical = false,
      double gap = 4.0,
    }
    ) {
    List<Widget> cards = List.generate(
      count,
      (int index) => widget
    );
    double horizontalGap = 0;
    double verticalGap = 0;
    if (vertical)
      {
        verticalGap = gap;
      }
    if (horizontal)
      {
        horizontalGap = gap;
      }
    if (vertical || horizontal)
      {
        var n = 1;
        do {
          cards.insert(n, SizedBox(
            height: verticalGap,
            width: horizontalGap,
          ));
          n += 2;
        }
        while (n <= count * 2 - 1);
      }
  return cards;
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}
double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

class RecipeHomePage extends StatelessWidget {

  RecipeHomePage() {
    //var state = new Globals();
    //print(state.username);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: screenWidth(context, dividedBy: 1.4),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: horizontalCardPadding),
            scrollDirection: Axis.horizontal,
            children: buildWidgetList(5, HeroCard()),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            //vertical: verticalTitlePadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'My History',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              RawMaterialButton(
                //padding: EdgeInsets.only(right: 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orange[800],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.orange[800],
                    ),
                  ],
                ),
                onPressed: (){
                  print('Go to history');
                },
              )
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: horizontalCardPadding),
            scrollDirection: Axis.horizontal,
            children: buildWidgetList(5, MiniRecipeCard()),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            //vertical: verticalTitlePadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'My Favorites',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              RawMaterialButton(
                //padding: EdgeInsets.only(right: 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orange[800],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.orange[800],
                    ),
                  ],
                ),
                onPressed: (){
                  print('Go to favorites');
                },
              )
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: horizontalCardPadding),
            scrollDirection: Axis.horizontal,
            children: buildWidgetList(5, MiniRecipeCard()),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalTitlePadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recommended for Me',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ],
          ),
        ),
        FullRecipeCard(),
        FullRecipeCard(),
        FullRecipeCard(),
        FullRecipeCard(),
      ],
    );
  }
}

class HeroCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: heroCardMargins),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: (screenWidth(context) - heroCardMargins * 6)
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      'assets/food.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: <Color> [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: <Widget> [
                                  RecipeTag(
                                    text: 'raw vegan',
                                    colors: <Color> [
                                      Colors.purple[400],
                                      Colors.purple[900],
                                    ],
                                  ),
                                  RecipeTag(
                                    text: 'lunch',
                                    colors: <Color> [
                                      Colors.purple[400],
                                      Colors.purple[900],
                                    ],
                                  ),
                                  RecipeTag(
                                    text: 'token',
                                    colors: <Color> [
                                      Colors.purple[400],
                                      Colors.purple[900],
                                    ],
                                  ),
                                ]
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: <Widget> [
                                  RecipeTag(
                                    text: 'all ingredients on hand',
                                    colors: <Color> [
                                      Colors.lightBlue[400],
                                      Colors.green,
                                    ],
                                  ),
                                ]
                              ),
                            ],
                          ),
                          Text(
                            '18 Easy Weeknight Dinner Recipes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

class FullRecipeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(horizontal: heroCardMargins * 2,),
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(heroCardMargins),
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 7 / 6,
                child: Image.asset(
                  'assets/recipe00001.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                      'Cold Noodles With Peanut Butter Sauce',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 16,
                              ),
                              SizedBox(width: 5.0),
                              Text('20 min'),
                            ],
                          ),
                          SizedBox(width: 16.0),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                size: 16,
                              ),
                              SizedBox(width: 5.0),
                              Text('345 cal'),
                            ],
                          ),
                        ],
                      ),
                      RecipeTag(
                                      text: 'all ingredients on hand',
                                      colors: <Color> [
                                        Colors.lightBlue[400],
                                        Colors.green,
                                      ],
                                    ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniRecipeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => RecipeOverview()
        ));
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.zero,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(heroCardMargins),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 7 / 6,
                child: Image.asset(
                  'assets/recipe00001.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Cold Noodles With Peanut Butter Sauce',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeTag extends StatelessWidget {
  RecipeTag({this.colors, this.text,});

  final text;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500) ,
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}