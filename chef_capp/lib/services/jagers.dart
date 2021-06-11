import 'package:chef_capp/index.dart';

class Jagers {
  Jagers._();

  static final Map<String,Icon> _icons = {
    "eggs": Icon(CCIcons.allergyEggs),
    "fish": Icon(CCIcons.allergyFish),
    "dairy": Icon(CCIcons.allergyMilk),
    "peanuts": Icon(CCIcons.allergyPeanuts),
    "soy": Icon(CCIcons.allergySoybeans),
    "shellfish": Icon(CCIcons.allergyShellfish),
    "tree nuts": Icon(CCIcons.allergyTreeNuts),
    "wheat": Icon(CCIcons.allergyWheat),
  };

  static Widget ingredientIcon(Ingredient ingredient) {
    Widget out = SizedBox(height: 0, width: 0,);
    //var allergenList = ParentController.preferences.allergenCategories;

    for (String type in ingredient.allergens) {
      //if (allergenList.contains(type)) {
      if(_icons.containsKey(type)) {
        out = _icons[type];
        break;
      }
    }

    return out;
  }
}
