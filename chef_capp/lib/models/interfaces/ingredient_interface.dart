import 'package:chef_capp/index.dart';

abstract class IngredientInterface {
  ID get id;
  String get name;
  String get plural;
  double get quantity;
  String get unit;
  String get category;
  List<double> get range;
  String get amount;
}