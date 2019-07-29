import 'package:flutter/foundation.dart';

enum Category {all, beef, chicken, veggie, }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    @required this.name,
    @required this.time,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(time != null);

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int time;

  String get assetName
}