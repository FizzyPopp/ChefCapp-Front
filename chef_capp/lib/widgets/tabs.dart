import 'package:chef_capp/index.dart';

class MainTabs extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 4,
      tabs: <Widget>[
        Tab(
            icon: Icon(Icons.explore),
            text: 'DISCOVER',
          ),
        Tab(
            icon: Icon(Icons.kitchen),
            text: 'MY KITCHEN',
          ),
        Tab(
            icon: Icon(Icons.shopping_cart),
            text: 'MARKET',
          ),
      ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class InventoryTabs extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      tabs: <Widget>[
        Tab(
          text: 'Short',
        ),
        Tab(
          text: 'Long',
        ),
        Tab(
          text: 'Equipment',
        ),
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


