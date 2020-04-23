import 'package:flutter/material.dart';
import 'package:chef_capp/screen/tabs/tabs.dart';

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