import 'package:chef_capp/index.dart';
import 'dart:math';

/* will need a heck of a lot more fields and maybe more classes to fully describe an ingredient */

class Ingredient {
  final ID _id;
  final String _name;
  final double _amount;
  Ingredient(this._id, this._name, this._amount);
  static Ingredient dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["chicken", "potatoe", "garlic", "chocolate", "carrot", "apple", "orange", "rice", "venison"];
    return Ingredient(
        ID.dummy(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)],
        (100 * rnd.nextDouble())
    );
  }
}