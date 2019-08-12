import 'package:flutter/material.dart';
import 'package:chef_capp/drawer.dart';
import 'package:chef_capp/appbar.dart';
import 'package:chef_capp/recipe_homepage.dart';
import 'package:chef_capp/inventory_homepage.dart';
import 'package:chef_capp/shopping_homepage.dart';

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