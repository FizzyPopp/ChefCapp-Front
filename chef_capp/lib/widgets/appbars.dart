import 'package:chef_capp/index.dart';

class MainSliverAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //expandedHeight: 200.0,
      title: Text('Chef Capp'),
      floating: true,
      snap: true,
      forceElevated: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            print('Filter Button');
          },
        )
      ],
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.explore),
            text: 'DISCOVER',
          ),
          Tab(
            icon: Icon(Icons.kitchen),
            text: 'MY KITCHEN',
          ),
        ],
      ),
    );
  }
}

class RecipeSliverAppBar extends StatelessWidget {
  final Image appBarImage;
  final String appBarTitle;
  final String heroID;
  final int prepTime;
  final int cookTime;
  final int calories;
  
  RecipeSliverAppBar({
    @required this.appBarImage,
    @required this.appBarTitle,
    @required this.heroID,
    @required this.prepTime,
    @required this.cookTime,
    @required this.calories,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).cardColor,
      expandedHeight: 400.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          padding: EdgeInsets.only(bottom: 156.0),
          child: Hero(
            tag: heroID,
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
              child: appBarImage,
            ),
          ),
        ),
      ),
      bottom: RecipeHeader(
        recipeTitle: appBarTitle,
        prepTime: prepTime,
        cookTime: cookTime,
        calories: calories,
      ),
    );
  }
}


class MainAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Chef Capp'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.filter_list,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter Button');
            },
        )
      ],
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.explore),
            text: 'DISCOVER',
          ),
          Tab(
            icon: Icon(Icons.kitchen),
            text: 'MY KITCHEN',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight + 26);
}


class MainTopBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Chef Capp'),
      bottom: MainTabs(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            print('Search Button');
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            print('Filter Button');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class SliverMainTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Chef Capp"),
      forceElevated: true,
      elevation: 4,
      backgroundColor: Colors.orange[800],
      expandedHeight: 130.0,
      floating: true,
      pinned: false,
      snap: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            print('Search Button');
          },
        ),
        IconButton(
                    icon: Icon(
                      Icons.tune,
                      semanticLabel: 'filter',
                    ),
                    onPressed: () {
                      print('Filter Button');
                    },
                  ),
      ],
      bottom: MainTabs(),
    );
  }
}
