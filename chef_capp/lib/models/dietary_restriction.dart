import 'package:chef_capp/index.dart';

class DietaryRestriction {
  final ID _id;
  final String _name;
  DietaryRestriction(this._id, this._name);
  ID get id => _id;
  String get name => _name;

  factory DietaryRestriction.fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);

    if (data["id"] == null) {
      throw("bad id");
    }
    if (data["name"] == null) {
      throw("bad name");
    }

    return DietaryRestriction(
      ID(data["id"]),
      data["name"]
    );
  }

  String toJson() {
    return jsonEncode({
      "id": _id.toString(),
      "name": _name
    });
  }
}