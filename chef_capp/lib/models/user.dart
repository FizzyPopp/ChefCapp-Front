import 'dart:math';

class User {
  // unit preferences
  // dietary restrictions
  int id;
  String email;
  User.dummy(int seed) {
    Random rnd = Random(seed);
    this.id = rnd.nextInt(100);
    this.email = "loblaw@lawblog.com";
  }
}