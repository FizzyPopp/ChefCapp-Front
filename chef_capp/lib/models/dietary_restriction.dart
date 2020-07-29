import 'package:chef_capp/index.dart';
part 'dietary_restriction.g.dart';

@JsonSerializable(explicitToJson: true)
class DietaryRestriction {
  final ID _id;
  final String _name;

  DietaryRestriction(ID id, String name) :
        this._id = id,
        this._name = name;

  ID get id => _id;

  String get name => _name;

  factory DietaryRestriction.fromJson(Map<String, dynamic> json) => _$DietaryRestrictionFromJson(json);

  Map<String, dynamic> toJson() => _$DietaryRestrictionToJson(this);
}