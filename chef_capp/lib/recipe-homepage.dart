import 'package:flutter/material.dart';

class RecipeHomePage extends StatelessWidget {
  List<RecipeCard> _buildGridCards(int count) {
    List<RecipeCard> cards = List.generate(
      count,
        (int index) => RecipeCard()
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(10),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/food.jpg'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title'),
                SizedBox(height: 8.0),
                Text('Secondary Text'),
              ],
            ),
          )
        ],
      )
    );
  }
}

/*

new Center(
        child: Icon(Icons.fastfood, size: 150, color: Colors.brown),
      ),

 */