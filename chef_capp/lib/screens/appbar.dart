import 'package:chef_capp/index.dart';

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
