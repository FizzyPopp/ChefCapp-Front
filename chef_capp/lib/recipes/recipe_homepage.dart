import 'package:flutter/material.dart';

import 'package:chef_capp/bloc/recipe_homepage_bloc.dart';

// https://medium.com/flutter-community/flutter-bloc-pattern-for-dummies-like-me-c22d40f05a56
// https://github.com/SeemannMx/flutter_app_bloc/blob/master/lib/CounterBLoC.dart

class RecipeHomePage extends StatelessWidget {
  List<RecipeCard> _buildGridCards(int count) {
    List<RecipeCard> cards = List.generate(count, (int index) => RecipeCard());
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

final _bloc = RecipeSummaryBLoC();

// all cards are listening to the same stream, so all of them update when data is added to the stream.
// but also, there is a stream backlog???

class RecipeCard extends StatelessWidget {
  /*
  final String title;

  RecipeCard(this.title) {

  }
  */

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/food.jpg'), // here
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getTitle(),
                  SizedBox(height: 8.0),
                  Text('Secondary Text'), // here
                ],
              ),
            )
          ],
        ));
  }

  _getTitle() {
    _bloc.recommend_card_sink.add(RecommendCardEvent());
    return StreamBuilder(
        stream: _bloc.recommend_card_stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Text(snapshot.data.toString());
        });
  }
}

/*

new Center(
        child: Icon(Icons.fastfood, size: 150, color: Colors.brown),
      ),

 */
