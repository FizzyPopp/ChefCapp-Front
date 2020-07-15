import 'package:chef_capp/index.dart';
import 'package:flutter/cupertino.dart';

class KitchenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalListBuilder(
      [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text('Carbs'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Potatoes'),
                    Text('2')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ingredient'),
                    Text('Quantity'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text('Category'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Potatoes'),
                    Text('2')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ingredient'),
                    Text('Quantity'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text('Category'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Potatoes'),
                    Text('2')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ingredient'),
                    Text('Quantity'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text('Category'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Potatoes'),
                    Text('2')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ingredient'),
                    Text('Quantity'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text('Category'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Potatoes'),
                    Text('2')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(xMargins),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ingredient'),
                    Text('Quantity'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}


class InventoryHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: InventoryTabs(),
        body: TabBarView(
          children: <Widget>[
            Tab(
              child: Text('Tab 1'),
            ),
            Tab(
              child: Text('Tab 2'),
            ),
            Tab(
              child: Text('Tab 3'),
            ),
          ]
        ),
      ),
    );
  }
}

/*
class InventoryHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: DefaultTabController(
          length: 3,
          child: InventoryTabs()
        ),
      ),
    );
  }
}
*/

/*
child: Icon(Icons.kitchen, size: 150, color: Colors.brown),
*/