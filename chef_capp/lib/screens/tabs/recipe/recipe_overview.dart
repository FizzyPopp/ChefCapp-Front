import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class RecipeOverview extends StatelessWidget {
  final RecipeController rc;

  RecipeOverview({@required this.rc});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: this.rc,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).primaryIconTheme.color,
            onPressed: () {
              rc.getCooking(context);
            },
            icon: Icon(Icons.hot_tub),
            label: Consumer<RecipeController>(
                  builder: (context, rc, _) {
                    return Text(rc.getCookingButtonText());
                  },
                ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SafeArea(
            top: false,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  RecipeSliverAppBar(
                    rc: rc,
                  ),
                ];
              },
              body: TabBarView(children: <Widget>[
                IngredientsOverview(rc.rd.r.ingredients),
                Consumer<RecipeController>(
                  builder: (context, rc, _) {
                    return DirectionsOverview(rc.rd.r.steps);
                  },
                ),
                //DirectionsOverview(rc.rd.r.steps),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeHeader extends StatelessWidget with PreferredSizeWidget {
  final RecipeController rc;

  RecipeHeader({@required this.rc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text(
                  rc.rd.r.title,
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
                          Text(rc.rd.r.prepTime.toString() + ' min prep'),
                          Text('+ ' + rc.rd.r.cookTime.toString() + ' min cook')
                        ],
                      )
                    ],
                  ),
                  Row(
                    // STATIC PLACEHOLDER!!!
                    children: <Widget>[
                      Icon(
                        Icons.face, //Icons.whatshot,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Text("Serves 4"), //Text(rc.rd.r.calories.toString() + ' cal / serving'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
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
  final List<Ingredient> ingredients;

  IngredientsOverview(this.ingredients);

  @override
  Widget build(BuildContext context) {
    var r = ingredients
        .map((i) => IngredientRow(
            quantity: i.amount, ingredient: i.name, available: true))
        .toList();
    return VerticalListBuilder([...r, SizedBox(height: 60.0)]);
  }
}

class DirectionsOverview extends StatelessWidget {
  final List<RecipeStep> steps;

  DirectionsOverview(this.steps);

  @override
  Widget build(BuildContext context) {
    var r = steps
        .asMap()
        .map((i, s) => MapEntry(
            i,
            StepRow(
              step: i+1,
              directions: buildStepDescription(s),
            )))
        .values
        .toList();
    return VerticalListBuilder([...r, SizedBox(height: 60.0)]);
  }

  String buildStepDescription(RecipeStep step) {
    return step.description.map((d) => d.text).join();
  }
}
