import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class DietPrefs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: ParentController.auth,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.deepOrange[900]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
            child: SafeArea(
                child: Column(
                    children: [
                      Text("Diet Preferences"),
                      RaisedButton(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.deepOrange[900]
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () { ParentController.auth.handleDietPrefsNext(context); },
                      ),
                    ]
                )
              //minimum: EdgeInsets.symmetric(vertical: xMargins),
            ),
          ),
        )
    );
  }
}
