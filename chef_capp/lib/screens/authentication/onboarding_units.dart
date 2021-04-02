import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';
import 'package:chef_capp/screens/authentication/onboarding_allergies.dart';

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
                      "What measurement units do you use?",
                      style: CCText.mobileDisplayLarge(context),
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

