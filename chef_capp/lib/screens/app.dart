import 'package:chef_capp/index.dart';

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