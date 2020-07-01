import 'package:chef_capp/index.dart';

class RecipeStep {
  final ID _id;
  // tempting to put a reference to the parent Recipe here, but don't think instantiation would work out with all these final fields
  final List<String> _chips;
  final List<DescPart> _description;
  RecipeStep(this._id, this._chips, this._description);
  ID get id => _id;
  List<String> get chips => [..._chips];
  List<DescPart> get description => [..._description];

  static RecipeStep fromDB(data, RecipeInterface ri) {
    // sanitize
    if (data["id"] == null || data["id"] == "") {
      throw ("bad id");
    }
    if (data["ingredients"] == null || data["ingredients"] is! Map) {
      throw ("bad ingredients");
    }
    if (data["instructions"] == null || data["instructions"] is! Map) {
      throw ("bad instructions");
    }

    // parse
    List<String> chips = [];
    // don't do this, this is just a hack to get something on the page
    // should actually read ingredients from ri
    data["ingredients"].forEach((k, v) {
      if (k != "keys") {
        if (v["name"] == null) {
          throw ("bad ingredient name");
        }
        if (v["name"]["singular"] == null) {
          throw ("bad ingredient name singular");
        }
        chips.add(v["name"]["singular"]);
      }
    });

    List<DescPart> description = _buildDescriptionFromDB(data["instructions"]);

    return RecipeStep(ID(data["id"]), chips, description);
  }

  static List<DescPart> _buildDescriptionFromDB(data) {
    // sanitize
    if (data["abstract"] == null || data["abstract"] is! List) {
      throw ("bad instruction abstract");
    }
    for (String s in data["abstract"].toSet()) {
      if (data[s] == null || data[s] is! List) {
        throw ("bad instruction abstract types");
      }
    }

    // parse
    List<DescPart> out = [];
    Map<String, int> index = Map.fromIterable(data["abstract"].toSet(), key: (s) => s, value: (_) => 0);
    for (String a in data["abstract"]) {
      if (data[a].length <= index[a]) {
        // later on, will want to throw an error
        out.add(DescPart("MISSING", DescPart.stringToTextMod(a)));
      } else {
        out.add(DescPart(data[a][index[a]++], DescPart.stringToTextMod(a)));
      }
    }

    // return
    return out;
  }
}