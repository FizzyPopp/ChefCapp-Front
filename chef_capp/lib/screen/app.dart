import 'package:flutter/material.dart';
import 'package:chef_capp/screen/drawer.dart';
import 'package:chef_capp/screen/appbar.dart';
import 'package:chef_capp/screen/recipe_homepage.dart';
import 'package:chef_capp/screen/inventory_homepage.dart';
import 'package:chef_capp/screen/shopping_homepage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //appBar: MainTopBar(),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverMainTopBar(),
              ];
            },
            body: TabBarView(children: <Widget>[
              RecipeHomePage(),
              InventoryHomePage(),
              ShoppingHomePage(),
            ]),
          ),
          top: false,
        ),
        drawer: ChefDrawer(),
      ),
    );
  }
}

/*
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MainTopBar(),
        body: TabBarView(children: <Widget>[
          RecipeHomePage(),
          InventoryHomePage(),
          ShoppingHomePage(),
        ]),
        drawer: ChefDrawer(),
      ),
    );
  }
}
*/