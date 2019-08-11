import 'package:flutter/material.dart';

class RecipeOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.orange[800],
          onPressed: () {
            print('Get Cooking!');
          },
          icon: Icon(Icons.hot_tub),
          label: Text('Get Cooking!'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          top: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 400.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    //titlePadding: EdgeInsets.only(left: 18, bottom: 16),
                    background: Container(
                      padding: EdgeInsets.only(bottom: 150.0),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black45, Colors.transparent],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/recipe00001.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.share),
                            tooltip: 'Add new entry',
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                  bottom: RecipeTitle(),
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

class RecipeTitle extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(width: 16,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'SERVES 2',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16,),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text(
                  'Rich In Protein Cobbe Salad',
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
                          Text('20 min prep'),
                          Text('+ 10 min cook')
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
                      Text('140 cal / serving'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.orange,
                indicatorWeight: 4,
                tabs: <Widget>[
                  Tab(
                    text: 'INGREDIENTS',
                  ),
                  Tab(
                    text: 'DIRECTIONS',
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView(
        children: <Widget>[
          RawMaterialButton(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange[800],),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.orange[800],
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Add All Missing To Shopping List',
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            onPressed: null,
          ),
          SizedBox(height: 16),
          Table(
            //border: TableBorder.all(),
            columnWidths: {
              0: FixedColumnWidth(80.0),
              2: FixedColumnWidth(25.0),
            },
            children: [
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
              TableRow(children: [
                IngredientTableQuantity(),
                IngredientTableTitle(),
                IngredientTableLabel(),
              ]),
            ],
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}

class DirectionsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

const tableVerticalPadding = 5.0;

class IngredientTableQuantity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: tableVerticalPadding),
      child: Text('3 tbsp'),
    );
  }
}

class IngredientTableTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: tableVerticalPadding),
      child: Text('Chopped garlic'),
    );
  }
}

class IngredientTableLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: tableVerticalPadding),
      child: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    );
  }
}
