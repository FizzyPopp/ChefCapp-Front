import 'package:flutter/material.dart';

class MainTabs extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: <Widget>[
      Tab(
        icon: Icon(Icons.fastfood),
        //text: 'Recipes',
      ),
      Tab(
        icon: Icon(Icons.kitchen),
        //text: 'Inventory',
      ),
      Tab(
        icon: Icon(Icons.shopping_cart),
        //text: 'Shopping',
      ),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
