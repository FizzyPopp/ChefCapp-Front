import 'package:chef_capp/index.dart';
import 'dart:math';

class User {
  // unit preferences
  // dietary restrictions
  final ID _id;
  final String _email;
  User(this._id, this._email);
  static User dummy(int seed) {
    Random rnd = Random(seed);
    return User(
        ID.dummy(rnd.nextInt(100)),
        "loblaw@lawblog.com"
    );
  }
}