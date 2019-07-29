import 'package:chef_capp/app.dart';
import 'package:flutter/material.dart';

import 'package:chef_capp/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Chef Capp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: LoginPage(),
    );
  }
}