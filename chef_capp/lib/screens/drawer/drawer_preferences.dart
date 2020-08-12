import 'package:chef_capp/index.dart';

class OnboardingCookingPreferences extends StatefulWidget {
  @override
  _OnboardingCookingPreferencesState createState() => _OnboardingCookingPreferencesState();
}

class _OnboardingCookingPreferencesState extends State<OnboardingCookingPreferences> {
  bool _metricVolume = true;
  bool _metricMass = true;
  bool _metricTemp = true;

  double _chipWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Save'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: xMargins * 2),
              child: Text(
                'Unit preferences',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: gutters,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: xMargins * 2),
              child: Text(
                'What measurements do you use in your kitchen?',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: gutters * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('ml / L')),
                  ),
                  selected: _metricVolume,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricVolume = true;
                    });
                  },
                ),
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('oz / gal')),
                  ),
                  selected: !_metricVolume,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricVolume = false;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('g / kg')),
                  ),
                  selected: _metricMass,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricMass = true;
                    });
                  },
                ),
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('lbs')),
                  ),
                  selected: !_metricMass,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricMass = false;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('Celcius')),
                  ),
                  selected: _metricTemp,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricTemp = true;
                    });
                  },
                ),
                ChoiceChip(
                  label: SizedBox(
                    width: _chipWidth,
                    child: Center(child: Text('Fahrenheit')),
                  ),
                  selected: !_metricTemp,
                  onSelected: (bool selected) {
                    setState(() {
                      _metricTemp = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
