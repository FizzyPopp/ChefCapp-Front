import 'package:chef_capp/index.dart';
part 'id.g.dart';

// use dart uuid package?
@JsonSerializable()
class ID implements EqualsInterface {
  final String _hash;

  ID(String hash) :
        this._hash = hash;

  String get hash => _hash;

  @override
  String toString() => _hash;

  bool equals(var other) {
    if (other is! ID) return false;
    return other.hash == this.hash;
  }

  factory ID.fromJson(Map<String, dynamic> json) => _$IDFromJson(json);

  Map<String, dynamic> toJson() => _$IDToJson(this);
}