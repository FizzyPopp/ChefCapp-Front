import 'package:flutter/material.dart';
import 'package:chef_capp/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bloc = LoginBLoC();

  _LoginPageState() {
    var stream = _bloc.authEvent;
    stream.listen((success) {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("login failed");
      }
    }, onError: (error) {
      print("bad bad not good");
    });
  }

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
                      filled: true,
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
                            _bloc.sink.add(AuthEvent(_usernameController.text,
                                _passwordController.text));
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

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
