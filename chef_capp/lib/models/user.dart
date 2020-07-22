import 'package:chef_capp/index.dart';

class User {
  // look at db for more?
  final ID _id;
  final String _email;
  final UnitPreference _weight;
  final List<DietaryRestriction> _restrictions;

  User(this._id, this._email, this._weight, this._restrictions);

  factory User.fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);

    if (data["id"] == null) {
      throw("bad id");
    }
    if (data["email"] == null) {
      throw("bad email");
    }
    if (data["weight"] == null) {
      throw("bad weight");
    }
    if (data["restrictions"] == null ||
        data["restrictions"] is! List) {
      throw("bad restrictions");
    }

    UnitPreference weight;
    for (UnitPreference p in UnitPreference.values) {
      if (p.toString() == data['weight']) {
        weight = p;
        break;
      }
    }
    if (weight == null) {
      throw ("Cannot find weight in UnitPreferences");
    }

    List<DietaryRestriction> restrictions;
    for (String r in data["restrictions"]) {
      restrictions.add(DietaryRestriction.fromJson(r));
    }

    return new User(
        ID(data['id']),
        data['email'],
        weight,
        restrictions
    );
  }

  String toJson() {
    List<String> restrictions = [];
    for (DietaryRestriction r in _restrictions) {
      restrictions.add(r.toJson());
    }

    return jsonEncode({
      "id": _id.toString(),
      "email": _email,
      "weight": _weight.toString(),
      "restrictions": jsonEncode(restrictions)
    });
  }

  ID get id => _id;
  String get email => _email;
  UnitPreference get weight => _weight;
  List<DietaryRestriction> get restrictions => [..._restrictions];
}

enum UnitPreference {
  metric,
  imperial
}