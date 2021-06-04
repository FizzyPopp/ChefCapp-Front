import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class OnboardingDietaryRestrictions extends StatelessWidget {
  bool _chipSelectedDemo = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.preferences,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 48.0,
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 14.0,
                    color: CCText.lightButton.color,
                  ),
                  label: Text(
                    'BACK',
                    style: CCText.lightButton,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Do you have any dietary preferences?",
                      style: CCText.mobileDisplayLarge(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Select the food groups members of your household would"
                          " like to avoid:",
                      style: CCText.mobileDisplaySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 0,
                    ),
                    child: Consumer<PreferencesController>(
                      builder: (context, data, _) {
                        return Wrap(
                          children: data.dietaryCategories.map((x) => PreferenceChip(
                            label: x["name"],
                            selected: x["selected"],
                            onSelected: (bool selected) {
                              data.updateDietaryCategory(x["name"], selected);
                            },
                          )).toList(),
                          spacing: 8.0,
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Want to avoid specific ingredients?",
                      style: CCText.mobileDisplaySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Consumer<PreferencesController>(
                      builder: (context, data, _) {
                        return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search',
                          ),
                          onChanged: (text) {
                            data.filterIngredients(text);
                          }
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 0,
                    ),
                    child: Consumer<PreferencesController>(
                      builder: (context, data, _) {
                        return Wrap(
                          children: getChips(data),
                            spacing: 8.0
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Chef Capp will personalize your recipe feed based on your "
                          "dietary preferences.",
                      style: CCText.mobileTextSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: Consumer<PreferencesController>(
                      builder: (context, data, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GradientButton(
                              child: Text(
                                "NEXT",
                                style: CCText.darkButton,
                              ),
                              onPressed: () {
                                data.done(context);
                              },
                              gradient: CCColors.primaryGradient,
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getChips (PreferencesController data) {
    List<DBIngredient> first = [];
    for (final id in data.dietaryIngredients) {
      first.add(data.allIngredients.where((ingr) => ingr.id == id).toList()[0]);
    }
    List<DBIngredient> second = data.filteredIngredients.where((ingr) => !data.dietaryIngredients.contains(ingr.id)).where((ingr) => !data.allergenIngredients.contains(ingr.id)).toList();

    List<Widget> firstWidgets = first.map((ingr) =>
        PreferenceChip(
            label: ingr.name,
            selected: true,
            onSelected: (bool selected) {
              data.updateDietaryIngredient(ingr.id, selected);
            }
        )
    ).toList();

    List<Widget> secondWidgets = second.map((ingr) =>
        PreferenceChip(
            label: ingr.name,
            selected: false,
            onSelected: (bool selected) {
              data.updateDietaryIngredient(ingr.id, selected);
            }
        )
    ).toList();

    return (new List.from(firstWidgets)..addAll(secondWidgets));
  }
}
