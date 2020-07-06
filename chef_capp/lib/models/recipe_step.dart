import 'package:chef_capp/index.dart';

class RecipeStep {
  final ID _id;
  final ID _previous;
  final ID _next;
  // tempting to put a reference to the parent Recipe here, but don't think instantiation would work out with all these final fields
  final List<String> _chips;
  final List<DescPart> _description;
  RecipeStep(this._id, this._previous, this._next, this._chips, this._description);
  ID get id => _id;
  ID get previous => _previous;
  ID get next => _next;
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
    if (data["previous"] == null) {
      throw ("bad previous id");
    }
    if (data["next"] == null) {
      throw ("bad next id");
    }

    // parse
    List<String> chips = _buildChips(data["ingredients"], ri);

    List<DescPart> description = _buildDescriptionFromDB(data["instructions"]);

    return RecipeStep(ID(data["id"]), ID(data["previous"]), ID(data["next"]), chips, description);
  }

  static List<String> _buildChips(data, RecipeInterface ri) {
    List<Ingredient> chipIngredients = Ingredient.listFromDB(data);
    // make sure all chip ingredients are included in the recipe
    for (Ingredient chipIngredient in chipIngredients) {
      bool inRecipe = false;
      for (Ingredient recipeIngredient in ri.ingredients) {
        if (chipIngredient.equals(recipeIngredient)) {
          inRecipe = true;
          break;
        }
      }
      if (!inRecipe) {
        throw ("chip ingredient is not in recipe ingredients");
      }
    }
    // somehow order chips by the order they appear in the description
    return chipIngredients.map((i) {
      if (i.quantity == 1) {
        return "${i.amount} ${i.name}";
      } else {
        return "${i.amount} ${i.plural}";
      }
    }).toList();
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

  static List<RecipeStep> orderSteps(List<RecipeStep> steps) {
    List<RecipeStep> orderedSteps = [];

    if (steps.length != 0) {
      // add "random" step to orderedSteps
      orderedSteps.add(steps.removeAt(0));
      // find all the next steps
      while (true) {
        bool foundStep = false;
        for (int i = 0; i < steps.length; i++) {
          if (steps[i].id.equals(orderedSteps[0].next)) {
            orderedSteps.insert(0, steps.removeAt(i));
            foundStep = true;
            break;
          }
        }
        if (!foundStep) {
          break;
        }
      }
      orderedSteps = List.from(orderedSteps.reversed);
      // find all the previous steps
      while (true) {
        bool foundStep = false;
        for (int i = 0; i < steps.length; i++) {
          if (steps[i].id.equals(orderedSteps[0].previous)) {
            orderedSteps.insert(0, steps.removeAt(i));
            foundStep = true;
            break;
          }
        }
        if (!foundStep) {
          break;
        }
      }
      // check that we got all the steps
      if (steps.length > 0) {
        print(orderedSteps);
        print(steps);
        throw ("bad step sequencing");
      }
    }

    return orderedSteps;
  }
}