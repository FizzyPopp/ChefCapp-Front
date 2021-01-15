import 'package:chef_capp/index.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        body: SafeArea(
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                MainSliverAppBar(),
              ];
            },
            body: TabBarView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                RecipeHomePage(),
                KitchenHomepage(),
              ],
            ),
          ),
          top: false,
        ),
      ),
    );
  }
}

