import 'package:flutter/material.dart';
import 'package:chef_capp/login.dart';
import 'package:chef_capp/app.dart';
import 'package:chef_capp/tabs.dart';

import 'package:chef_capp/recipe_homepage.dart';
import 'package:chef_capp/recipe_overview.dart';

void main() => runApp(TestApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Chef Capp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      color: Colors.orange[800],
      initialRoute: '/',
      routes: {
        '/': (context) => Onboarding(),
        '/home': (context) => App(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange[800],
      initialRoute: '/',
      routes: {
        '/': (context) => RecipeOverview(),
      },
    );
  }
}


class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/food.jpg'),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        child: Text('Start using Chefs Capp to view and save all your favorite '
                            'recipes, manage your inventory, and more!'),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
            Container(
              child: Column(
                        children: <Widget>[
                          RaisedButton(
                            child: Text('Get Started'),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            onPressed: () {

                            },
                          ),
                          SizedBox(height: 12.0),
                          RaisedButton(
                            child: Text('Log In'),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        minimum: EdgeInsets.symmetric(vertical: 20.0),
      ),
    );
  }
}