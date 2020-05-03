import 'package:chef_capp/index.dart';
import 'dart:math';

class ID {
  final String hash;
  ID(this.hash);
  static ID dummy(int seed) {
    return ID(
        "A"
    );
  }
}