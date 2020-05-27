import 'package:chef_capp/index.dart';

class RecipeOverview extends StatelessWidget {
  final String recipeTitle;
  final String heroID;
  final Image recipeImage;
  final int prepTime;
  final int cookTime;
  final int calories;
  
  RecipeOverview({
    @required this.recipeTitle,
    @required this.heroID,
    @required this.recipeImage,
    @required this.prepTime,
    @required this.cookTime,
    @required this.calories,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryIconTheme.color,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => RecipeCooking()
            ));
          },
          icon: Icon(Icons.hot_tub),
          label: Text('GET COOKING!'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          top: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                RecipeSliverAppBar(
                  appBarImage: recipeImage,
                  appBarTitle: recipeTitle,
                  heroID: heroID,
                  prepTime: prepTime,
                  cookTime: cookTime,
                  calories: calories,
                ),
              ];
            },
            body: TabBarView(children: <Widget>[
              IngredientsOverview(),
              DirectionsOverview(),
            ]),
          ),
        ),
      ),
    );
  }
}

class RecipeHeader extends StatelessWidget with PreferredSizeWidget {
  final String recipeTitle;
  final int prepTime;
  final int cookTime;
  final int calories;

  RecipeHeader({
    @required this.recipeTitle,
    @required this.prepTime,
    @required this.cookTime,
    @required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text(
                  recipeTitle,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(prepTime.toString() + ' min prep'),
                          Text('+ ' + cookTime.toString() + ' min cook')
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.whatshot,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(calories.toString() + ' cal / serving'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              TabBar(
                labelColor: Theme.of(context).textTheme.body1.color,
                indicatorColor: Theme.of(context).primaryColor,
                //indicatorWeight: 4,
                tabs: <Widget>[
                  Tab(
                    text: 'INGREDIENTS',
                  ),
                  Tab(
                    text: 'PREVIEW',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class IngredientsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalListBuilder(dummyIngredientList);
  }
}

class DirectionsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalListBuilder(dummyStepList);
  }
}

