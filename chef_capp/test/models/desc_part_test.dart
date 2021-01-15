import 'package:flutter_test/flutter_test.dart';
import 'package:chef_capp/index.dart';

// flutter test test/models/desc_part_test.dart

void main() {
  test('should be able to convert to and from json', () {
    final dp_1 = DescPart("a string", TextMod.copy);
    final dp_2 = DescPart.fromJson(dp_1.toJson());
    final dp_3 = DescPart.fromJson(DescPart("another string", TextMod.quantity).toJson());

    expect(dp_1.text == dp_2.text, isTrue);
    expect(dp_1.style == dp_2.style, isTrue);

    expect(dp_1.text == dp_3.text, isFalse);
    expect(dp_1.style == dp_3.style, isFalse);
  });
}