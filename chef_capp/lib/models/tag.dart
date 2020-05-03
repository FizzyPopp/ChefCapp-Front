import 'package:chef_capp/index.dart';
import 'dart:math';

class Tag {
  final ID _id;
  final String _name;
  Tag(this._id, this._name);
  static Tag dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["spicy", "hot", "salty", "sweet", "gluten-free", "keto", "vegetarian", "lunch", "dinner", "breakfast", "dessert"];
    return Tag(
        ID.dummy(rnd.nextInt(100)),
        names[rnd.nextInt(names.length)]
    );
  }
}