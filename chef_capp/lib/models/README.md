# MODELS

Immutable, serializable classes to hold data. Many contain methods to parse json from the DB.

To generate *.g.dart classes, delete the old ones (`rm lib/models/*.g.dart`), then: `flutter pub run build_runner build`