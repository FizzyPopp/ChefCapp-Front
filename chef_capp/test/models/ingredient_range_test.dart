import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:chef_capp/index.dart';

// flutter test test/models/ingredient_range_test.dart

void main() {
  test('constructor should validate range', () {
    expect(() => IngredientRange([0], Dummy.ingredient(0)), throwsA(anything));
    expect(() => IngredientRange([-1,0], Dummy.ingredient(0)), throwsA(anything));
  });

  test('should be able to convert to and from json', () {
    final ir_1 = IngredientRange([0,1], Dummy.ingredient(0));
    final ir_2 = IngredientRange.fromJson(ir_1.toJson());

    expect(ir_1.id.equals(ir_2.id), isTrue);
    expect(ir_1.name == ir_2.name, isTrue);
    expect(ir_1.plural == ir_2.plural, isTrue);
    expect(ir_1.quantity == ir_2.quantity, isTrue);
    expect(ir_1.unit == ir_2.unit, isTrue);
    expect(listEquals(ir_1.range, ir_2.range), isTrue);
  });
}