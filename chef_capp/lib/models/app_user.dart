import 'package:chef_capp/index.dart';
part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  // look at db for more?
  final ID _id;
  final String _email;
  final UnitPreference _weight;
  final List<DietaryRestriction> _restrictions;

  AppUser(ID id, String email, UnitPreference weight, List<DietaryRestriction> restrictions) :
        this._id = id,
        this._email = email,
        this._weight = weight,
        this._restrictions = restrictions;

  ID get id => _id;

  String get email => _email;

  UnitPreference get weight => _weight;

  List<DietaryRestriction> get restrictions => [..._restrictions];

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

enum UnitPreference {
  metric,
  imperial
}