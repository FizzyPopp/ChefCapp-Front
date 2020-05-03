import 'package:chef_capp/index.dart';
import 'dart:math';

class Equipment {
  final ID _id;
  final String _name;
  Equipment (this._id, this._name);
  static Equipment dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["oven", "chef's knife", "microwave", "stand mixer", "grater", "muffin tin", "wax paper", "whisk", "melon baller"];
    return Equipment(
        ID.dummy(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)]
    );
  }
}