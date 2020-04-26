import 'dart:math';

class Equipment {
  int id;
  String name;
  Equipment.dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["oven", "chef's knife", "microwave", "stand mixer", "grater", "muffin tin", "wax paper", "whisk", "melon baller"];
    this.id = rnd.nextInt(100);
    this.name = names[rnd.nextInt(names.length)];
  }
}