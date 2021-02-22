import 'package:chef_capp/index.dart';
part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  // look at db for more?
  final ID _id;
  final String _email;

  AppUser(ID id, String email) :
        this._id = id,
        this._email = email;

  ID get id => _id;

  String get email => _email;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

enum UnitPreference {
  metric,
  imperial
}