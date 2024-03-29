import 'package:chef_capp/index.dart';

class MainSliverAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //expandedHeight: 200.0,
      title: Text('Chef Capp'),
      floating: false,
      snap: false,
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
  final RecipeController rc;
  
  RecipeSliverAppBar({
    @required this.rc,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).canvasColor,
      expandedHeight: 400.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          padding: EdgeInsets.only(bottom: 156.0),
          child: Hero(
            tag: rc.rd.heroID,
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
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.jpg',
                image: rc.rd.r.imgURL,
                fit: BoxFit.cover,
              )
            ),
          ),
        ),
      ),
      bottom: RecipeHeader(
        rc: rc
      ),
    );
  }
}

class GenericAppBar extends StatelessWidget with PreferredSizeWidget{
  final String appBarTitle;

  GenericAppBar({
    @required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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

