import 'dart:math';

class Ingredient {
  int id;
  String name;
  double amount;
  Ingredient.dummy(int seed) {
    Random rnd = Random(seed);
    List<String> names = ["chicken", "potatoe", "garlic", "chocolate", "carrot", "apple", "orange", "rice", "venison"];
    this.id = rnd.nextInt(100);
    this.name = names[rnd.nextInt(names.length)];
    this.amount = 100 * rnd.nextDouble();
  }
}