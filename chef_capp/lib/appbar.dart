import 'package:flutter/material.dart';
import 'package:chef_capp/tabs.dart';

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