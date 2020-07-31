import 'package:flutter_test/flutter_test.dart';
import 'package:chef_capp/index.dart';

// flutter test test/models/id_test.dart

void main() {
  test('should be able to convert to and from json', () {
    final id_1 = ID("hash");
    final id_2 = ID.fromJson(id_1.toJson());
    final id_3 = ID.fromJson(ID("another hash").toJson());

    expect(id_1.equals(id_2), isTrue);
    expect(id_1.hash == id_2.hash, isTrue);
    expect(id_1.toString() == id_2.toString(), isTrue);

    expect(id_1.equals(id_3), isFalse);
    expect(id_1.hash == id_3.hash, isFalse);
    expect(id_1.toString() == id_3.toString(), isFalse);
  });
}