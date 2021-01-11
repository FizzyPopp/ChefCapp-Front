import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class EasyLogin extends StatelessWidget {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 112.0),
                  Text(
                    'Welcome to Chef Capp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5.fontSize,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'CLOSED TEST',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.overline.fontSize,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 48.0),
                  Image.asset(
                    './assets/images/chef_capp_cap.png',
                    height: screenWidth(context) / 3,
                  ),
                  SizedBox(height: 112.0),
                  Text(
                    'Disclaimer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.subtitle2.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'This App is provided on an “as is” and “as available” basis without any'
                      ' representations or warranties, expressed or implied. We are not responsible'
                      ' for any liability, loss, or damage, caused or alleged to be caused directly'
                      ' or indirectly as a result of the use, application, or interpretation of the '
                      'information provided on the App. We make no guarantees regarding the results '
                      'that you will see from using the information provided on the App. You may not'
                      ' achieve desired results due to variations in elements such as ingredients,'
                      ' cooking temperatures, typos, errors, omissions, or individual cooking ability.'
                      ' You should always use your best judgment when cooking with raw ingredients'
                      ' such as eggs, chicken, or seafood and seek expert advice before beginning'
                      ' if you are unsure. Please review all ingredients prior to trying a recipe'
                      ' in order to be fully aware of the presence of substances which might cause'
                      ' an adverse reaction. You should always take care when using sharp knives or'
                      ' other cooking implements. To ensure the safety of yourself and others, be'
                      ' aware of heated cooking surfaces while cooking. Content related to nutrition'
                      ' is not medical advice nor is it intended to replace medical advice. Unless'
                      ' otherwise stated, the recipes featured on the App are not endorsed by any'
                      ' other companies/organization or their affiliates.',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.caption.fontSize,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'I have read and understood the above terms. By clicking “Start”, I agree to the terms above.',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.caption.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Consumer<AuthController>(
                      builder: (context, data, _) {
                        return
                          RaisedButton(
                            child: Text(
                              "Huh",
                              style: TextStyle(
                                color: Colors.deepOrange[900]
                              ),
                            ),
                            color: Colors.white,
                            onPressed: () { print("button pressed in easy_login.dart"); },
                          );
                      }
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),

            //minimum: EdgeInsets.symmetric(vertical: xMargins),
          ),
        ),
      )
    );
  }
}
