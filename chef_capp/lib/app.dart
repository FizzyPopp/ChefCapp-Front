import 'package:flutter/material.dart';
import 'package:chef_capp/drawer.dart';
import 'package:chef_capp/appbar.dart';
import 'package:chef_capp/recipes/recipe_homepage.dart';
import 'package:chef_capp/inventory-homepage.dart';
import 'package:chef_capp/shopping-homepage.dart';

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