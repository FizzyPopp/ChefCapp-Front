import 'dart:math';

class Tag {
  int id;
  String name;
  Tag.dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["spicy", "hot", "salty", "sweet", "gluten-free", "keto", "vegetarian", "lunch", "dinner", "breakfast", "dessert"];
    this.id = rnd.nextInt(100);
    this.name = names[rnd.nextInt(names.length)];
  }
}