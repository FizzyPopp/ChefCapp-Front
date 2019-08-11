import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BackButton(),
            Container(
              child: Column(
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Text('Welcome back, Chef!'),
                    ),
                    SizedBox(height: 12.0),
                    Image(
                      image: AssetImage('assets/food.jpg'),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled:true,
                              labelText: 'Username',
                            ),
                          ),
                  SizedBox(height: 12.0),
                  TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Forgot password?'),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        onPressed: () {
                          _usernameController.clear();
                          _passwordController.clear();
                        },
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Log In'),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (Route<dynamic> route) => false
                            );
                          },
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

/*
Row(
        children: <Widget>[
          ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height:80.0),
                Column(
                  children: <Widget>[
                    Icon(Icons.fastfood),
                    SizedBox(height: 16.0),
                    Text('Chef Capp'),
                  ]
                ),
                SizedBox(height: 120.0),
                // [Name]
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled:true,
                    labelText: 'Username',
                  ),
                ),
                // spacer
                SizedBox(height: 12.0),
                // [Password]
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      child: Text('Log in'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return App();
                            }
                          ),
                        );
                      },
                    ),
                  ]
                ),
              ]
            ),
        ],
      ),
*/