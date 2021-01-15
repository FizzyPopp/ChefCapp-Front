import 'package:chef_capp/index.dart';
part 'dietary_restriction.g.dart';

@JsonSerializable(explicitToJson: true)
class DietaryRestriction implements EqualsInterface {
  final ID _id;
  final String _name;

  DietaryRestriction(ID id, String name) :
        this._id = id,
        this._name = name;

  ID get id => _id;

  String get name => _name;

  bool equals(var other) {
    if (other is! DietaryRestriction) return false;
    return jsonEncode(this.toJson()) == jsonEncode((other as DietaryRestriction).toJson());
  }

  factory DietaryRestriction.fromJson(Map<String, dynamic> json) => _$DietaryRestrictionFromJson(json);

  Map<String, dynamic> toJson() => _$DietaryRestrictionToJson(this);
}