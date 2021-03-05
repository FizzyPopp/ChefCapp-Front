import 'package:chef_capp/index.dart';
import 'package:chef_capp/screens/authentication/onboarding_allergies.dart';
import 'package:provider/provider.dart';

class OnboardingUnits extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.preferences,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: 48.0,
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
                    child: AutoSizeText(
                      "What measurement units do you use?",
                      style: CCText.mobileDisplayLarge,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'VOLUME',
                          style: CCText.tempSubHeader,
                        ),
                        SizedBox(height: 10.0,),
                        Consumer<PreferencesController>(
                          builder: (context, data, _) {
                            return Wrap(
                              children: <Widget>[
                                UnitChip(
                                  firstLabel: 'milliliter, liter',
                                  secondLabel: '(mL,L)',
                                  selected: data.metricVolume,
                                  onSelected:  (bool selected) {
                                    data.metricVolume = true;
                                  },
                                ),
                                SizedBox(width: 8.0,),
                                UnitChip(
                                  firstLabel: 'ounce, gallon',
                                  secondLabel: '(oz, gal.)',
                                  selected: !data.metricVolume,
                                  onSelected:  (bool selected) {
                                    data.metricVolume = false;
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'WEIGHT',
                          style: CCText.tempSubHeader,
                        ),
                        SizedBox(height: 10.0,),
                        Consumer<PreferencesController>(
                          builder: (context, data, _) {
                            return Wrap(
                              children: <Widget>[
                                UnitChip(
                                  firstLabel: 'gram, kilogram',
                                  secondLabel: '(g, kg)',
                                  selected: data.metricWeight,
                                  onSelected:  (bool selected) {
                                    data.metricWeight = true;
                                  },
                                ),
                                SizedBox(width: 8.0,),
                                UnitChip(
                                  firstLabel: 'ounce, pound',
                                  secondLabel: '(oz, lb.)',
                                  selected: !data.metricWeight,
                                  onSelected:  (bool selected) {
                                    data.metricWeight = false;
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'TEMPERATURE',
                          style: CCText.tempSubHeader,
                        ),
                        SizedBox(height: 10.0,),
                        Consumer<PreferencesController>(
                          builder: (context, data, _) {
                            return Wrap(
                              children: <Widget>[
                                UnitChip(
                                  firstLabel: 'Celcius',
                                  selected: data.metricTemperature,
                                  onSelected:  (bool selected) {
                                    data.metricTemperature = true;
                                  },
                                ),
                                SizedBox(width: 8.0,),
                                UnitChip(
                                  firstLabel: 'Fahrenheit',
                                  selected: !data.metricTemperature,
                                  onSelected:  (bool selected) {
                                    data.metricTemperature = false;
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GradientButton(
                          child: Text(
                            "NEXT",
                            style: CCText.darkButton,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnboardingAllergies()
                              ),
                            );
                          },
                          gradient: CCColors.primaryGradient,
                        )
                      ],
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
}

class UnitChip extends StatelessWidget {
  final Function onSelected;
  final bool selected;
  final String firstLabel;
  final String secondLabel;

  final Color myTextColor = CCColors.secondaryDark;
  final Color myActiveTextColor = Colors.white;

  UnitChip({
    @required this.selected,
    @required this.firstLabel,
    this.secondLabel,
    @required this.onSelected,
  });

  Widget fullLabel() {
    if (secondLabel == null) {
      return Text(
        firstLabel,
        style: TextStyle(
          color: selected ? myActiveTextColor : myTextColor,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Text(
              firstLabel,
              style: TextStyle(
                color: selected ? myActiveTextColor : myTextColor,
              ),
            ),
            SizedBox(height: 3.0,),
            Text(
              secondLabel,
              style: TextStyle(
                color: selected ? myActiveTextColor : myTextColor,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: fullLabel(),
      selectedColor: CCColors.secondaryDark,
      backgroundColor: Colors.transparent,
      selected: selected,
      onSelected: onSelected,
      shape: StadiumBorder(
        side: BorderSide(
          color: CCColors.secondaryDark,
          width: 2.0,
        ),
      ),
    );
  }
}

